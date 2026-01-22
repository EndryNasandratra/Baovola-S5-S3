package com.companieaerienne.controllers;

import com.companieaerienne.entities.StatutReservation;
import com.companieaerienne.services.StatutReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/statuts-reservation")
public class StatutReservationController {
    @Autowired
    private StatutReservationService service;

    @GetMapping
    public String findAll(Model model) {
        model.addAttribute("statuts", service.findAll());
        return "statut/list";
    }

    @PostMapping
    public String save(@ModelAttribute StatutReservation entity) {
        service.save(entity);
        return "redirect:/statuts-reservation";
    }

    @GetMapping("/{id}")
    public String findById(@PathVariable Integer id, Model model) {
        model.addAttribute("statut", service.findById(id).orElse(null));
        return "statut/details";
    }

    @GetMapping("/{id}/delete")
    public String deleteById(@PathVariable Integer id) {
        service.deleteById(id);
        return "redirect:/statuts-reservation";
    }
}
