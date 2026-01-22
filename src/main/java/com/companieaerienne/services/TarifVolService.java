package com.companieaerienne.services;

import com.companieaerienne.entities.TarifVol;
import com.companieaerienne.repositories.TarifVolRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class TarifVolService {
    @Autowired
    private TarifVolRepository repository;

    public List<TarifVol> findAll() { return repository.findAll(); }
    public Optional<TarifVol> findById(Integer id) { return repository.findById(id); }
    public TarifVol save(TarifVol entity) { return repository.save(entity); }
    public void deleteById(Integer id) { repository.deleteById(id); }
    
    public List<TarifVol> findByVolProgrammationId(Integer volProgrammationId) {
        return repository.findByVolProgrammationId(volProgrammationId);
    }
}
