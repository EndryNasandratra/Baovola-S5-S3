package com.companieaerienne.services;

import com.companieaerienne.entities.Classe;
import com.companieaerienne.repositories.ClasseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class ClasseService {
    @Autowired
    private ClasseRepository repository;

    public List<Classe> findAll() { return repository.findAll(); }
    public Optional<Classe> findById(Integer id) { return repository.findById(id); }
    public Classe save(Classe entity) { return repository.save(entity); }
    public void deleteById(Integer id) { repository.deleteById(id); }
}
