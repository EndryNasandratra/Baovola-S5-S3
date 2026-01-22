package com.companieaerienne.entities;

import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Embeddable
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReservationPlace {
    @Column(name = "place")
    private Integer place;

    @ManyToOne
    @JoinColumn(name = "id_type_passager")
    private TypePassager typePassager;
}
