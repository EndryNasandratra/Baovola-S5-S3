package com.companieaerienne.repositories;

import com.companieaerienne.entities.SocieteAnnonceur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SocieteAnnonceurRepository extends JpaRepository<SocieteAnnonceur, Long> {
    
    List<SocieteAnnonceur> findAllByActifTrue();
    
    List<SocieteAnnonceur> findByNomContainingIgnoreCase(String nom);
    
    List<SocieteAnnonceur> findByActifOrderByNomAsc(Boolean actif);
}
