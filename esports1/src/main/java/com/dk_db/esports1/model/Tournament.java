package com.dk_db.esports1.model;
import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "Tournaments")
public class Tournament {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tournament_id")
    private int tournamentId;

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "game", nullable = false)
    private String game;

    @Column(name = "max_players", nullable = false)
    private int maxPlayers;

    @Column(name = "start_date", nullable = false)
    private LocalDateTime startDate;

    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    // Getters and setters


    public int getMaxPlayers() {
        return maxPlayers;
    }
}
