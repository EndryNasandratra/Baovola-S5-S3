package com.companieaerienne.controllers;

import com.companieaerienne.entities.TypePassager;
import com.companieaerienne.services.TypePassagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/type-passager")
public class TypePassagerController {

    @Autowired
    private TypePassagerService typePassagerService;

    @GetMapping
    public String list(Model model) {
        model.addAttribute("types", typePassagerService.findAll());
        model.addAttribute("activePage", "type-passager");
        return "type-passager/list";
    }

    @GetMapping("/create")
    public String createForm(Model model) {
        model.addAttribute("type", new TypePassager());
        model.addAttribute("activePage", "type-passager");
        return "type-passager/create";
    }

    @GetMapping("/edit/{id}")
    public String editForm(@PathVariable Integer id, Model model) {
        model.addAttribute("type", typePassagerService.findById(id).orElseThrow());
        model.addAttribute("activePage", "type-passager");
        return "type-passager/create";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute TypePassager type) {
        typePassagerService.save(type);
        return "redirect:/type-passager";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable Integer id) {
        typePassagerService.deleteById(id);
        return "redirect:/type-passager";
    }
}
