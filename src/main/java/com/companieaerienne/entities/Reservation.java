package com.companieaerienne.entities;

import jakarta.persistence.*;
import lombok.Data;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Entity
@Data
@Table(name = "reservation")
public class Reservation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_vol_programmation")
    private VolProgrammation volProgrammation;

    @ManyToOne
    @JoinColumn(name = "id_client")
    private Client client;

    @Column(name = "nombre_places")
    private Integer nombrePlaces;

    @ElementCollection
    @CollectionTable(name = "reservation_place", joinColumns = @JoinColumn(name = "id_reservation"))
    private List<ReservationPlace> detailsPlaces; // Liste des numéros de places et types passagers

    @Transient
    public List<Integer> getPlacesSelectionnees() {
        if (detailsPlaces == null) return List.of();
        return detailsPlaces.stream().map(ReservationPlace::getPlace).toList();
    }

    @Transient
    public void setPlacesSelectionnees(List<Integer> places) {
        if (places == null) return;
        this.detailsPlaces = places.stream()
            .map(p -> {
                ReservationPlace rp = new ReservationPlace();
                rp.setPlace(p);
                // Le type de passager sera défini plus tard ou restera null si non spécifié
                return rp;
            })
            .collect(java.util.stream.Collectors.toList());
    }
}
