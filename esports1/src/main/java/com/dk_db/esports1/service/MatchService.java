package com.dk_db.esports1.service;

import com.dk_db.esports1.model.Match;
import com.dk_db.esports1.repository.MatchRepository;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MatchService {

    private final MatchRepository matchRepository;

    @Autowired
    public MatchService(MatchRepository matchRepository) {
        this.matchRepository = matchRepository;
    }

    @Transactional
    public void submitMatchResult(int matchId, int winnerId) {
        try {
            System.out.println("Calling stored procedure: submitMatchResult");
            matchRepository.submitMatchResultProcedure(matchId, winnerId);
        } catch (Exception e) {
            throw new RuntimeException("Error submitting match result: " + e.getMessage());
        }
    }


    @Transactional
    public void submitMatchResultWithoutProcedure(int matchId, int winnerId) {
        // Fetch match details manually
        Match match = matchRepository.findMatchById(matchId);

        if (match == null) {
            throw new RuntimeException("Match not found with ID: " + matchId);
        }

        int player1Id = match.getPlayer1().getPlayerId();
        int player2Id = match.getPlayer2().getPlayerId();

        // Validate that the winner is one of the match players
        if (winnerId == player1Id || winnerId == player2Id) {
            matchRepository.submitMatchResultWithoutProcedure(matchId, winnerId);
        } else {
            throw new RuntimeException("Invalid winner ID: Winner must be one of the match players");
        }
    }

}