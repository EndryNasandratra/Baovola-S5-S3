package com.companieaerienne.services;

import com.companieaerienne.entities.VolProgrammation;
import com.companieaerienne.entities.TarifVol;
import com.companieaerienne.entities.ClassePlace;
import com.companieaerienne.repositories.VolProgrammationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class VolProgrammationService {
    @Autowired
    private VolProgrammationRepository repository;

    @Autowired
    private ClassePlaceService classePlaceService;

    public List<VolProgrammation> findAll() {
        return repository.findAll();
    }

    public Optional<VolProgrammation> findById(Integer id) {
        return repository.findById(id);
    }

    public VolProgrammation save(VolProgrammation entity) {
        return repository.save(entity);
    }

    public void deleteById(Integer id) {
        repository.deleteById(id);
    }

    public List<VolProgrammation> findByVol(com.companieaerienne.entities.Vol vol) {
        return repository.findByVol(vol);
    }

    public List<VolProgrammation> findByDateHeureAfter(LocalDateTime dateHeure) {
        return repository.findByDateHeureAfter(dateHeure);
    }

    public BigDecimal calculateRevenue(VolProgrammation programmation) {
        if (programmation.getReservations() == null || programmation.getTarifs() == null) return BigDecimal.ZERO;
        
        List<ClassePlace> configurations = classePlaceService.findByAvion(programmation.getAvion().getId());
        BigDecimal total = BigDecimal.ZERO;
        
        for (com.companieaerienne.entities.Reservation res : programmation.getReservations()) {
            if (res.getDetailsPlaces() == null || res.getDetailsPlaces().isEmpty()) continue;
            
            for (com.companieaerienne.entities.ReservationPlace resPlace : res.getDetailsPlaces()) {
                Integer seatNum = resPlace.getPlace();
                Integer typePassagerId = resPlace.getTypePassager() != null ? resPlace.getTypePassager().getId() : null;
                
                // Déterminer la classe de ce siège
                Integer classeId = configurations.stream()
                    .filter(cp -> seatNum >= cp.getPlaceDebut() && seatNum <= cp.getPlaceFin())
                    .map(cp -> cp.getClasse().getId())
                    .findFirst()
                    .orElse(null);
                
                if (classeId != null) {
                    BigDecimal tarif = programmation.getTarifs().stream()
                        .filter(t -> t.getClasse().getId().equals(classeId))
                        .filter(t -> typePassagerId == null || (t.getTypePassager() != null && t.getTypePassager().getId().equals(typePassagerId)))
                        .map(TarifVol::getTarif)
                        .findFirst()
                        .orElse(BigDecimal.ZERO);
                    
                    total = total.add(tarif);
                }
            }
        }
        return total;
    }

    public BigDecimal calculatePotentialRevenue(VolProgrammation programmation) {
        if (programmation.getTarifs() == null || programmation.getAvion() == null) return BigDecimal.ZERO;
        
        List<ClassePlace> configurations = classePlaceService.findByAvion(programmation.getAvion().getId());
        BigDecimal total = BigDecimal.ZERO;
        
        for (ClassePlace config : configurations) {
            int nbPlaces = config.getPlaceFin() - config.getPlaceDebut() + 1;
            Integer classeId = config.getClasse().getId();
            
            // On prend le tarif "Adulte" par défaut pour le potentiel
            // S'il n'y a pas d'Adulte, on prend le premier tarif trouvé pour cette classe
            BigDecimal tarifUnitaire = programmation.getTarifs().stream()
                .filter(t -> t.getClasse().getId().equals(classeId))
                .sorted((t1, t2) -> {
                    // Priorité à "Adulte"
                    String nom1 = t1.getTypePassager() != null ? t1.getTypePassager().getNom() : "";
                    String nom2 = t2.getTypePassager() != null ? t2.getTypePassager().getNom() : "";
                    if (nom1.equalsIgnoreCase("Adulte")) return -1;
                    if (nom2.equalsIgnoreCase("Adulte")) return 1;
                    return 0;
                })
                .map(TarifVol::getTarif)
                .findFirst()
                .orElse(BigDecimal.ZERO);
                
            total = total.add(tarifUnitaire.multiply(new BigDecimal(nbPlaces)));
        }
        return total;
    }
}
