-- Hent alle turneringer, der starter inden for de næste 30 dage
SELECT * 
FROM Tournaments 
WHERE start_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);