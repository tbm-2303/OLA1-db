DELIMITER //

CREATE PROCEDURE joinTournament(
    IN p_player_id INT,
    IN p_tournament_id INT
)
BEGIN
    -- Tjek om spilleren allerede er registreret i turneringen
    IF NOT EXISTS (
        SELECT 1 FROM Tournament_Registrations
        WHERE player_id = p_player_id AND tournament_id = p_tournament_id
    ) THEN
        -- Indsæt spilleren i turneringen
        INSERT INTO Tournament_Registrations (player_id, tournament_id, registered_at)
        VALUES (p_player_id, p_tournament_id, NOW());
    END IF;
END //

DELIMITER ;
