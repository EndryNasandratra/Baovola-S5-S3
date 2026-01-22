package com.companieaerienne.entities;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "aeroport")
public class Aeroport {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(length = 100)
    private String nom;
}
