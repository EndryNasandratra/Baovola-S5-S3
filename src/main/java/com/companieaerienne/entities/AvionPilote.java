package com.companieaerienne.entities;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDate;

@Entity
@Data
@Table(name = "avion_pilote")
@IdClass(AvionPiloteId.class)
public class AvionPilote {
    @Id
    @ManyToOne
    @JoinColumn(name = "id_avion", nullable = false)
    private Avion avion;

    @Id
    @ManyToOne
    @JoinColumn(name = "id_pilote", nullable = false)
    private Pilote pilote;

    @Id
    @Column(name = "date", nullable = false)
    private LocalDate date;
}
