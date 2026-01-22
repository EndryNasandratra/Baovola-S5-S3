package com.companieaerienne.controllers;

import com.companieaerienne.entities.Reservation;
import com.companieaerienne.services.ReservationService;
import com.companieaerienne.services.VolService;
import com.companieaerienne.services.ClasseService;
import com.companieaerienne.services.ClientService;
import com.companieaerienne.services.VolProgrammationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/reservations")
public class ReservationController {
    @Autowired
    private ReservationService service;

    @Autowired
    private VolService volService;

    @Autowired
    private ClientService clientService;

    @Autowired
    private VolProgrammationService volProgrammationService;

    @GetMapping
    public String findAll(@RequestParam(required = false) String client,
                         @RequestParam(required = false) String vol,
                         Model model) {
        model.addAttribute("activePage", "reservations");
        List<Reservation> reservations = service.findAll();
        
        if (client != null && !client.isEmpty()) {
            reservations = reservations.stream()
                .filter(r -> r.getClient().getNom().toLowerCase().contains(client.toLowerCase()) || 
                            r.getClient().getPrenom().toLowerCase().contains(client.toLowerCase()))
                .collect(Collectors.toList());
        }
        
        if (vol != null && !vol.isEmpty()) {
            reservations = reservations.stream()
                .filter(r -> ("Vol #" + r.getVolProgrammation().getVol().getId()).toLowerCase().contains(vol.toLowerCase()))
                .collect(Collectors.toList());
        }
        
        model.addAttribute("reservations", reservations);
        return "reservation/list";
    }

    @Autowired
    private com.companieaerienne.services.TypePassagerService typePassagerService;

    @GetMapping("/create")
    public String createForm(@RequestParam(required = false) Integer volId,
                             @RequestParam(required = false) Integer volProgrammationId,
                             Model model) {
        model.addAttribute("activePage", "reservations");
        model.addAttribute("vols", volService.findAll());
        model.addAttribute("clients", clientService.findAll());
        model.addAttribute("typePassagers", typePassagerService.findAll());
        model.addAttribute("reservation", new Reservation());
        
        // Si un vol spécifique est demandé, le pré-sélectionner
        if (volProgrammationId != null) {
            volProgrammationService.findById(volProgrammationId).ifPresent(vp -> {
                if (vp.getVol() != null) {
                    model.addAttribute("selectedVolId", vp.getVol().getId());
                }
            });
            model.addAttribute("selectedVolProgrammationId", volProgrammationId);
        } else if (volId != null) {
            model.addAttribute("selectedVolId", volId);
        }
        
        return "reservation/create";
    }

    @PostMapping
    public String save(@ModelAttribute Reservation entity) {
        service.save(entity);
        return "redirect:/reservations";
    }

    @GetMapping("/{id}")
    public String findById(@PathVariable Integer id, Model model) {
        model.addAttribute("reservation", service.findById(id).orElse(null));
        return "reservation/details";
    }

    @GetMapping("/{id}/delete")
    public String deleteById(@PathVariable Integer id) {
        service.deleteById(id);
        return "redirect:/reservations";
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable Integer id, Model model) {
        Reservation reservation = service.findById(id).orElseThrow();
        model.addAttribute("activePage", "reservations");
        model.addAttribute("vols", volService.findAll());
        model.addAttribute("clients", clientService.findAll());
        model.addAttribute("typePassagers", typePassagerService.findAll());
        model.addAttribute("reservation", reservation);
        
        if (reservation.getVolProgrammation() != null) {
            if (reservation.getVolProgrammation().getVol() != null) {
                model.addAttribute("selectedVolId", reservation.getVolProgrammation().getVol().getId());
            }
            model.addAttribute("selectedVolProgrammationId", reservation.getVolProgrammation().getId());
        }
        
        return "reservation/create";
    }
}
