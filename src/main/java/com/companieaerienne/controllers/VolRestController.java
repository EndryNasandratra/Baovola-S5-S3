package com.companieaerienne.controllers;

import com.companieaerienne.services.VolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/vol")
public class VolRestController {
    
    @Autowired
    private VolService volService;

    @Autowired
    private com.companieaerienne.services.VolProgrammationService volProgrammationService;

    @GetMapping("/{volId}/programmations")
    public List<Map<String, Object>> getVolProgrammations(@PathVariable Integer volId) {
        return volService.findById(volId)
            .map(vol -> volProgrammationService.findByVol(vol).stream()
                .map(vp -> {
                    Map<String, Object> map = new HashMap<>();
                    map.put("id", vp.getId());
                    map.put("dateHeure", vp.getDateHeure());
                    if (vp.getAvion() != null) {
                        map.put("avionId", vp.getAvion().getId());
                        map.put("avionCapacite", vp.getAvion().getCapacite());
                    }
                    return map;
                })
                .toList())
            .orElse(List.of());
    }

    @GetMapping("/programmation/{id}/tarifs")
    public List<Map<String, Object>> getTarifsByProgrammation(@PathVariable Integer id) {
        return volProgrammationService.findById(id)
            .map(vp -> vp.getTarifs().stream()
                .map(t -> {
                    Map<String, Object> map = new HashMap<>();
                    map.put("classeId", t.getClasse().getId());
                    map.put("typePassagerId", t.getTypePassager().getId());
                    map.put("tarif", t.getTarif());
                    return map;
                })
                .toList())
            .orElse(List.of());
    }
}
