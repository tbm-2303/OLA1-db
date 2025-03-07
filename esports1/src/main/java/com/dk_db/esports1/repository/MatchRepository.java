package com.dk_db.esports1.repository;

import com.dk_db.esports1.model.Match;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface MatchRepository extends JpaRepository<Match, Integer> {

    // calling the stored procedure
    @Modifying
    @Transactional
    @Query(value = "CALL submitMatchResult(:matchId, :winnerId)", nativeQuery = true)
    void submitMatchResultProcedure(int matchId, int winnerId);



    @Query("SELECT m FROM Match m WHERE m.matchId = :matchId")
    Match findMatchById(int matchId);

    // Spring Data JPA (via @Query) automatically parameterizes queries
    @Modifying
    @Transactional
    @Query("UPDATE Match m SET m.winner = (SELECT p FROM Player p WHERE p.playerId = :winnerId) WHERE m.matchId = :matchId")
    void submitMatchResultWithoutProcedure(int matchId, int winnerId);
}
