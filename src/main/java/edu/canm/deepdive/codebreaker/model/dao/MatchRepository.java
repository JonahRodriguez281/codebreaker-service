package edu.canm.deepdive.codebreaker.model.dao;

import edu.canm.deepdive.codebreaker.model.entity.Match;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MatchRepository extends JpaRepository<Match, UUID> {

  // TODO Add method to get matches for a specific user.

}
