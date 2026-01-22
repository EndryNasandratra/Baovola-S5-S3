package com.companieaerienne.repositories;

import com.companieaerienne.entities.HistoriqueReservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface HistoriqueReservationRepository extends JpaRepository<HistoriqueReservation, Integer> {
    List<HistoriqueReservation> findByReservationIdOrderByDateDesc(Integer reservationId);
}
