package com.companieaerienne.entities;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Entity
@Data
@Table(name = "vol")
public class Vol {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;



    @ManyToOne
    @JoinColumn(name = "id_aeroport_depart")
    private Aeroport aeroportDepart;

    @ManyToOne
    @JoinColumn(name = "id_aeroport_arrivee")
    private Aeroport aeroportArrivee;

    @Column(precision = 5, scale = 2)
    private BigDecimal duree; // Durée en heures (ex: 2.25 pour 2h15)


    @OneToMany(mappedBy = "vol", fetch = FetchType.EAGER)
    private List<VolProgrammation> programmations;

    public List<LocalDate> getJours() {
        if (programmations == null) return List.of();
        return programmations.stream()
            .map(p -> p.getDateHeure().toLocalDate())
            .distinct()
            .toList();
    }

    public List<LocalTime> getHeures() {
        if (programmations == null) return List.of();
        return programmations.stream()
            .map(p -> p.getDateHeure().toLocalTime())
            .distinct()
            .toList();
    }
}

