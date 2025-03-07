package com.dk_db.esports1.service;
import com.dk_db.esports1.model.Player;
import com.dk_db.esports1.model.Tournament;
import com.dk_db.esports1.repository.PlayerRepository;
import com.dk_db.esports1.repository.TournamentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TournamentService {

    private final TournamentRepository tournamentRepository;
    private final PlayerRepository playerRepository;

    @Autowired
    public TournamentService(TournamentRepository tournamentRepository, PlayerRepository playerRepository) {
        this.tournamentRepository = tournamentRepository;
        this.playerRepository = playerRepository;
    }

    public void joinTournament(int playerId, int tournamentId) {
        try {
            System.out.println("Calling stored procedure: joinTournament");
            tournamentRepository.joinTournamentProcedure(playerId, tournamentId);
        } catch (Exception e) {
            throw new RuntimeException("Error joining tournament: " + e.getMessage());
        }
    }

    public void joinTournamentWithoutProcedure(int tournamentId, int playerId) {

        // Check if tournament exists
        Tournament tournament = tournamentRepository.findById(tournamentId)
                .orElseThrow(() -> new RuntimeException("Tournament not found"));
        // Check if player exists
        Player player = playerRepository.findById(playerId)
                .orElseThrow(() -> new RuntimeException("Player not found"));

        // Check if the player is already registered
        boolean isAlreadyRegistered = tournamentRepository.isPlayerRegistered(tournamentId, playerId);
        if (isAlreadyRegistered) {
            throw new RuntimeException("Player is already registered in this tournament");
        }

        // Check if the tournament is full
        int currentPlayerCount = tournamentRepository.countPlayersInTournament(tournamentId);
        if (currentPlayerCount >= tournament.getMaxPlayers()) {
            throw new RuntimeException("Tournament is already full");
        }

        tournamentRepository.joinTournamentWithoutProcedure(tournamentId, playerId);
    }


}