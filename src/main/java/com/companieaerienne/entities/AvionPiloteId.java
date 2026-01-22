package com.companieaerienne.entities;

import java.io.Serializable;
import java.time.LocalDate;
import lombok.Data;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.EqualsAndHashCode;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
public class AvionPiloteId implements Serializable {
    private Integer avion;
    private Integer pilote;
    private LocalDate date;
}
