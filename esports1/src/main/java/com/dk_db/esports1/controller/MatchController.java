package com.dk_db.esports1.controller;

import com.dk_db.esports1.service.MatchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/match")
public class MatchController {

    private final MatchService matchService;

    @Autowired
    public MatchController(MatchService matchService) {
        this.matchService = matchService;
    }
    // This endpoint calls the stored procedure that we created and defined in mySQL
    @PostMapping("/submit/{matchId}/{winnerId}")
    public ResponseEntity<String> submitMatchResult(@PathVariable int matchId, @PathVariable int winnerId) {
        try {
            matchService.submitMatchResult(matchId, winnerId);
            return ResponseEntity.ok("Match " + matchId + " updated: Winner - " + winnerId);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body("Error: " + e.getMessage());
        }
    }


    @PostMapping("/submitNoPro/{matchId}/{winnerId}")
    public ResponseEntity<String> submitMatchResultWithoutProcedure(@PathVariable int matchId, @PathVariable int winnerId) {
        try {
            matchService.submitMatchResultWithoutProcedure(matchId, winnerId);
            return ResponseEntity.ok("Match " + matchId + " updated: Winner - " + winnerId);
        } catch (RuntimeException e) {
            return ResponseEntity.badRequest().body("Error: " + e.getMessage());
        }
    }

}
