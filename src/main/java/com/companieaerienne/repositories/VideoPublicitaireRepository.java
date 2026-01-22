package com.companieaerienne.repositories;

import com.companieaerienne.entities.VideoPublicitaire;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VideoPublicitaireRepository extends JpaRepository<VideoPublicitaire, Long> {
    
    List<VideoPublicitaire> findBySocieteId(Long societeId);
    
    List<VideoPublicitaire> findAllByActifTrue();
    
    List<VideoPublicitaire> findBySocieteIdAndActifTrue(Long societeId, Boolean actif);
    
    List<VideoPublicitaire> findBySocieteIdOrderByDateCreationDesc(Long societeId);
}
