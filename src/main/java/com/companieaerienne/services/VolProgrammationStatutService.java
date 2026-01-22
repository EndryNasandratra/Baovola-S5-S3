package com.companieaerienne.services;

import com.companieaerienne.entities.VolProgrammationStatut;
import com.companieaerienne.repositories.VolProgrammationStatutRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class VolProgrammationStatutService {
    @Autowired
    private VolProgrammationStatutRepository repository;

    public List<VolProgrammationStatut> findAll() {
        return repository.findAll();
    }

    public Optional<VolProgrammationStatut> findById(Integer id) {
        return repository.findById(id);
    }

    public VolProgrammationStatut save(VolProgrammationStatut entity) {
        return repository.save(entity);
    }

    public void deleteById(Integer id) {
        repository.deleteById(id);
    }
}
