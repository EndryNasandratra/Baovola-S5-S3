package com.companieaerienne.repositories;

import com.companieaerienne.entities.StatutVol;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StatutVolRepository extends JpaRepository<StatutVol, Integer> {
}
