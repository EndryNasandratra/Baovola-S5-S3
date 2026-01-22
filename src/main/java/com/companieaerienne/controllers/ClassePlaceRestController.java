package com.companieaerienne.controllers;

import com.companieaerienne.entities.ClassePlace;
import com.companieaerienne.services.ClassePlaceService;
import com.companieaerienne.services.ReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ClassePlaceRestController {
    
    @Autowired
    private ClassePlaceService service;
    
    @Autowired
    private ReservationService reservationService;

    @GetMapping("/classe-place/{classeId}/{avionId}")
    public Map<String, Integer> getPlageByClasseAndAvion(@PathVariable Integer classeId, @PathVariable Integer avionId) {
        System.out.println("API appelée: classeId=" + classeId + ", avionId=" + avionId);
        ClassePlace cp = service.findByClasseAndAvion(classeId, avionId);
        Map<String, Integer> result = new HashMap<>();
        if (cp != null) {
            result.put("debut", cp.getPlaceDebut());
            result.put("fin", cp.getPlaceFin());
            System.out.println("Plage trouvée: " + cp.getPlaceDebut() + "-" + cp.getPlaceFin());
        } else {
            System.out.println("Aucune plage trouvée pour classeId=" + classeId + ", avionId=" + avionId);
            // Retourner une plage par défaut si rien n'est trouvé
            result.put("debut", 1);
            result.put("fin", 36);
        }
        return result;
    }

    @GetMapping("/avion/{avionId}/classes-places")
    public List<ClassePlace> getClassesPlacesByAvion(@PathVariable Integer avionId) {
        return service.findByAvion(avionId);
    }
    
    @GetMapping("/places-occupees/{volProgrammationId}")
    public List<Integer> getPlacesOccupees(@PathVariable Integer volProgrammationId, @RequestParam(required = false) Integer excludeReservationId) {
        System.out.println("Récupération des places occupées pour la programmation: " + volProgrammationId);
        List<Integer> occupiedSeats;
        if (excludeReservationId != null) {
            occupiedSeats = reservationService.getOccupiedSeatsExcluding(volProgrammationId, excludeReservationId);
        } else {
            occupiedSeats = reservationService.getOccupiedSeats(volProgrammationId);
        }
        System.out.println("Places occupées: " + occupiedSeats);
        return occupiedSeats;
    }
}
