package com.companieaerienne.controllers;

import com.companieaerienne.entities.VideoPublicitaire;
import com.companieaerienne.services.SocieteAnnonceurService;
import com.companieaerienne.services.VideoPublicitaireService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/publicite/videos")
public class VideoPublicitaireController {
    
    @Autowired
    private VideoPublicitaireService videoService;
    
    @Autowired
    private SocieteAnnonceurService societeService;
    
    @GetMapping
    public String list(@RequestParam(required = false) Long societeId, Model model) {
        if (societeId != null) {
            model.addAttribute("videos", videoService.findBySociete(societeId));
        } else {
            model.addAttribute("videos", videoService.findAll());
        }
        model.addAttribute("societes", societeService.findAllActives());
        return "publicite/videos/list";
    }
    
    @GetMapping("/new")
    public String create(Model model) {
        model.addAttribute("video", new VideoPublicitaire());
        model.addAttribute("societes", societeService.findAllActives());
        model.addAttribute("isEdit", false);
        return "publicite/videos/form";
    }
    
    @GetMapping("/{id}")
    public String edit(@PathVariable Long id, Model model) {
        VideoPublicitaire video = videoService.findById(id)
                .orElseThrow(() -> new RuntimeException("Vidéo non trouvée"));
        model.addAttribute("video", video);
        model.addAttribute("societes", societeService.findAllActives());
        model.addAttribute("isEdit", true);
        return "publicite/videos/form";
    }
    
    @PostMapping
    public String save(@ModelAttribute VideoPublicitaire video, 
                       @RequestParam Long societeId) {
        video.setSociete(societeService.findById(societeId)
                .orElseThrow(() -> new RuntimeException("Société non trouvée")));
        videoService.save(video);
        return "redirect:/publicite/videos";
    }
    
    @GetMapping("/{id}/toggle")
    public String toggleActif(@PathVariable Long id) {
        videoService.toggleActif(id);
        return "redirect:/publicite/videos";
    }
    
    @GetMapping("/{id}/delete")
    public String delete(@PathVariable Long id) {
        videoService.deleteById(id);
        return "redirect:/publicite/videos";
    }
}
