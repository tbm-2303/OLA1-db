-- 4. Find the players with the most wins in a specific tournament
SELECT winner_id, COUNT(*) AS total_wins
FROM Matches
WHERE tournament_id = 1
GROUP BY winner_id
ORDER BY total_wins DESC
LIMIT 1;

-- 5. Retrieve all matches where a specific player has participated
SELECT * FROM Matches
WHERE player1_id = 1 OR player2_id = 1;

-- 6. Retrieve tournaments a specific player has registered for
SELECT T.tournament_id, T.name, T.game, T.start_date
FROM Tournament_Registrations TR
JOIN Tournaments T ON TR.tournament_id = T.tournament_id
WHERE TR.player_id = 1;

-- 7. Find the top 5 highest-ranked players
SELECT * FROM Players
ORDER BY ranking DESC
LIMIT 5;

-- 8. Calculate the average ranking of all players
SELECT AVG(ranking) AS average_ranking FROM Players;

-- 9. Retrieve tournaments with at least 5 participants
SELECT T.tournament_id, T.name, COUNT(TR.player_id) AS num_players
FROM Tournaments T
JOIN Tournament_Registrations TR ON T.tournament_id = TR.tournament_id
GROUP BY T.tournament_id
HAVING num_players >= 5;

-- 10. Count the total number of players in the system
SELECT COUNT(*) AS total_players FROM Players;

-- 11. Retrieve all matches that do not have a winner yet
SELECT * FROM Matches WHERE winner_id IS NULL;

-- 12. Retrieve the most popular games based on the number of tournaments
SELECT game, COUNT(*) AS total_tournaments
FROM Tournaments
GROUP BY game
ORDER BY total_tournaments DESC;

-- 13. Retrieve the 5 most recently created tournaments
SELECT * FROM Tournaments
ORDER BY created_at DESC
LIMIT 5;

-- 14. Find players who have registered for more than 3 tournaments
SELECT player_id, COUNT(tournament_id) AS total_tournaments
FROM Tournament_Registrations
GROUP BY player_id
HAVING total_tournaments > 3;

-- 15. Retrieve all matches in a specific tournament sorted by date
SELECT * FROM Matches
WHERE tournament_id = 1
ORDER BY match_date;
