package com.companieaerienne.repositories;

import com.companieaerienne.entities.Reservation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@Repository
public interface ReservationRepository extends JpaRepository<Reservation, Integer> {
    
    @Query("SELECT r FROM Reservation r WHERE r.volProgrammation.id = :volProgrammationId")
    List<Reservation> findByVolProgrammationId(@Param("volProgrammationId") Integer volProgrammationId);
    
    @Query("SELECT rp.place FROM Reservation r JOIN r.detailsPlaces rp WHERE r.volProgrammation.id = :volProgrammationId")
    List<Integer> findOccupiedSeatsByVolProgrammationId(@Param("volProgrammationId") Integer volProgrammationId);

    @Query("SELECT rp.place FROM Reservation r JOIN r.detailsPlaces rp WHERE r.volProgrammation.id = :volProgrammationId AND r.id <> :reservationId")
    List<Integer> findOccupiedSeatsByVolProgrammationIdExcludingReservation(@Param("volProgrammationId") Integer volProgrammationId, @Param("reservationId") Integer reservationId);
}
