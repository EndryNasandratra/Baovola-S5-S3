package com.companieaerienne.entities;

import jakarta.persistence.*;
import lombok.Data;
import java.math.BigDecimal;

@Entity
@Data
@Table(name = "remise_tarif")
public class RemiseTarif {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    private BigDecimal remise;

    @Column(nullable = false, length = 10)
    private String formule; // "%" ou "-"

    @ManyToOne
    @JoinColumn(name = "id_type_passager_appliquer")
    private TypePassager typePassagerAppliquer;

    @ManyToOne
    @JoinColumn(name = "id_type_passager_reference")
    private TypePassager typePassagerReference;

    @ManyToOne
    @JoinColumn(name = "id_classe")
    private Classe classe;

    @ManyToOne
    @JoinColumn(name = "id_vol_programmation")
    private VolProgrammation volProgrammation;
}
