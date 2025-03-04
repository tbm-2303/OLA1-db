DELIMITER //

CREATE PROCEDURE submitMatchResult(
    IN p_match_id INT,
    IN p_winner_id INT
)
BEGIN
    DECLARE p_tournament_id INT;
    DECLARE p_player1_id INT;
    DECLARE p_player2_id INT;
    
    -- Hent turnerings- og spilleroplysninger for kampen
    SELECT tournament_id, player1_id, player2_id
    INTO p_tournament_id, p_player1_id, p_player2_id
    FROM Matches
    WHERE match_id = p_match_id;
    
    -- Sikrer at vinder-id er en af de spillere, der deltog i kampen
    IF p_winner_id IN (p_player1_id, p_player2_id) THEN
        -- Opdater kampen med vinder-id
        UPDATE Matches
        SET winner_id = p_winner_id
        WHERE match_id = p_match_id;
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid winner ID: Winner must be one of the match players';
    END IF;
END //

DELIMITER ;
