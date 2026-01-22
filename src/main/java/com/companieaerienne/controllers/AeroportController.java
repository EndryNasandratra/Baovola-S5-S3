package com.companieaerienne.controllers;

import com.companieaerienne.entities.Aeroport;
import com.companieaerienne.services.AeroportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/aeroports")
public class AeroportController {
    @Autowired
    private AeroportService service;

    @GetMapping
    public String findAll(Model model) {
        model.addAttribute("activePage", "aeroports");
        model.addAttribute("aeroports", service.findAll());
        return "aeroport/list";
    }

    @GetMapping("/create")
    public String createForm(Model model) {
        model.addAttribute("activePage", "aeroports");
        model.addAttribute("aeroport", new Aeroport());
        return "aeroport/create";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        model.addAttribute("activePage", "aeroports");
        model.addAttribute("aeroport", service.findById(id).orElseThrow());
        return "aeroport/create";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Aeroport entity) {
        service.save(entity);
        return "redirect:/aeroports";
    }

    @GetMapping("/{id}/delete")
    public String deleteById(@PathVariable Integer id) {
        service.deleteById(id);
        return "redirect:/aeroports";
    }
}
