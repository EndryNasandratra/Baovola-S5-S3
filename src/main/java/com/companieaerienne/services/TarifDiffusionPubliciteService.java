package com.companieaerienne.services;

import com.companieaerienne.entities.TarifDiffusionPublicite;
import com.companieaerienne.repositories.TarifDiffusionPubliciteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class TarifDiffusionPubliciteService {
    
    @Autowired
    private TarifDiffusionPubliciteRepository tarifRepository;
    
    public List<TarifDiffusionPublicite> findAll() {
        return tarifRepository.findAllByOrderByDateDebutDesc();
    }
    
    public List<TarifDiffusionPublicite> findAllActifs() {
        return tarifRepository.findByActifTrueOrderByDateDebutDesc();
    }
    
    public Optional<TarifDiffusionPublicite> findById(Long id) {
        return tarifRepository.findById(id);
    }
    
    public Optional<TarifDiffusionPublicite> findTarifActuel() {
        return tarifRepository.findTarifActuel();
    }
    
    public BigDecimal getTarifActuel() {
        return findTarifActuel()
                .map(TarifDiffusionPublicite::getMontant)
                .orElse(BigDecimal.valueOf(400000)); // Valeur par défaut
    }
    
    public TarifDiffusionPublicite save(TarifDiffusionPublicite tarif) {
        // Si nouveau tarif, désactiver l'ancien tarif actuel
        if (tarif.getId() == null && tarif.getActif()) {
            Optional<TarifDiffusionPublicite> ancienTarif = findTarifActuel();
            if (ancienTarif.isPresent()) {
                TarifDiffusionPublicite ancien = ancienTarif.get();
                ancien.setDateFin(LocalDateTime.now());
                ancien.setActif(false);
                tarifRepository.save(ancien);
            }
        }
        return tarifRepository.save(tarif);
    }
    
    public void deleteById(Long id) {
        tarifRepository.deleteById(id);
    }
}
