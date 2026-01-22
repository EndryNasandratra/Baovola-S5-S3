package com.companieaerienne.services;

import com.companieaerienne.entities.Reservation;
import com.companieaerienne.repositories.ReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class ReservationService {
    @Autowired
    private ReservationRepository repository;

    public List<Reservation> findAll() { return repository.findAll(); }
    public Optional<Reservation> findById(Integer id) { return repository.findById(id); }
    public Reservation save(Reservation entity) { return repository.save(entity); }
    public void deleteById(Integer id) { repository.deleteById(id); }
    
    public List<Reservation> findByVolProgrammationId(Integer volProgrammationId) {
        return repository.findByVolProgrammationId(volProgrammationId);
    }
    
    public List<Integer> getOccupiedSeats(Integer volProgrammationId) {
        return repository.findOccupiedSeatsByVolProgrammationId(volProgrammationId);
    }

    public List<Integer> getOccupiedSeatsExcluding(Integer volProgrammationId, Integer reservationId) {
        return repository.findOccupiedSeatsByVolProgrammationIdExcludingReservation(volProgrammationId, reservationId);
    }
}
