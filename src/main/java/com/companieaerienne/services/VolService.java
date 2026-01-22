package com.companieaerienne.services;

import com.companieaerienne.entities.Vol;
import com.companieaerienne.repositories.VolRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class VolService {
    @Autowired
    private VolRepository repository;

    public List<Vol> findAll() { return repository.findAll(); }
    public Optional<Vol> findById(Integer id) { return repository.findById(id); }
    public Vol save(Vol entity) { return repository.save(entity); }
    public void deleteById(Integer id) { repository.deleteById(id); }
}
