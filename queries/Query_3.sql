-- Vis en liste over spillere registreret i en bestemt turnering
SELECT P.player_id, P.username, P.email, TR.tournament_id
FROM Tournament_Registrations TR
JOIN Players P ON TR.player_id = P.player_id
WHERE TR.tournament_id = 1;