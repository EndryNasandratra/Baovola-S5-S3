package com.companieaerienne.repositories;

import com.companieaerienne.entities.TypePassager;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TypePassagerRepository extends JpaRepository<TypePassager, Integer> {
}
