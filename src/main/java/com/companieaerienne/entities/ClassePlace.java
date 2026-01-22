package com.companieaerienne.entities;

import jakarta.persistence.*;
import lombok.Data;
import java.io.Serializable;

@Entity
@Data
@Table(name = "classe_place")
@IdClass(ClassePlace.ClassePlaceId.class)
public class ClassePlace {
    
    @Id
    @ManyToOne
    @JoinColumn(name = "id_classe")
    private Classe classe;

    @Id
    @ManyToOne
    @JoinColumn(name = "id_avion")
    private Avion avion;

    @Column(name = "place_debut")
    private Integer placeDebut;

    @Column(name = "place_fin")
    private Integer placeFin;

    // Classe interne pour la clé composite
    @Data
    public static class ClassePlaceId implements Serializable {
        private Integer classe;
        private Integer avion;
    }
}
