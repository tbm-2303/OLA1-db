package com.dk_db.esports1.repository;
import com.dk_db.esports1.model.Tournament;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;


@Repository
public interface TournamentRepository extends JpaRepository<Tournament, Integer> {

    // calling the stored procedure
    @Modifying
    @Transactional
    @Query(value = "CALL joinTournament(:playerId, :tournamentId)", nativeQuery = true)
    void joinTournamentProcedure(int playerId, int tournamentId);



    @Query("SELECT COUNT(tr) FROM TournamentRegistration tr WHERE tr.tournament.tournamentId = :tournamentId")
    int countPlayersInTournament(@Param("tournamentId") int tournamentId);

    //Spring Data JPA (via @Query)
    @Modifying
    @Transactional
    @Query(value = "INSERT INTO tournament_registrations (tournament_id, player_id) VALUES (:tournamentId, :playerId)", nativeQuery = true)
    void joinTournamentWithoutProcedure(@Param("tournamentId") int tournamentId, @Param("playerId") int playerId);

    @Query("SELECT COUNT(tr) > 0 FROM TournamentRegistration tr WHERE tr.tournament.tournamentId = :tournamentId AND tr.player.playerId = :playerId")
    boolean isPlayerRegistered(@Param("tournamentId") int tournamentId, @Param("playerId") int playerId);





}