-- Find det antal turneringer, en spiller har deltaget i
SELECT player_id, COUNT(tournament_id) AS total_tournaments
FROM Tournament_Registrations
GROUP BY player_id;