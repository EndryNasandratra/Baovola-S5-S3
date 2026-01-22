package com.companieaerienne.controllers;

import com.companieaerienne.entities.TarifDiffusionPublicite;
import com.companieaerienne.services.TarifDiffusionPubliciteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/publicite/tarifs")
public class TarifDiffusionPubliciteController {
    
    @Autowired
    private TarifDiffusionPubliciteService tarifService;
    
    @GetMapping
    public String list(Model model) {
        model.addAttribute("tarifs", tarifService.findAll());
        model.addAttribute("tarifActuel", tarifService.findTarifActuel().orElse(null));
        return "publicite/tarifs/list";
    }
    
    @GetMapping("/new")
    public String create(Model model) {
        model.addAttribute("tarif", new TarifDiffusionPublicite());
        model.addAttribute("isEdit", false);
        return "publicite/tarifs/form";
    }
    
    @GetMapping("/{id}")
    public String edit(@PathVariable Long id, Model model) {
        TarifDiffusionPublicite tarif = tarifService.findById(id)
                .orElseThrow(() -> new RuntimeException("Tarif non trouvé"));
        model.addAttribute("tarif", tarif);
        model.addAttribute("isEdit", true);
        return "publicite/tarifs/form";
    }
    
    @PostMapping
    public String save(@ModelAttribute TarifDiffusionPublicite tarif) {
        tarifService.save(tarif);
        return "redirect:/publicite/tarifs";
    }
    
    @GetMapping("/{id}/delete")
    public String delete(@PathVariable Long id) {
        tarifService.deleteById(id);
        return "redirect:/publicite/tarifs";
    }
}
