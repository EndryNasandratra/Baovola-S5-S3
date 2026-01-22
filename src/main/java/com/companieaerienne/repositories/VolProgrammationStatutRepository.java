package com.companieaerienne.repositories;

import com.companieaerienne.entities.VolProgrammationStatut;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VolProgrammationStatutRepository extends JpaRepository<VolProgrammationStatut, Integer> {
}
