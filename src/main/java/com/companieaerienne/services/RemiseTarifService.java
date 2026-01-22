package com.companieaerienne.services;

import com.companieaerienne.entities.RemiseTarif;
import com.companieaerienne.repositories.RemiseTarifRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class RemiseTarifService {
    @Autowired
    private RemiseTarifRepository repository;

    public List<RemiseTarif> findAll() {
        return repository.findAll();
    }

    public List<RemiseTarif> findByVolProgrammationId(Integer volProgrammationId) {
        return repository.findByVolProgrammationId(volProgrammationId);
    }

    public List<RemiseTarif> findGlobalOrByVolProgrammationId(Integer volProgrammationId) {
        List<RemiseTarif> remises = repository.findByVolProgrammationIsNull();
        if (volProgrammationId != null) {
            remises.addAll(repository.findByVolProgrammationId(volProgrammationId));
        }
        return remises;
    }

    public Optional<RemiseTarif> findById(Integer id) {
        return repository.findById(id);
    }

    public RemiseTarif save(RemiseTarif entity) {
        return repository.save(entity);
    }

    public void deleteById(Integer id) {
        repository.deleteById(id);
    }
}
