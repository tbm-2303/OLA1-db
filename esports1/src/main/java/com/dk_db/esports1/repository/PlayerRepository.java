package com.dk_db.esports1.repository;
import com.dk_db.esports1.model.Player;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PlayerRepository extends JpaRepository<Player, Integer> {
}
