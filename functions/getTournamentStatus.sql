DELIMITER $$

CREATE FUNCTION getTournamentStatus(tournament_id INT) 
RETURNS VARCHAR(20) DETERMINISTIC
BEGIN
    DECLARE status VARCHAR(20);
    DECLARE tournament_start DATE;
    DECLARE matches_count INT;
    DECLARE completed_matches_count INT;
    
    -- Find startdato for turneringen
    SELECT start_date INTO tournament_start 
    FROM Tournaments
    WHERE tournament_id = tournament_id;
    
    -- Tæl hvor mange kampe der er i turneringen
    SELECT COUNT(*) INTO matches_count
    FROM Matches
    WHERE tournament_id = tournament_id;

    -- Tæl hvor mange kampe der har en vinder
    SELECT COUNT(*) INTO completed_matches_count
    FROM Matches
    WHERE tournament_id = tournament_id AND winner_id IS NOT NULL;
    
    -- Bestem status
    IF CURDATE() < tournament_start THEN
        SET status = 'upcoming';
    ELSEIF completed_matches_count = matches_count THEN
        SET status = 'completed';
    ELSE
        SET status = 'ongoing';
    END IF;
    
    RETURN status;
END $$

DELIMITER ;
