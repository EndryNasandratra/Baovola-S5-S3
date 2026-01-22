package com.companieaerienne.repositories;

import com.companieaerienne.entities.VolProgrammation;
import com.companieaerienne.entities.Vol;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.time.LocalDateTime;
import java.util.List;

@Repository
public interface VolProgrammationRepository extends JpaRepository<VolProgrammation, Integer> {
    List<VolProgrammation> findByVol(Vol vol);
    List<VolProgrammation> findByDateHeureAfter(LocalDateTime dateHeure);
}
