package com.companieaerienne.services;

import com.companieaerienne.entities.Client;
import com.companieaerienne.repositories.ClientRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class ClientService {
    @Autowired
    private ClientRepository repository;

    public List<Client> findAll() { return repository.findAll(); }
    public Optional<Client> findById(Integer id) { return repository.findById(id); }
    public Client save(Client entity) { return repository.save(entity); }
    public void deleteById(Integer id) { repository.deleteById(id); }
}
