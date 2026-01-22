package com.companieaerienne.services;

import com.companieaerienne.entities.Avion;
import com.companieaerienne.repositories.AvionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class AvionService {
    @Autowired
    private AvionRepository repository;

    public List<Avion> findAll() { return repository.findAll(); }
    public Optional<Avion> findById(Integer id) { return repository.findById(id); }
    public Avion save(Avion entity) { return repository.save(entity); }
    public void deleteById(Integer id) { repository.deleteById(id); }
}
