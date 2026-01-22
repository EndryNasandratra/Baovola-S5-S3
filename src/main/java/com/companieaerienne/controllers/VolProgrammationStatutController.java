package com.companieaerienne.controllers;

import com.companieaerienne.entities.VolProgrammation;
import com.companieaerienne.entities.VolProgrammationStatut;
import com.companieaerienne.entities.StatutVol;
import com.companieaerienne.services.VolProgrammationService;
import com.companieaerienne.services.VolProgrammationStatutService;
import com.companieaerienne.services.StatutVolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/vol-programmation-statut")
public class VolProgrammationStatutController {

    @Autowired
    private VolProgrammationStatutService service;

    @Autowired
    private VolProgrammationService volProgrammationService;

    @Autowired
    private StatutVolService statutVolService;

    @PostMapping("/update")
    public String updateStatut(@RequestParam Integer programmationId, @RequestParam Integer statutId) {
        VolProgrammation programmation = volProgrammationService.findById(programmationId).orElseThrow();
        StatutVol statut = statutVolService.findById(statutId).orElseThrow();

        VolProgrammationStatut vps = new VolProgrammationStatut();
        vps.setVolProgrammation(programmation);
        vps.setStatut(statut);
        service.save(vps);

        return "redirect:/vol-programmation/details/" + programmationId;
    }
}
