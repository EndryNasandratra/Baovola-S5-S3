package com.companieaerienne.entities;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data
@Table(name = "type_passager")
public class TypePassager {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    private String nom;
}
