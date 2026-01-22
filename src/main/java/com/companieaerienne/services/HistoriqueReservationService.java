package com.companieaerienne.services;

import com.companieaerienne.entities.HistoriqueReservation;
import com.companieaerienne.repositories.HistoriqueReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class HistoriqueReservationService {
    @Autowired
    private HistoriqueReservationRepository repository;

    public List<HistoriqueReservation> findAll() { return repository.findAll(); }
    public Optional<HistoriqueReservation> findById(Integer id) { return repository.findById(id); }
    public HistoriqueReservation save(HistoriqueReservation entity) { return repository.save(entity); }
    public void deleteById(Integer id) { repository.deleteById(id); }
    
    public List<HistoriqueReservation> findByReservationId(Integer reservationId) {
        return repository.findByReservationIdOrderByDateDesc(reservationId);
    }
}
