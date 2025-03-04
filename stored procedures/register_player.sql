DELIMITER //

CREATE PROCEDURE registerPlayer(
    IN p_username VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_ranking INT
)
BEGIN
    INSERT INTO Players (username, email, ranking, created_at)
    VALUES (p_username, p_email, p_ranking, NOW());
END //

DELIMITER ;
