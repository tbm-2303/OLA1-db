-- Opret database
CREATE DATABASE esports_tournament;
USE esports_tournament;

-- Opret Players tabel
CREATE TABLE Players (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    ranking INT DEFAULT 0 NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Opret Tournaments tabel
CREATE TABLE Tournaments (
    tournament_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    game VARCHAR(50) NOT NULL,
    max_players INT NOT NULL,
    start_date DATETIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Opret Tournament_Registrations tabel
CREATE TABLE Tournament_Registrations (
    registration_id INT AUTO_INCREMENT PRIMARY KEY,
    tournament_id INT NOT NULL,
    player_id INT NOT NULL,
    registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id) ON DELETE CASCADE,
    FOREIGN KEY (player_id) REFERENCES Players(player_id) ON DELETE CASCADE
);

-- Opret Matches tabel
CREATE TABLE Matches (
    match_id INT AUTO_INCREMENT PRIMARY KEY,
    tournament_id INT NOT NULL,
    player1_id INT NOT NULL,
    player2_id INT NOT NULL,
    winner_id INT NULL,
    match_date DATETIME NOT NULL,
    FOREIGN KEY (tournament_id) REFERENCES Tournaments(tournament_id) ON DELETE CASCADE,
    FOREIGN KEY (player1_id) REFERENCES Players(player_id) ON DELETE CASCADE,
    FOREIGN KEY (player2_id) REFERENCES Players(player_id) ON DELETE CASCADE,
    FOREIGN KEY (winner_id) REFERENCES Players(player_id) ON DELETE SET NULL
);

-- Indsæt testdata i Players\
INSERT INTO Players (username, email, ranking) VALUES
('Gamer1', 'gamer1@example.com', 1200),
('Gamer2', 'gamer2@example.com', 1300),
('Gamer3', 'gamer3@example.com', 1100);

-- Indsæt testdata i Tournaments
INSERT INTO Tournaments (name, game, max_players, start_date) VALUES
('Summer Showdown', 'CS:GO', 16, '2024-07-15 18:00:00'),
('Winter Cup', 'Valorant', 32, '2024-12-10 20:00:00');

-- Indsæt testdata i Tournament_Registrations
INSERT INTO Tournament_Registrations (tournament_id, player_id) VALUES
(1, 1),
(1, 2),
(2, 3);

-- Indsæt testdata i Matches
INSERT INTO Matches (tournament_id, player1_id, player2_id, winner_id, match_date) VALUES
(1, 1, 2, 1, '2024-07-16 19:00:00'),
(2, 3, 1, 3, '2024-12-11 21:00:00');
