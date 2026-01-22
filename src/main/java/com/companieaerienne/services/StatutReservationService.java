package com.companieaerienne.services;

import com.companieaerienne.entities.StatutReservation;
import com.companieaerienne.repositories.StatutReservationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class StatutReservationService {
    @Autowired
    private StatutReservationRepository repository;

    public List<StatutReservation> findAll() { return repository.findAll(); }
    public Optional<StatutReservation> findById(Integer id) { return repository.findById(id); }
    public StatutReservation save(StatutReservation entity) { return repository.save(entity); }
    public void deleteById(Integer id) { repository.deleteById(id); }
}
