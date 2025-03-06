DELIMITER $$

DROP TRIGGER IF EXISTS beforeInsertRegistration$$

CREATE TRIGGER beforeInsertRegistration 
BEFORE INSERT ON Tournament_Registrations
FOR EACH ROW
BEGIN
    DECLARE current_players INT;
    DECLARE max_allowed INT;

    -- Get current number of registered players for this tournament
    SELECT COUNT(*) INTO current_players
    FROM Tournament_Registrations
    WHERE tournament_id = NEW.tournament_id;

    -- Get the max number of players allowed for the tournament
    SELECT max_players INTO max_allowed
    FROM Tournaments
    WHERE tournament_id = NEW.tournament_id
    LIMIT 1;

    -- If the tournament is full, prevent the insert and raise an error
    IF max_allowed IS NOT NULL AND current_players >= max_allowed THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Tournament is full';
    END IF;
END$$

DELIMITER ;
