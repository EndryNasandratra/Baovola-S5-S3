package com.companieaerienne.repositories;

import com.companieaerienne.entities.TarifDiffusionPublicite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Repository
public interface TarifDiffusionPubliciteRepository extends JpaRepository<TarifDiffusionPublicite, Long> {
    
    @Query("SELECT t FROM TarifDiffusionPublicite t WHERE t.actif = true " +
           "AND t.dateDebut <= :date " +
           "AND (t.dateFin IS NULL OR t.dateFin >= :date) " +
           "ORDER BY t.dateDebut DESC")
    Optional<TarifDiffusionPublicite> findTarifActuelAt(LocalDateTime date);
    
    default Optional<TarifDiffusionPublicite> findTarifActuel() {
        return findTarifActuelAt(LocalDateTime.now());
    }
    
    List<TarifDiffusionPublicite> findAllByOrderByDateDebutDesc();
    
    List<TarifDiffusionPublicite> findByActifTrueOrderByDateDebutDesc();
}
