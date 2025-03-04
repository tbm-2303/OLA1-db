SELECT winner_id, COUNT(*) AS total_wins
FROM Matches
WHERE tournament_id = 1
GROUP BY winner_id
ORDER BY total_wins DESC
LIMIT 1;




SELECT * FROM Matches
WHERE player1_id = 1 OR player2_id = 1;




SELECT T.tournament_id, T.name, T.game, T.start_date
FROM Tournament_Registrations TR
JOIN Tournaments T ON TR.tournament_id = T.tournament_id
WHERE TR.player_id = 1;





SELECT * FROM Players
ORDER BY ranking DESC
LIMIT 5;




SELECT AVG(ranking) AS average_ranking FROM Players;





SELECT T.tournament_id, T.name, COUNT(TR.player_id) AS num_players
FROM Tournaments T
JOIN Tournament_Registrations TR ON T.tournament_id = TR.tournament_id
GROUP BY T.tournament_id
HAVING num_players >= 5;




SELECT COUNT(*) AS total_players FROM Players;



SELECT * FROM Matches WHERE winner_id IS NULL;



SELECT game, COUNT(*) AS total_tournaments
FROM Tournaments
GROUP BY game
ORDER BY total_tournaments DESC;



SELECT * FROM Tournaments
ORDER BY created_at DESC
LIMIT 5;


SELECT player_id, COUNT(tournament_id) AS total_tournaments
FROM Tournament_Registrations
GROUP BY player_id
HAVING total_tournaments > 3;

SELECT * FROM Matches
WHERE tournament_id = 1
ORDER BY match_date;