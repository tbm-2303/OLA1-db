package com.dk_db.esports1.model;
import jakarta.persistence.*;

import java.time.LocalDateTime;


@Entity
@Table(name = "Tournament_Registrations")
public class TournamentRegistration {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "registration_id")
    private int registrationId;

    @ManyToOne
    @JoinColumn(name = "tournament_id", nullable = false)
    private Tournament tournament;

    @ManyToOne
    @JoinColumn(name = "player_id", nullable = false)
    private Player player;

    @Column(name = "registered_at", nullable = false)
    private LocalDateTime registeredAt;

    // Getters and setters
}
