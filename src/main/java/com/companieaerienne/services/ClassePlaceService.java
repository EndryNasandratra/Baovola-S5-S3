package com.companieaerienne.services;

import com.companieaerienne.entities.ClassePlace;
import com.companieaerienne.repositories.ClassePlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Service
public class ClassePlaceService {
    @Autowired
    private ClassePlaceRepository repository;

    public List<ClassePlace> findAll() { return repository.findAll(); }
    public ClassePlace findByClasseAndAvion(Integer classeId, Integer avionId) {
        return repository.findByClasseIdAndAvionId(classeId, avionId);
    }
    public List<ClassePlace> findByAvion(Integer avionId) {
        return repository.findByAvionId(avionId);
    }
    public ClassePlace save(ClassePlace entity) { return repository.save(entity); }

    @Transactional
    public void deleteByAvion(Integer avionId) {
        repository.deleteByAvionId(avionId);
    }
}
