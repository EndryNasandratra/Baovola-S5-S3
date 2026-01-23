-- ============================================
-- CORRECTION DE LA VUE v_reste_a_payer_par_societe
-- Problème : Produit cartésien créant des doublons
-- Solution : Utilisation de CTE pour séparer les calculs
-- ============================================

-- Supprimer l'ancienne vue
DROP VIEW IF EXISTS v_reste_a_payer_par_societe CASCADE;

-- Créer la nouvelle vue corrigée
CREATE OR REPLACE VIEW v_reste_a_payer_par_societe AS
WITH diffusions_par_societe AS (
    SELECT 
        sa.id AS id_societe,
        COALESCE(SUM(dp.cout_total), 0) AS total_a_payer
    FROM societe_annonceur sa
    LEFT JOIN video_publicitaire vp ON sa.id = vp.id_societe
    LEFT JOIN diffusion_publicite dp ON vp.id = dp.id_video
    GROUP BY sa.id
),
paiements_par_societe AS (
    SELECT 
        sa.id AS id_societe,
        COALESCE(SUM(pp.montant), 0) AS total_paye
    FROM societe_annonceur sa
    LEFT JOIN paiement_publicite pp ON sa.id = pp.id_societe
    GROUP BY sa.id
)
SELECT 
    sa.id AS id_societe,
    sa.nom AS nom_societe,
    sa.contact_nom AS contact,
    dps.total_a_payer,
    pps.total_paye,
    dps.total_a_payer - pps.total_paye AS reste_a_payer
FROM societe_annonceur sa
LEFT JOIN diffusions_par_societe dps ON sa.id = dps.id_societe
LEFT JOIN paiements_par_societe pps ON sa.id = pps.id_societe
WHERE dps.total_a_payer - pps.total_paye != 0
   OR dps.total_a_payer > 0;