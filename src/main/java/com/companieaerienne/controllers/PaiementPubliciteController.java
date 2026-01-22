package com.companieaerienne.controllers;

import com.companieaerienne.entities.PaiementPublicite;
import com.companieaerienne.entities.SocieteAnnonceur;
import com.companieaerienne.services.PaiementPubliciteService;
import com.companieaerienne.services.SocieteAnnonceurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/paiements-publicite")
public class PaiementPubliciteController {

    @Autowired
    private PaiementPubliciteService paiementPubliciteService;

    @Autowired
    private SocieteAnnonceurService societeAnnonceurService;

    // Liste des paiements
    @GetMapping
    public String listPaiements(Model model) {
        List<Map<String, Object>> paiements = paiementPubliciteService.getPaiementsAvecDetails();
        model.addAttribute("paiements", paiements);
        return "paiement-publicite/list";
    }

    // Formulaire de création
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("paiement", new PaiementPublicite());
        // Récupérer les sociétés avec leur reste à payer
        List<Map<String, Object>> societesAvecReste = paiementPubliciteService.getResteAPayerParSociete();
        model.addAttribute("societesAvecReste", societesAvecReste);
        return "paiement-publicite/create";
    }

    // Enregistrer un nouveau paiement
    @PostMapping("/create")
    public String createPaiement(@ModelAttribute PaiementPublicite paiement,
                                 @RequestParam("idSociete") Long idSociete,
                                 RedirectAttributes redirectAttributes) {
        try {
            SocieteAnnonceur societe = societeAnnonceurService.findById(idSociete)
                    .orElseThrow(() -> new RuntimeException("Société non trouvée"));
            paiement.setSocieteAnnonceur(societe);
            paiementPubliciteService.creerPaiement(paiement);
            redirectAttributes.addFlashAttribute("success", "Paiement enregistré avec succès!");
            return "redirect:/paiements-publicite";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Erreur lors de l'enregistrement du paiement: " + e.getMessage());
            return "redirect:/paiements-publicite/create";
        }
    }

    // Formulaire d'édition
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        PaiementPublicite paiement = paiementPubliciteService.getPaiementById(id)
                .orElseThrow(() -> new RuntimeException("Paiement non trouvé"));
        model.addAttribute("paiement", paiement);
        model.addAttribute("societes", paiementPubliciteService.getAllSocietes());
        return "paiement-publicite/edit";
    }

    // Mettre à jour un paiement
    @PostMapping("/edit/{id}")
    public String updatePaiement(@PathVariable Long id,
                                 @ModelAttribute PaiementPublicite paiement,
                                 @RequestParam("idSociete") Long idSociete,
                                 RedirectAttributes redirectAttributes) {
        try {
            SocieteAnnonceur societe = societeAnnonceurService.findById(idSociete)
                    .orElseThrow(() -> new RuntimeException("Société non trouvée"));
            paiement.setSocieteAnnonceur(societe);
            paiementPubliciteService.updatePaiement(id, paiement);
            redirectAttributes.addFlashAttribute("success", "Paiement mis à jour avec succès!");
            return "redirect:/paiements-publicite";
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Erreur lors de la mise à jour: " + e.getMessage());
            return "redirect:/paiements-publicite/edit/" + id;
        }
    }

    // Supprimer un paiement
    @PostMapping("/delete/{id}")
    public String deletePaiement(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        try {
            paiementPubliciteService.deletePaiement(id);
            redirectAttributes.addFlashAttribute("success", "Paiement supprimé avec succès!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Erreur lors de la suppression: " + e.getMessage());
        }
        return "redirect:/paiements-publicite";
    }

    // Page reste à payer
    @GetMapping("/reste-a-payer")
    public String showResteAPayer(Model model) {
        List<Map<String, Object>> restesAPayer = paiementPubliciteService.getResteAPayerParSociete();
        model.addAttribute("restesAPayer", restesAPayer);
        return "paiement-publicite/reste-a-payer";
    }

    // Détails paiements par société
    @GetMapping("/societe/{idSociete}")
    public String showPaiementsParSociete(@PathVariable Long idSociete, Model model) {
        SocieteAnnonceur societe = societeAnnonceurService.findById(idSociete)
                .orElseThrow(() -> new RuntimeException("Société non trouvée"));
        List<PaiementPublicite> paiements = paiementPubliciteService.getPaiementsParSociete(idSociete);
        Map<String, Object> resteAPayer = paiementPubliciteService.getResteAPayerPourSociete(idSociete);
        
        model.addAttribute("societe", societe);
        model.addAttribute("paiements", paiements);
        model.addAttribute("resteAPayer", resteAPayer);
        return "paiement-publicite/details-societe";
    }
}
