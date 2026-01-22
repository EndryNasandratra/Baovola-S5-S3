package com.companieaerienne.services;

import com.companieaerienne.entities.PaiementPublicite;
import com.companieaerienne.entities.SocieteAnnonceur;
import com.companieaerienne.repositories.PaiementPubliciteRepository;
import com.companieaerienne.repositories.SocieteAnnonceurRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
@Transactional
public class PaiementPubliciteService {

    @Autowired
    private PaiementPubliciteRepository paiementPubliciteRepository;

    @Autowired
    private SocieteAnnonceurRepository societeAnnonceurRepository;

    // Créer un nouveau paiement
    public PaiementPublicite creerPaiement(PaiementPublicite paiement) {
        return paiementPubliciteRepository.save(paiement);
    }

    // Récupérer tous les paiements
    public List<PaiementPublicite> getAllPaiements() {
        return paiementPubliciteRepository.findAll();
    }

    // Récupérer un paiement par ID
    public Optional<PaiementPublicite> getPaiementById(Long id) {
        return paiementPubliciteRepository.findById(id);
    }

    // Récupérer les paiements d'une société
    public List<PaiementPublicite> getPaiementsParSociete(Long idSociete) {
        return paiementPubliciteRepository.findBySocieteAnnonceur_IdOrderByDatePaiementDesc(idSociete);
    }

    // Mettre à jour un paiement
    public PaiementPublicite updatePaiement(Long id, PaiementPublicite paiementDetails) {
        PaiementPublicite paiement = paiementPubliciteRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Paiement non trouvé avec l'ID: " + id));

        paiement.setMontant(paiementDetails.getMontant());
        paiement.setDatePaiement(paiementDetails.getDatePaiement());
        paiement.setReferencePaiement(paiementDetails.getReferencePaiement());
        paiement.setRemarque(paiementDetails.getRemarque());

        if (paiementDetails.getSocieteAnnonceur() != null) {
            paiement.setSocieteAnnonceur(paiementDetails.getSocieteAnnonceur());
        }

        return paiementPubliciteRepository.save(paiement);
    }

    // Supprimer un paiement
    public void deletePaiement(Long id) {
        paiementPubliciteRepository.deleteById(id);
    }

    // Calculer le total payé par une société
    public BigDecimal calculerTotalPayeParSociete(Long idSociete) {
        return paiementPubliciteRepository.calculerTotalPayeParSociete(idSociete);
    }

    // Récupérer le reste à payer pour toutes les sociétés
    public List<Map<String, Object>> getResteAPayerParSociete() {
        return paiementPubliciteRepository.getResteAPayerParSociete();
    }

    // Récupérer le reste à payer pour une société spécifique
    public Map<String, Object> getResteAPayerPourSociete(Long idSociete) {
        return paiementPubliciteRepository.getResteAPayerPourSociete(idSociete);
    }

    // Récupérer tous les paiements avec détails
    public List<Map<String, Object>> getPaiementsAvecDetails() {
        return paiementPubliciteRepository.getPaiementsAvecDetails();
    }

    // Récupérer toutes les sociétés pour le formulaire
    public List<SocieteAnnonceur> getAllSocietes() {
        return societeAnnonceurRepository.findAll();
    }
}
