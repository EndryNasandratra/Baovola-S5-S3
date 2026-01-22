package com.companieaerienne.entities;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "statut_vol")
public class StatutVol {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 50)
    private String nom;
}
