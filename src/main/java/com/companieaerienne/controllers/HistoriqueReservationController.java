package com.companieaerienne.controllers;

import com.companieaerienne.entities.HistoriqueReservation;
import com.companieaerienne.services.HistoriqueReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/historiques-reservation")
public class HistoriqueReservationController {
    @Autowired
    private HistoriqueReservationService service;

    @GetMapping
    public String findAll(Model model) {
        model.addAttribute("historiques", service.findAll());
        return "historique/list";
    }

    @GetMapping("/reservation/{reservationId}")
    public String findByReservation(@PathVariable Integer reservationId, Model model) {
        model.addAttribute("historiques", service.findByReservationId(reservationId));
        model.addAttribute("reservationId", reservationId);
        return "historique/list";
    }

    @PostMapping
    public String save(@ModelAttribute HistoriqueReservation entity) {
        service.save(entity);
        return "redirect:/historiques-reservation";
    }

    @GetMapping("/{id}")
    public String findById(@PathVariable Integer id, Model model) {
        model.addAttribute("historique", service.findById(id).orElse(null));
        return "historique/details";
    }

    @GetMapping("/{id}/delete")
    public String deleteById(@PathVariable Integer id) {
        service.deleteById(id);
        return "redirect:/historiques-reservation";
    }
}
