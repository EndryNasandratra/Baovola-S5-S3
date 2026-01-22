package com.companieaerienne.controllers;

import com.companieaerienne.entities.VolProgrammation;
import com.companieaerienne.entities.VolProgrammationStatut;
import com.companieaerienne.services.VolProgrammationService;
import com.companieaerienne.services.VolProgrammationStatutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class HomeController {

    @Autowired
    private VolProgrammationService volProgrammationService;

    @Autowired
    private VolProgrammationStatutService volProgrammationStatutService;

    @GetMapping("/")
    public String index(Model model) {
        List<VolProgrammation> allProgrammations = volProgrammationService.findAll();
        List<VolProgrammationStatut> allStatutHistory = volProgrammationStatutService.findAll();

        // 1. Vols Aujourd'hui
        LocalDate today = LocalDate.now();
        long volsAujourdhui = allProgrammations.stream()
                .filter(p -> p.getDateHeure().toLocalDate().equals(today))
                .count();

        // 2. Passagers ce mois
        int currentMonth = today.getMonthValue();
        int currentYear = today.getYear();
        long passagersMois = allProgrammations.stream()
                .filter(p -> p.getDateHeure().getMonthValue() == currentMonth && p.getDateHeure().getYear() == currentYear)
                .flatMap(p -> p.getReservations().stream())
                .filter(r -> r.getPlacesSelectionnees() != null)
                .mapToLong(r -> r.getPlacesSelectionnees().size())
                .sum();

        // 3. Revenus ce mois
        BigDecimal revenusMois = allProgrammations.stream()
                .filter(p -> p.getDateHeure().getMonthValue() == currentMonth && p.getDateHeure().getYear() == currentYear)
                .map(volProgrammationService::calculateRevenue)
                .reduce(BigDecimal.ZERO, BigDecimal::add);

        // 4. Retards (Attention requise)
        long retards = allProgrammations.stream()
                .filter(p -> {
                    return allStatutHistory.stream()
                            .filter(s -> s.getVolProgrammation().getId().equals(p.getId()))
                            .max(Comparator.comparing(VolProgrammationStatut::getDate))
                            .map(s -> s.getStatut().getNom().equalsIgnoreCase("Retardé"))
                            .orElse(false);
                })
                .count();

        // 5. Vols Récents (5 derniers)
        List<VolProgrammation> volsRecents = allProgrammations.stream()
                .sorted((p1, p2) -> p2.getDateHeure().compareTo(p1.getDateHeure()))
                .limit(5)
                .collect(Collectors.toList());

        // Get current status for each recent flight
        Map<Integer, String> statusMap = volsRecents.stream()
                .collect(Collectors.toMap(
                        VolProgrammation::getId,
                        p -> allStatutHistory.stream()
                                .filter(s -> s.getVolProgrammation().getId().equals(p.getId()))
                                .max(Comparator.comparing(VolProgrammationStatut::getDate))
                                .map(s -> s.getStatut().getNom())
                                .orElse("Inconnu")
                ));

        model.addAttribute("volsAujourdhui", volsAujourdhui);
        model.addAttribute("passagersMois", passagersMois);
        model.addAttribute("revenusMois", revenusMois);
        model.addAttribute("retards", retards);
        model.addAttribute("volsRecents", volsRecents);
        model.addAttribute("statusMap", statusMap);
        model.addAttribute("activePage", "home");
        
        return "index";
    }
}
