package com.companieaerienne.controllers;

import com.companieaerienne.entities.Vol;
import com.companieaerienne.services.VolService;
import com.companieaerienne.services.AeroportService;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/vols")
public class VolController {
    @Autowired
    private VolService service;

    @Autowired
    private AeroportService aeroportService;

    @GetMapping
    public String findAll(@RequestParam(required = false) String depart, 
                         @RequestParam(required = false) String arrivee, 
                         Model model) {
        model.addAttribute("activePage", "vols");
        List<Vol> vols = service.findAll();
        
        if (depart != null && !depart.isEmpty()) {
            vols = vols.stream()
                .filter(v -> v.getAeroportDepart().getNom().toLowerCase().contains(depart.toLowerCase()))
                .collect(Collectors.toList());
        }
        
        if (arrivee != null && !arrivee.isEmpty()) {
            vols = vols.stream()
                .filter(v -> v.getAeroportArrivee().getNom().toLowerCase().contains(arrivee.toLowerCase()))
                .collect(Collectors.toList());
        }
        
        model.addAttribute("vols", vols);
        return "vol/list";
    }
    
    @GetMapping("/create")
    public String createForm(Model model) {
        model.addAttribute("activePage", "vols");
        model.addAttribute("vol", new Vol());
        model.addAttribute("aeroports", aeroportService.findAll());
        return "vol/create";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        model.addAttribute("activePage", "vols");
        model.addAttribute("vol", service.findById(id).orElseThrow());
        model.addAttribute("aeroports", aeroportService.findAll());
        return "vol/create";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Vol entity) {
        service.save(entity);
        return "redirect:/vols";
    }

    @GetMapping("/disponibilites")
    public String disponibilites(Model model) {
        model.addAttribute("activePage", "vols");
        model.addAttribute("vols", service.findAll());
        return "vol/disponibilites";
    }

    @GetMapping("/{id}/delete")
    public String deleteById(@PathVariable Integer id) {
        service.deleteById(id);
        return "redirect:/vols";
    }
}
