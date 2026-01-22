package com.companieaerienne.repositories;

import com.companieaerienne.entities.AvionPilote;
import com.companieaerienne.entities.AvionPiloteId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AvionPiloteRepository extends JpaRepository<AvionPilote, AvionPiloteId> {
}
