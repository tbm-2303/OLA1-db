DELIMITER $$

DROP FUNCTION IF EXISTS getTournamentStatus$$

CREATE FUNCTION getTournamentStatus(input_tournament_id INT) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE status VARCHAR(20);
    DECLARE start_time DATETIME;
    
    -- Check if the tournament exists and fetch the start_date
    SELECT start_date INTO start_time
    FROM Tournaments
    WHERE tournament_id = input_tournament_id
    LIMIT 1;

    -- If no tournament is found, return an error
    IF start_time IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Tournament ID not found';
    END IF;

    -- Determine tournament status based on the 24-hour rule
    IF start_time > NOW() THEN
        SET status = 'upcoming';
    ELSEIF NOW() <= start_time + INTERVAL 24 HOUR THEN
        SET status = 'ongoing';
    ELSE
        SET status = 'completed';
    END IF;

    RETURN status;
END $$

DELIMITER ;
