package com.companieaerienne.repositories;

import com.companieaerienne.entities.ClassePlace;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ClassePlaceRepository extends JpaRepository<ClassePlace, ClassePlace.ClassePlaceId> {
    
    @Query("SELECT cp FROM ClassePlace cp WHERE cp.classe.id = :classeId AND cp.avion.id = :avionId")
    ClassePlace findByClasseIdAndAvionId(Integer classeId, Integer avionId);
    
    List<ClassePlace> findByAvionId(Integer avionId);

    void deleteByAvionId(Integer avionId);
}
