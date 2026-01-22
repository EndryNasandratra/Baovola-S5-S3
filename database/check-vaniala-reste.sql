-- ============================================
-- CALCUL DU RESTE À PAYER POUR VANIALA
-- ============================================

-- 1. Voir toutes les diffusions de Vaniala
SELECT 
    'DIFFUSIONS' AS type,
    vp.titre AS description,
    dp.nombre_diffusions,
    dp.cout_unitaire,
    dp.cout_total,
    dp.date_diffusion
FROM societe_annonceur sa
JOIN video_publicitaire vp ON sa.id = vp.id_societe
JOIN diffusion_publicite dp ON vp.id = dp.id_video
WHERE sa.nom = 'Vaniala'
ORDER BY dp.date_diffusion;

-- 2. Total à payer (somme des diffusions)
SELECT 
    'TOTAL À PAYER' AS description,
    COALESCE(SUM(dp.cout_total), 0) AS montant
FROM societe_annonceur sa
JOIN video_publicitaire vp ON sa.id = vp.id_societe
JOIN diffusion_publicite dp ON vp.id = dp.id_video
WHERE sa.nom = 'Vaniala';

-- 3. Voir tous les paiements de Vaniala
SELECT 
    'PAIEMENTS' AS type,
    pp.date_paiement,
    pp.montant,
    pp.reference_paiement,
    pp.remarque
FROM societe_annonceur sa
JOIN paiement_publicite pp ON sa.id = pp.id_societe
WHERE sa.nom = 'Vaniala'
ORDER BY pp.date_paiement;

-- 4. Total payé
SELECT 
    'TOTAL PAYÉ' AS description,
    COALESCE(SUM(pp.montant), 0) AS montant
FROM societe_annonceur sa
LEFT JOIN paiement_publicite pp ON sa.id = pp.id_societe
WHERE sa.nom = 'Vaniala';

-- 5. RESTE À PAYER (calcul final)
SELECT 
    sa.nom AS societe,
    COALESCE(SUM(dp.cout_total), 0) AS total_a_payer,
    COALESCE(SUM(DISTINCT pp.montant), 0) AS total_paye_ERREUR_SI_UTILISE_AINSI,
    (SELECT COALESCE(SUM(montant), 0) FROM paiement_publicite WHERE id_societe = sa.id) AS total_paye_CORRECT,
    COALESCE(SUM(dp.cout_total), 0) - 
    (SELECT COALESCE(SUM(montant), 0) FROM paiement_publicite WHERE id_societe = sa.id) AS reste_a_payer
FROM societe_annonceur sa
LEFT JOIN video_publicitaire vp ON sa.id = vp.id_societe
LEFT JOIN diffusion_publicite dp ON vp.id = dp.id_video
LEFT JOIN paiement_publicite pp ON sa.id = pp.id_societe
WHERE sa.nom = 'Vaniala'
GROUP BY sa.id, sa.nom;

-- 6. OU SIMPLEMENT utiliser la vue corrigée
SELECT * FROM v_reste_a_payer_par_societe WHERE nom_societe = 'Vaniala';
