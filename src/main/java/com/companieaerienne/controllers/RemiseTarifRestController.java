package com.companieaerienne.controllers;

import com.companieaerienne.entities.RemiseTarif;
import com.companieaerienne.entities.TarifVol;
import com.companieaerienne.repositories.ClasseRepository;
import com.companieaerienne.repositories.RemiseTarifRepository;
import com.companieaerienne.repositories.TarifVolRepository;
import com.companieaerienne.repositories.TypePassagerRepository;
import com.companieaerienne.repositories.VolProgrammationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.List;

@Controller
@RequestMapping("/remise-tarif")
public class RemiseTarifRestController {

    @Autowired
    private RemiseTarifRepository remiseTarifRepository;

    @Autowired
    private VolProgrammationRepository volProgrammationRepository;

    @Autowired
    private ClasseRepository classeRepository;

    @Autowired
    private TypePassagerRepository typePassagerRepository;

    @Autowired
    private TarifVolRepository tarifVolRepository;

    @PostMapping("/save-quick")
    public ResponseEntity<?> saveQuick(
            @RequestParam("id_vol_programmation") Integer volProgId,
            @RequestParam("id_classe") Integer classeId,
            @RequestParam("id_type_passager_appliquer") Integer appliquerId,
            @RequestParam("id_type_passager_reference") Integer referenceId,
            @RequestParam("remise") BigDecimal remise,
            @RequestParam("formule") String formule) {

        try {
            // 1. Enregistrer la remise
            RemiseTarif entity = remiseTarifRepository
                    .findByVolProgrammationIdAndClasseIdAndTypePassagerAppliquerId(volProgId, classeId, appliquerId)
                    .orElse(new RemiseTarif());

            entity.setVolProgrammation(volProgrammationRepository.findById(volProgId).orElseThrow());
            entity.setClasse(classeRepository.findById(classeId).orElseThrow());
            entity.setTypePassagerAppliquer(typePassagerRepository.findById(appliquerId).orElseThrow());
            entity.setTypePassagerReference(typePassagerRepository.findById(referenceId).orElseThrow());
            entity.setRemise(remise);
            entity.setFormule(formule);

            remiseTarifRepository.save(entity);

            // 2. Mettre à jour les tarifs impactés immédiatement dans la base
            List<TarifVol> tarifs = tarifVolRepository.findByVolProgrammationId(volProgId);
            
            // Trouver le tarif de référence
            TarifVol refTarif = tarifs.stream()
                .filter(t -> t.getClasse().getId().equals(classeId))
                .filter(t -> t.getTypePassager().getId().equals(referenceId))
                .findFirst()
                .orElse(null);

            if (refTarif != null) {
                BigDecimal baseValue = refTarif.getTarif();
                BigDecimal newValue = BigDecimal.ZERO;

                if ("%".equals(formule)) {
                    newValue = baseValue.multiply(remise).divide(new BigDecimal(100), 2, RoundingMode.HALF_UP);
                } else if ("-".equals(formule)) {
                    newValue = baseValue.subtract(remise);
                }

                if (newValue.compareTo(BigDecimal.ZERO) < 0) newValue = BigDecimal.ZERO;

                // Trouver ou créer le tarif cible
                TarifVol targetTarif = tarifs.stream()
                    .filter(t -> t.getClasse().getId().equals(classeId))
                    .filter(t -> t.getTypePassager().getId().equals(appliquerId))
                    .findFirst()
                    .orElse(new TarifVol());

                targetTarif.setVolProgrammation(entity.getVolProgrammation());
                targetTarif.setClasse(entity.getClasse());
                targetTarif.setTypePassager(entity.getTypePassagerAppliquer());
                targetTarif.setTarif(newValue);
                
                tarifVolRepository.save(targetTarif);
            }

            return ResponseEntity.ok().build();
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
