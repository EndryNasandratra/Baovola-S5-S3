package com.companieaerienne.repositories;

import com.companieaerienne.entities.TarifVol;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface TarifVolRepository extends JpaRepository<TarifVol, Integer> {
    List<TarifVol> findByVolProgrammationId(Integer volProgrammationId);
}
