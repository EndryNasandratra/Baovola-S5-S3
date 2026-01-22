package com.companieaerienne.controllers;

import com.companieaerienne.entities.Client;
import com.companieaerienne.services.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/clients")
public class ClientController {
    @Autowired
    private ClientService service;

    @GetMapping
    public String findAll(Model model) {
        model.addAttribute("clients", service.findAll());
        return "client/list";
    }

    @PostMapping
    public String save(@ModelAttribute Client entity) {
        service.save(entity);
        return "redirect:/clients";
    }

    @GetMapping("/{id}")
    public String findById(@PathVariable Integer id, Model model) {
        model.addAttribute("client", service.findById(id).orElse(null));
        return "client/details";
    }

    @GetMapping("/{id}/delete")
    public String deleteById(@PathVariable Integer id) {
        service.deleteById(id);
        return "redirect:/clients";
    }
}
