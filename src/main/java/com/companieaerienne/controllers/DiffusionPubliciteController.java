package com.companieaerienne.controllers;

import com.companieaerienne.entities.DiffusionPublicite;
import com.companieaerienne.services.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/publicite/diffusions")
public class DiffusionPubliciteController {
    
    @Autowired
    private DiffusionPubliciteService diffusionService;
    
    @Autowired
    private VideoPublicitaireService videoService;
    
    @Autowired
    private VolProgrammationService volService;
    
    @Autowired
    private TarifDiffusionPubliciteService tarifService;
    
    @GetMapping
    public String list(Model model) {
        model.addAttribute("diffusions", diffusionService.findAll());
        return "publicite/diffusions/list";
    }
    
    @GetMapping("/new")
    public String create(Model model) {
        model.addAttribute("diffusion", new DiffusionPublicite());
        model.addAttribute("videos", videoService.findAllActives());
        model.addAttribute("vols", volService.findAll());
        model.addAttribute("tarifActuel", tarifService.getTarifActuel());
        model.addAttribute("isEdit", false);
        return "publicite/diffusions/form";
    }
    
    @GetMapping("/{id}")
    public String edit(@PathVariable Long id, Model model) {
        DiffusionPublicite diffusion = diffusionService.findById(id)
                .orElseThrow(() -> new RuntimeException("Diffusion non trouvée"));
        model.addAttribute("diffusion", diffusion);
        model.addAttribute("videos", videoService.findAllActives());
        model.addAttribute("vols", volService.findAll());
        model.addAttribute("tarifActuel", tarifService.getTarifActuel());
        model.addAttribute("isEdit", true);
        return "publicite/diffusions/form";
    }
    
    @PostMapping
    public String save(@ModelAttribute DiffusionPublicite diffusion,
                       @RequestParam Long videoId,
                       @RequestParam Integer volProgrammationId) {
        diffusion.setVideo(videoService.findById(videoId)
                .orElseThrow(() -> new RuntimeException("Vidéo non trouvée")));
        diffusion.setVolProgrammation(volService.findById(volProgrammationId)
                .orElseThrow(() -> new RuntimeException("Vol non trouvé")));
        diffusion.setTarif(tarifService.findTarifActuel().orElse(null));
        diffusionService.save(diffusion);
        return "redirect:/publicite/diffusions";
    }
    
    @GetMapping("/{id}/delete")
    public String delete(@PathVariable Long id) {
        diffusionService.deleteById(id);
        return "redirect:/publicite/diffusions";
    }
}
