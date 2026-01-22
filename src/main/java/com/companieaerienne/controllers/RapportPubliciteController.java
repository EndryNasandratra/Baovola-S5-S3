package com.companieaerienne.controllers;

import com.companieaerienne.services.DiffusionPubliciteService;
import com.companieaerienne.services.PaiementPubliciteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/publicite/rapports")
public class RapportPubliciteController {
    
    @Autowired
    private DiffusionPubliciteService diffusionService;
    
    @Autowired
    private PaiementPubliciteService paiementPubliciteService;
    
    @GetMapping
    public String rapports(Model model) {
        // CA = montants payés uniquement
        List<Map<String, Object>> restesAPayer = paiementPubliciteService.getResteAPayerParSociete();
        model.addAttribute("restesAPayer", restesAPayer);
        
        return "publicite/rapports";
    }
    
    @GetMapping("/ca-par-societe")
    public String caParSociete(@RequestParam(required = false) Integer annee,
                               @RequestParam(required = false) Integer mois,
                               Model model) {
        if (annee == null) {
            annee = LocalDate.now().getYear();
        }
        if (mois == null) {
            mois = LocalDate.now().getMonthValue();
        }
        
        Map<String, BigDecimal> caMap = diffusionService.calculateCABySocieteAndMonth(annee, mois);
        BigDecimal caTotal = diffusionService.calculateCAByMonth(annee, mois);
        
        model.addAttribute("caParSociete", caMap);
        model.addAttribute("caTotal", caTotal);
        model.addAttribute("annee", annee);
        model.addAttribute("mois", mois);
        
        return "publicite/rapports/ca-par-societe";
    }
}
