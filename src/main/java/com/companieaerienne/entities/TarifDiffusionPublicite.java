package com.companieaerienne.entities;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "tarif_diffusion_publicite")
public class TarifDiffusionPublicite {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal montant;
    
    @Column(name = "date_debut", nullable = false)
    private LocalDateTime dateDebut;
    
    @Column(name = "date_fin")
    private LocalDateTime dateFin;
    
    @Column(length = 200)
    private String description;
    
    @Column(nullable = false)
    private Boolean actif = true;
    
    // Constructors
    public TarifDiffusionPublicite() {}
    
    public TarifDiffusionPublicite(BigDecimal montant, LocalDateTime dateDebut, String description) {
        this.montant = montant;
        this.dateDebut = dateDebut;
        this.description = description;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public BigDecimal getMontant() {
        return montant;
    }
    
    public void setMontant(BigDecimal montant) {
        this.montant = montant;
    }
    
    public LocalDateTime getDateDebut() {
        return dateDebut;
    }
    
    public void setDateDebut(LocalDateTime dateDebut) {
        this.dateDebut = dateDebut;
    }
    
    public LocalDateTime getDateFin() {
        return dateFin;
    }
    
    public void setDateFin(LocalDateTime dateFin) {
        this.dateFin = dateFin;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public Boolean getActif() {
        return actif;
    }
    
    public void setActif(Boolean actif) {
        this.actif = actif;
    }
    
    // Helper method
    public boolean isActuelementActif() {
        LocalDateTime now = LocalDateTime.now();
        return actif && 
               dateDebut.isBefore(now) && 
               (dateFin == null || dateFin.isAfter(now));
    }
}
