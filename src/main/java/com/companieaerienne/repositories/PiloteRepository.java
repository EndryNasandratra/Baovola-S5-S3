package com.companieaerienne.repositories;

import com.companieaerienne.entities.Pilote;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface PiloteRepository extends JpaRepository<Pilote, Integer> {
}
