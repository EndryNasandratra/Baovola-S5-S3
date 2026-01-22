package com.companieaerienne.services;

import com.companieaerienne.entities.DiffusionPublicite;
import com.companieaerienne.repositories.DiffusionPubliciteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class DiffusionPubliciteService {
    
    @Autowired
    private DiffusionPubliciteRepository diffusionRepository;
    
    @Autowired
    private TarifDiffusionPubliciteService tarifService;
    
    public List<DiffusionPublicite> findAll() {
        return diffusionRepository.findAllByOrderByDateDiffusionDesc();
    }
    
    public Optional<DiffusionPublicite> findById(Long id) {
        return diffusionRepository.findById(id);
    }
    
    public List<DiffusionPublicite> findByVol(Long volProgrammationId) {
        return diffusionRepository.findByVolProgrammationId(volProgrammationId);
    }
    
    public List<DiffusionPublicite> findByVideo(Long videoId) {
        return diffusionRepository.findByVideoId(videoId);
    }
    
    public List<DiffusionPublicite> findBySociete(Long societeId) {
        return diffusionRepository.findBySocieteId(societeId);
    }
    
    public List<DiffusionPublicite> findByPeriod(LocalDateTime start, LocalDateTime end) {
        return diffusionRepository.findByDateDiffusionBetween(start, end);
    }
    
    public DiffusionPublicite save(DiffusionPublicite diffusion) {
        // Si nouveau et pas de coût unitaire défini, utiliser le tarif actuel
        if (diffusion.getId() == null && diffusion.getCoutUnitaire() == null) {
            diffusion.setCoutUnitaire(tarifService.getTarifActuel());
        }
        if (diffusion.getDateDiffusion() == null) {
            diffusion.setDateDiffusion(LocalDateTime.now());
        }
        return diffusionRepository.save(diffusion);
    }
    
    public void deleteById(Long id) {
        diffusionRepository.deleteById(id);
    }
    
    // Méthodes de calcul de CA
    public BigDecimal calculateCATotal() {
        return diffusionRepository.findAll().stream()
                .map(DiffusionPublicite::getCoutTotal)
                .reduce(BigDecimal.ZERO, BigDecimal::add);
    }
    
    public BigDecimal calculateCAByMonth(int annee, int mois) {
        BigDecimal ca = diffusionRepository.calculateCAByMonth(annee, mois);
        return ca != null ? ca : BigDecimal.ZERO;
    }
    
    public Map<String, BigDecimal> calculateCABySocieteAndMonth(int annee, int mois) {
        List<Map<String, Object>> results = diffusionRepository.calculateCABySocieteAndMonth(annee, mois);
        Map<String, BigDecimal> caMap = new HashMap<>();
        for (Map<String, Object> result : results) {
            String societe = (String) result.get("societe");
            BigDecimal ca = (BigDecimal) result.get("ca");
            caMap.put(societe, ca);
        }
        return caMap;
    }
    
    public Map<String, Object> getStatistiquesGlobales() {
        Map<String, Object> stats = new HashMap<>();
        List<DiffusionPublicite> diffusions = diffusionRepository.findAll();
        
        stats.put("nombreTotalDiffusions", diffusions.size());
        stats.put("nombreTotalPassages", diffusions.stream()
                .mapToInt(DiffusionPublicite::getNombreDiffusions)
                .sum());
        stats.put("caTotal", calculateCATotal());
        
        return stats;
    }
}
