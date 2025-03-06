DELIMITER $$

CREATE TRIGGER afterInsertMatch
AFTER INSERT ON Matches
FOR EACH ROW
BEGIN
    -- Update winner's ranking (+10 points)
    IF NEW.winner_id IS NOT NULL THEN
        UPDATE Players
        SET ranking = ranking + 10
        WHERE player_id = NEW.winner_id;
    END IF;

    -- Update loser's ranking (-5 points) if the match was not a draw
    IF NEW.winner_id IS NOT NULL THEN
        UPDATE Players
        SET ranking = ranking - 5
        WHERE player_id IN (NEW.player1_id, NEW.player2_id)
        AND player_id <> NEW.winner_id;  -- Ensure we update the loser only
    END IF;
END $$

DELIMITER ;