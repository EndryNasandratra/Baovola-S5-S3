package com.companieaerienne.entities;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "societe_annonceur")
public class SocieteAnnonceur {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false, length = 150)
    private String nom;
    
    @Column(name = "contact_nom", length = 100)
    private String contactNom;
    
    @Column(length = 150)
    private String email;
    
    @Column(length = 20)
    private String telephone;
    
    @Column(columnDefinition = "TEXT")
    private String adresse;
    
    @Column(nullable = false)
    private Boolean actif = true;
    
    @Column(name = "date_inscription")
    private LocalDateTime dateInscription = LocalDateTime.now();
    
    @OneToMany(mappedBy = "societe", cascade = CascadeType.ALL)
    private List<VideoPublicitaire> videos;
    
    // Constructors
    public SocieteAnnonceur() {}
    
    public SocieteAnnonceur(String nom, String contactNom, String email, String telephone) {
        this.nom = nom;
        this.contactNom = contactNom;
        this.email = email;
        this.telephone = telephone;
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getNom() {
        return nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public String getContactNom() {
        return contactNom;
    }
    
    public void setContactNom(String contactNom) {
        this.contactNom = contactNom;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public String getTelephone() {
        return telephone;
    }
    
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    
    public String getAdresse() {
        return adresse;
    }
    
    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }
    
    public Boolean getActif() {
        return actif;
    }
    
    public void setActif(Boolean actif) {
        this.actif = actif;
    }
    
    public LocalDateTime getDateInscription() {
        return dateInscription;
    }
    
    public void setDateInscription(LocalDateTime dateInscription) {
        this.dateInscription = dateInscription;
    }
    
    public List<VideoPublicitaire> getVideos() {
        return videos;
    }
    
    public void setVideos(List<VideoPublicitaire> videos) {
        this.videos = videos;
    }
}
