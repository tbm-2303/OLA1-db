package com.dk_db.esports1.service;
import com.dk_db.esports1.model.Player;
import com.dk_db.esports1.repository.PlayerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class PlayerService {

    @Autowired
    private PlayerRepository playerRepository;

    // Get all players
    public List<Player> getAllPlayers() {
        return playerRepository.findAll();
    }

    // Get player by ID
    public Optional<Player> getPlayerById(int id) {
        return playerRepository.findById(id);

    }

    // Add a new player
    public Player addPlayer(Player player) {
        return playerRepository.save(player);
    }

    // Update a player
    public Player updatePlayer(int id, Player playerDetails) {
        if (playerRepository.existsById(id)) {
            playerDetails.setPlayerId(id);
            return playerRepository.save(playerDetails);
        }
        return null;
    }

    // Delete a player
    public void deletePlayer(int id) {
        playerRepository.deleteById(id);
    }
}
