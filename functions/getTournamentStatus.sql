DELIMITER $$

CREATE FUNCTION getTournamentStatus(tournament_id INT) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE status VARCHAR(20);

    SELECT 
        CASE 
            WHEN start_date > CURDATE() THEN 'upcoming'
            WHEN start_date = CURDATE() THEN 'ongoing'
            ELSE 'completed'
        END
    INTO status
    FROM Tournaments
    WHERE tournament_id = tournament_id
    LIMIT 1;

    RETURN status;
END $$

DELIMITER ;
