DELIMITER $$

CREATE FUNCTION getTournamentStatus(tournament_id INT) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE status VARCHAR(20);

    SELECT 
        CASE 
            WHEN start_date > NOW() THEN 'upcoming'
            WHEN start_date <= NOW() AND start_date + INTERVAL 1 DAY > NOW() THEN 'ongoing'
            ELSE 'completed'
        END
    INTO status
    FROM Tournaments
    WHERE tournament_id = tournament_id
    LIMIT 1;

    RETURN status;
END $$

DELIMITER ;
