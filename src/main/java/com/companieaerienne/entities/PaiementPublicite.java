package com.companieaerienne.entities;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "paiement_publicite")
public class PaiementPublicite {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_paiement")
    private Long idPaiement;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_societe", nullable = false)
    private SocieteAnnonceur societeAnnonceur;

    @Column(name = "montant", nullable = false, precision = 15, scale = 2)
    private BigDecimal montant;

    @Column(name = "date_paiement", nullable = false)
    private LocalDate datePaiement;

    @Column(name = "reference_paiement", length = 100)
    private String referencePaiement;

    @Column(name = "remarque", columnDefinition = "TEXT")
    private String remarque;

    // Constructeurs
    public PaiementPublicite() {
    }

    public PaiementPublicite(SocieteAnnonceur societeAnnonceur, BigDecimal montant, LocalDate datePaiement) {
        this.societeAnnonceur = societeAnnonceur;
        this.montant = montant;
        this.datePaiement = datePaiement;
    }

    // Getters et Setters
    public Long getIdPaiement() {
        return idPaiement;
    }

    public void setIdPaiement(Long idPaiement) {
        this.idPaiement = idPaiement;
    }

    public SocieteAnnonceur getSocieteAnnonceur() {
        return societeAnnonceur;
    }

    public void setSocieteAnnonceur(SocieteAnnonceur societeAnnonceur) {
        this.societeAnnonceur = societeAnnonceur;
    }

    public BigDecimal getMontant() {
        return montant;
    }

    public void setMontant(BigDecimal montant) {
        this.montant = montant;
    }

    public LocalDate getDatePaiement() {
        return datePaiement;
    }

    public void setDatePaiement(LocalDate datePaiement) {
        this.datePaiement = datePaiement;
    }

    public String getReferencePaiement() {
        return referencePaiement;
    }

    public void setReferencePaiement(String referencePaiement) {
        this.referencePaiement = referencePaiement;
    }

    public String getRemarque() {
        return remarque;
    }

    public void setRemarque(String remarque) {
        this.remarque = remarque;
    }
}
