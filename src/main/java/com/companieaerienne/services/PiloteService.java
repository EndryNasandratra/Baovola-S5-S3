package com.companieaerienne.services;

import com.companieaerienne.entities.Pilote;
import com.companieaerienne.repositories.PiloteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class PiloteService {
    @Autowired
    private PiloteRepository repository;

    public List<Pilote> findAll() { return repository.findAll(); }
    public Optional<Pilote> findById(Integer id) { return repository.findById(id); }
    public Pilote save(Pilote entity) { return repository.save(entity); }
    public void deleteById(Integer id) { repository.deleteById(id); }
}
