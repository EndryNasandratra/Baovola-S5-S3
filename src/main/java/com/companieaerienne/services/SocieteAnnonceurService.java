package com.companieaerienne.services;

import com.companieaerienne.entities.SocieteAnnonceur;
import com.companieaerienne.repositories.SocieteAnnonceurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class SocieteAnnonceurService {
    
    @Autowired
    private SocieteAnnonceurRepository societeRepository;
    
    public List<SocieteAnnonceur> findAll() {
        return societeRepository.findAll();
    }
    
    public List<SocieteAnnonceur> findAllActives() {
        return societeRepository.findAllByActifTrue();
    }
    
    public Optional<SocieteAnnonceur> findById(Long id) {
        return societeRepository.findById(id);
    }
    
    public SocieteAnnonceur save(SocieteAnnonceur societe) {
        if (societe.getId() == null) {
            societe.setDateInscription(LocalDateTime.now());
        }
        return societeRepository.save(societe);
    }
    
    public void deleteById(Long id) {
        societeRepository.deleteById(id);
    }
    
    public void toggleActif(Long id) {
        Optional<SocieteAnnonceur> societeOpt = societeRepository.findById(id);
        if (societeOpt.isPresent()) {
            SocieteAnnonceur societe = societeOpt.get();
            societe.setActif(!societe.getActif());
            societeRepository.save(societe);
        }
    }
    
    public List<SocieteAnnonceur> search(String nom) {
        return societeRepository.findByNomContainingIgnoreCase(nom);
    }
}
