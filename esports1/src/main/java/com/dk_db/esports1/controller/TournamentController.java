package com.dk_db.esports1.controller;
import com.dk_db.esports1.service.TournamentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/tournament")
public class TournamentController {

    private final TournamentService tournamentService;

    @Autowired
    public TournamentController(TournamentService tournamentService) {
        this.tournamentService = tournamentService;
    }

    // This endpoint calls the stored procedure that we created and defined in mySQL
    @PostMapping("/join/{playerId}/{tournamentId}")
    public ResponseEntity<String> joinTournament(@PathVariable int playerId, @PathVariable int tournamentId) {

        try {
            tournamentService.joinTournament(playerId, tournamentId);
            return ResponseEntity.ok("Player " + playerId + " joined Tournament " + tournamentId);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body("Error: " + e.getMessage());
        }
    }


    @PostMapping("/joinNoPro/{playerId}/{tournamentId}")
    public ResponseEntity<String> joinTournamentWithoutProcedure(@PathVariable int playerId, @PathVariable int tournamentId) {
        try {
            tournamentService.joinTournamentWithoutProcedure(playerId, tournamentId);
            return ResponseEntity.ok("Player " + playerId + " joined Tournament " + tournamentId);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body("Error: " + e.getMessage());
        }
    }





}