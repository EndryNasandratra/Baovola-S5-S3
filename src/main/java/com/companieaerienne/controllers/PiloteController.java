package com.companieaerienne.controllers;

import com.companieaerienne.entities.Pilote;
import com.companieaerienne.services.PiloteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/pilotes")
public class PiloteController {
    @Autowired
    private PiloteService service;

    @GetMapping
    public String findAll(Model model) {
        model.addAttribute("pilotes", service.findAll());
        return "pilote/list";
    }

    @PostMapping
    public String save(@ModelAttribute Pilote entity) {
        service.save(entity);
        return "redirect:/pilotes";
    }

    @GetMapping("/{id}")
    public String findById(@PathVariable Integer id, Model model) {
        model.addAttribute("pilote", service.findById(id).orElse(null));
        return "pilote/details";
    }

    @GetMapping("/{id}/delete")
    public String deleteById(@PathVariable Integer id) {
        service.deleteById(id);
        return "redirect:/pilotes";
    }
}
