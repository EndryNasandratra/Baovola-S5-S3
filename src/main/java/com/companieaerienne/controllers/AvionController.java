package com.companieaerienne.controllers;

import com.companieaerienne.entities.Avion;
import com.companieaerienne.entities.ClassePlace;
import com.companieaerienne.services.AvionService;
import com.companieaerienne.services.ClasseService;
import com.companieaerienne.services.ClassePlaceService;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/avions")
public class AvionController {
    @Autowired
    private AvionService service;

    @Autowired
    private ClasseService classeService;

    @Autowired
    private ClassePlaceService classePlaceService;

    @GetMapping
    public String findAll(@RequestParam(required = false) String search, Model model) {
        List<Avion> avions = service.findAll();
        if (search != null && !search.isEmpty()) {
            avions = avions.stream()
                .filter(a -> a.getMatricule().toLowerCase().contains(search.toLowerCase()))
                .collect(Collectors.toList());
        }
        model.addAttribute("avions", avions);
        model.addAttribute("activePage", "avions");
        return "avion/list";
    }

    @GetMapping("/classes-places")
    public String listForClasses(@RequestParam(required = false) String search, Model model) {
        List<Avion> avions = service.findAll();
        if (search != null && !search.isEmpty()) {
            avions = avions.stream()
                .filter(a -> a.getMatricule().toLowerCase().contains(search.toLowerCase()))
                .collect(Collectors.toList());
        }
        model.addAttribute("avions", avions);
        model.addAttribute("activePage", "classes-places");
        return "avion/classes-list";
    }

    @GetMapping("/create")
    public String createForm(Model model) {
        model.addAttribute("avion", new Avion());
        model.addAttribute("activePage", "avions");
        return "avion/create";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        model.addAttribute("avion", service.findById(id).orElseThrow());
        model.addAttribute("activePage", "avions");
        return "avion/create";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute Avion avion) {
        service.save(avion);
        return "redirect:/avions";
    }

    @GetMapping("/{id}/delete")
    public String delete(@PathVariable Integer id) {
        service.deleteById(id);
        return "redirect:/avions";
    }

    @GetMapping("/{id}/places")
    public String managePlaces(@PathVariable Integer id, Model model) {
        Avion avion = service.findById(id).orElseThrow();
        model.addAttribute("avion", avion);
        model.addAttribute("classes", classeService.findAll());
        model.addAttribute("avionPlaces", classePlaceService.findByAvion(id));
        model.addAttribute("activePage", "avions");
        return "avion/places";
    }

    @PostMapping("/{id}/places/save")
    public String savePlaces(@PathVariable Integer id, @RequestParam Map<String, String> params) {
        Avion avion = service.findById(id).orElseThrow();
        
        // Supprimer les anciennes configurations
        classePlaceService.deleteByAvion(id);
        
        classeService.findAll().forEach(classe -> {
            String debutStr = params.get("placeDebut_" + classe.getId());
            String finStr = params.get("placeFin_" + classe.getId());
            
            if (debutStr != null && !debutStr.isEmpty() && finStr != null && !finStr.isEmpty()) {
                ClassePlace cp = new ClassePlace();
                cp.setAvion(avion);
                cp.setClasse(classe);
                cp.setPlaceDebut(Integer.parseInt(debutStr));
                cp.setPlaceFin(Integer.parseInt(finStr));
                classePlaceService.save(cp);
            }
        });
        
        return "redirect:/avions";
    }
}
