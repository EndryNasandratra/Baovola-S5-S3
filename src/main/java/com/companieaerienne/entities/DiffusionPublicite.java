package com.companieaerienne.entities;

import jakarta.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "diffusion_publicite")
public class DiffusionPublicite {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "id_video", nullable = false)
    private VideoPublicitaire video;
    
    @ManyToOne
    @JoinColumn(name = "id_vol_programmation", nullable = false)
    private VolProgrammation volProgrammation;
    
    @ManyToOne
    @JoinColumn(name = "id_tarif")
    private TarifDiffusionPublicite tarif;
    
    @Column(name = "nombre_diffusions", nullable = false)
    private Integer nombreDiffusions = 1;
    
    @Column(name = "date_diffusion")
    private LocalDateTime dateDiffusion = LocalDateTime.now();
    
    @Column(name = "cout_unitaire", nullable = false, precision = 12, scale = 2)
    private BigDecimal coutUnitaire;
    
    @Column(columnDefinition = "TEXT")
    private String notes;
    
    // Constructors
    public DiffusionPublicite() {}
    
    public DiffusionPublicite(VideoPublicitaire video, VolProgrammation volProgrammation, 
                              Integer nombreDiffusions, BigDecimal coutUnitaire) {
        this.video = video;
        this.volProgrammation = volProgrammation;
        this.nombreDiffusions = nombreDiffusions;
        this.coutUnitaire = coutUnitaire;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public VideoPublicitaire getVideo() {
        return video;
    }
    
    public void setVideo(VideoPublicitaire video) {
        this.video = video;
    }
    
    public VolProgrammation getVolProgrammation() {
        return volProgrammation;
    }
    
    public void setVolProgrammation(VolProgrammation volProgrammation) {
        this.volProgrammation = volProgrammation;
    }
    
    public TarifDiffusionPublicite getTarif() {
        return tarif;
    }
    
    public void setTarif(TarifDiffusionPublicite tarif) {
        this.tarif = tarif;
    }
    
    public Integer getNombreDiffusions() {
        return nombreDiffusions;
    }
    
    public void setNombreDiffusions(Integer nombreDiffusions) {
        this.nombreDiffusions = nombreDiffusions;
    }
    
    public LocalDateTime getDateDiffusion() {
        return dateDiffusion;
    }
    
    public void setDateDiffusion(LocalDateTime dateDiffusion) {
        this.dateDiffusion = dateDiffusion;
    }
    
    public BigDecimal getCoutUnitaire() {
        return coutUnitaire;
    }
    
    public void setCoutUnitaire(BigDecimal coutUnitaire) {
        this.coutUnitaire = coutUnitaire;
    }
    
    public String getNotes() {
        return notes;
    }
    
    public void setNotes(String notes) {
        this.notes = notes;
    }
    
    // Helper method to calculate total cost
    public BigDecimal getCoutTotal() {
        if (coutUnitaire == null || nombreDiffusions == null) {
            return BigDecimal.ZERO;
        }
        return coutUnitaire.multiply(new BigDecimal(nombreDiffusions));
    }
}
