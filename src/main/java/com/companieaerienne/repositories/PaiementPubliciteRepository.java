package com.companieaerienne.repositories;

import com.companieaerienne.entities.PaiementPublicite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Repository
public interface PaiementPubliciteRepository extends JpaRepository<PaiementPublicite, Long> {

    // Trouver tous les paiements d'une société
    List<PaiementPublicite> findBySocieteAnnonceur_IdOrderByDatePaiementDesc(Long idSociete);

    // Calculer le total payé par une société
    @Query("SELECT COALESCE(SUM(p.montant), 0) FROM PaiementPublicite p WHERE p.societeAnnonceur.id = :idSociete")
    BigDecimal calculerTotalPayeParSociete(@Param("idSociete") Long idSociete);

    // Récupérer le reste à payer pour toutes les sociétés
    @Query(value = "SELECT * FROM v_reste_a_payer_par_societe", nativeQuery = true)
    List<Map<String, Object>> getResteAPayerParSociete();

    // Récupérer le reste à payer pour une société spécifique
    @Query(value = "SELECT * FROM v_reste_a_payer_par_societe WHERE id_societe = :idSociete", nativeQuery = true)
    Map<String, Object> getResteAPayerPourSociete(@Param("idSociete") Long idSociete);

    // Récupérer tous les paiements avec détails
    @Query(value = "SELECT * FROM v_paiements_details", nativeQuery = true)
    List<Map<String, Object>> getPaiementsAvecDetails();
}
