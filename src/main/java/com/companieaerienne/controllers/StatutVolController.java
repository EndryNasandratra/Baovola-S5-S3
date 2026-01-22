package com.companieaerienne.controllers;

import com.companieaerienne.entities.StatutVol;
import com.companieaerienne.services.StatutVolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/statuts-vol")
public class StatutVolController {
    @Autowired
    private StatutVolService service;

    @GetMapping
    public String findAll(Model model) {
        model.addAttribute("activePage", "statuts-vol");
        model.addAttribute("statuts", service.findAll());
        return "statut-vol/list";
    }

    @GetMapping("/create")
    public String createForm(Model model) {
        model.addAttribute("activePage", "statuts-vol");
        model.addAttribute("statut", new StatutVol());
        return "statut-vol/create";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        model.addAttribute("activePage", "statuts-vol");
        model.addAttribute("statut", service.findById(id).orElseThrow());
        return "statut-vol/create";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute StatutVol entity) {
        service.save(entity);
        return "redirect:/statuts-vol";
    }

    @GetMapping("/{id}/delete")
    public String deleteById(@PathVariable Integer id) {
        service.deleteById(id);
        return "redirect:/statuts-vol";
    }
}
