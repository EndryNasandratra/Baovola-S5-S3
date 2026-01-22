package com.companieaerienne.services;

import com.companieaerienne.entities.StatutVol;
import com.companieaerienne.repositories.StatutVolRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class StatutVolService {
    @Autowired
    private StatutVolRepository repository;

    public List<StatutVol> findAll() { return repository.findAll(); }
    public Optional<StatutVol> findById(Integer id) { return repository.findById(id); }
    public StatutVol save(StatutVol entity) { return repository.save(entity); }
    public void deleteById(Integer id) { repository.deleteById(id); }
}
