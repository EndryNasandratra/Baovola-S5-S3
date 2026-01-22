package com.companieaerienne.repositories;

import com.companieaerienne.entities.RemiseTarif;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface RemiseTarifRepository extends JpaRepository<RemiseTarif, Integer> {
    List<RemiseTarif> findByVolProgrammationId(Integer volProgrammationId);
    List<RemiseTarif> findByVolProgrammationIsNull();
    
    java.util.Optional<RemiseTarif> findByVolProgrammationIdAndClasseIdAndTypePassagerAppliquerId(
        Integer volProgrammationId, Integer classeId, Integer typePassagerAppliquerId);
}
