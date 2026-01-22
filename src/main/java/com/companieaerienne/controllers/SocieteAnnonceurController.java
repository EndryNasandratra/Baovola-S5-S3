package com.companieaerienne.controllers;

import com.companieaerienne.entities.SocieteAnnonceur;
import com.companieaerienne.services.SocieteAnnonceurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/publicite/societes")
public class SocieteAnnonceurController {
    
    @Autowired
    private SocieteAnnonceurService societeService;
    
    @GetMapping
    public String list(Model model) {
        model.addAttribute("societes", societeService.findAll());
        return "publicite/societes/list";
    }
    
    @GetMapping("/new")
    public String create(Model model) {
        model.addAttribute("societe", new SocieteAnnonceur());
        model.addAttribute("isEdit", false);
        return "publicite/societes/form";
    }
    
    @GetMapping("/{id}")
    public String edit(@PathVariable Long id, Model model) {
        SocieteAnnonceur societe = societeService.findById(id)
                .orElseThrow(() -> new RuntimeException("Société non trouvée"));
        model.addAttribute("societe", societe);
        model.addAttribute("isEdit", true);
        return "publicite/societes/form";
    }
    
    @PostMapping
    public String save(@ModelAttribute SocieteAnnonceur societe) {
        societeService.save(societe);
        return "redirect:/publicite/societes";
    }
    
    @GetMapping("/{id}/toggle")
    public String toggleActif(@PathVariable Long id) {
        societeService.toggleActif(id);
        return "redirect:/publicite/societes";
    }
    
    @GetMapping("/{id}/delete")
    public String delete(@PathVariable Long id) {
        societeService.deleteById(id);
        return "redirect:/publicite/societes";
    }
}
