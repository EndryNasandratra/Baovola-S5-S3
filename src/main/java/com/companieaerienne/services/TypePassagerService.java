package com.companieaerienne.services;

import com.companieaerienne.entities.TypePassager;
import com.companieaerienne.repositories.TypePassagerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TypePassagerService {
    @Autowired
    private TypePassagerRepository typePassagerRepository;

    public List<TypePassager> findAll() {
        return typePassagerRepository.findAll();
    }

    public Optional<TypePassager> findById(Integer id) {
        return typePassagerRepository.findById(id);
    }

    public TypePassager save(TypePassager typePassager) {
        return typePassagerRepository.save(typePassager);
    }

    public void deleteById(Integer id) {
        typePassagerRepository.deleteById(id);
    }
}
