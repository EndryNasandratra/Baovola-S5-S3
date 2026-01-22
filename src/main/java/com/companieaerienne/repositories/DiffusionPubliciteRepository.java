package com.companieaerienne.repositories;

import com.companieaerienne.entities.DiffusionPublicite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

@Repository
public interface DiffusionPubliciteRepository extends JpaRepository<DiffusionPublicite, Long> {
    
    List<DiffusionPublicite> findByVolProgrammationId(Long volProgrammationId);
    
    List<DiffusionPublicite> findByVideoId(Long videoId);
    
    List<DiffusionPublicite> findByDateDiffusionBetween(LocalDateTime start, LocalDateTime end);
    
    List<DiffusionPublicite> findAllByOrderByDateDiffusionDesc();
    
    @Query("SELECT d FROM DiffusionPublicite d " +
           "WHERE d.video.societe.id = :societeId " +
           "ORDER BY d.dateDiffusion DESC")
    List<DiffusionPublicite> findBySocieteId(@Param("societeId") Long societeId);
    
    @Query("SELECT SUM(d.nombreDiffusions * d.coutUnitaire) FROM DiffusionPublicite d " +
           "WHERE YEAR(d.dateDiffusion) = :annee AND MONTH(d.dateDiffusion) = :mois")
    BigDecimal calculateCAByMonth(@Param("annee") int annee, @Param("mois") int mois);
    
    @Query("SELECT d.video.societe.nom as societe, SUM(d.nombreDiffusions * d.coutUnitaire) as ca " +
           "FROM DiffusionPublicite d " +
           "WHERE YEAR(d.dateDiffusion) = :annee AND MONTH(d.dateDiffusion) = :mois " +
           "GROUP BY d.video.societe.id, d.video.societe.nom")
    List<Map<String, Object>> calculateCABySocieteAndMonth(@Param("annee") int annee, @Param("mois") int mois);
}
