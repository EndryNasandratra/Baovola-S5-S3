package com.companieaerienne.entities;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "video_publicitaire")
public class VideoPublicitaire {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne
    @JoinColumn(name = "id_societe", nullable = false)
    private SocieteAnnonceur societe;
    
    @Column(nullable = false, length = 200)
    private String titre;
    
    @Column(columnDefinition = "TEXT")
    private String description;
    
    @Column(nullable = false)
    private Integer duree; // en secondes
    
    @Column(name = "url_video", length = 500)
    private String urlVideo;
    
    @Column(name = "date_creation")
    private LocalDateTime dateCreation = LocalDateTime.now();
    
    @Column(nullable = false)
    private Boolean actif = true;
    
    @OneToMany(mappedBy = "video", cascade = CascadeType.ALL)
    private List<DiffusionPublicite> diffusions;
    
    // Constructors
    public VideoPublicitaire() {}
    
    public VideoPublicitaire(SocieteAnnonceur societe, String titre, Integer duree) {
        this.societe = societe;
        this.titre = titre;
        this.duree = duree;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public SocieteAnnonceur getSociete() {
        return societe;
    }
    
    public void setSociete(SocieteAnnonceur societe) {
        this.societe = societe;
    }
    
    public String getTitre() {
        return titre;
    }
    
    public void setTitre(String titre) {
        this.titre = titre;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public Integer getDuree() {
        return duree;
    }
    
    public void setDuree(Integer duree) {
        this.duree = duree;
    }
    
    public String getUrlVideo() {
        return urlVideo;
    }
    
    public void setUrlVideo(String urlVideo) {
        this.urlVideo = urlVideo;
    }
    
    public LocalDateTime getDateCreation() {
        return dateCreation;
    }
    
    public void setDateCreation(LocalDateTime dateCreation) {
        this.dateCreation = dateCreation;
    }
    
    public Boolean getActif() {
        return actif;
    }
    
    public void setActif(Boolean actif) {
        this.actif = actif;
    }
    
    public List<DiffusionPublicite> getDiffusions() {
        return diffusions;
    }
    
    public void setDiffusions(List<DiffusionPublicite> diffusions) {
        this.diffusions = diffusions;
    }
}
