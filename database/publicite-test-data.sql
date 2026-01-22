-- ============================================
-- DONNÉES DE TEST POUR LE MODULE PUBLICITÉ
-- ============================================

-- Insertion d'une société annonceur : Vaniala
INSERT INTO societe_annonceur (nom_societe, contact, email, actif, date_inscription)
VALUES ('Vaniala', '+261 34 12 345 67', 'contact@vaniala.mg', TRUE, '2024-10-01');

-- Insertion d'une vidéo publicitaire pour Vaniala
INSERT INTO video_publicitaire (id_societe, titre_video, duree_secondes, url_video, actif, date_ajout)
VALUES (
    (SELECT id_societe FROM societe_annonceur WHERE nom_societe = 'Vaniala'),
    'Vaniala - Publicité Produits 2025',
    30,
    'https://cdn.vaniala.mg/videos/pub-2025.mp4',
    TRUE,
    '2024-11-15'
);

-- Insertion du tarif initial de diffusion
INSERT INTO tarif_diffusion_publicite (montant_par_diffusion, date_debut, date_fin, date_application)
VALUES (400000, '2024-01-01', '2099-12-31', '2024-01-01');

-- Insertion de quelques diffusions pour générer du CA
-- Diffusions en novembre 2025
INSERT INTO diffusion_publicite (id_video, id_vol_programmation, nombre_diffusions, cout_unitaire, date_diffusion)
VALUES 
    (
        (SELECT id_video FROM video_publicitaire WHERE titre_video = 'Vaniala - Publicité Produits 2025'),
        1, -- Remplacer par un ID valide de vol_programmation
        5,
        400000,
        '2025-11-10'
    ),
    (
        (SELECT id_video FROM video_publicitaire WHERE titre_video = 'Vaniala - Publicité Produits 2025'),
        2, -- Remplacer par un ID valide de vol_programmation
        3,
        400000,
        '2025-11-20'
    );

-- Diffusions en décembre 2025
INSERT INTO diffusion_publicite (id_video, id_vol_programmation, nombre_diffusions, cout_unitaire, date_diffusion)
VALUES 
    (
        (SELECT id_video FROM video_publicitaire WHERE titre_video = 'Vaniala - Publicité Produits 2025'),
        3, -- Remplacer par un ID valide de vol_programmation
        4,
        400000,
        '2025-12-05'
    ),
    (
        (SELECT id_video FROM video_publicitaire WHERE titre_video = 'Vaniala - Publicité Produits 2025'),
        4, -- Remplacer par un ID valide de vol_programmation
        6,
        400000,
        '2025-12-18'
    );

-- Total diffusions : 5 + 3 + 4 + 6 = 18 diffusions
-- Coût total : 18 × 400,000 = 7,200,000 Ar

-- Insertion du paiement de Vaniala : 1,000,000 Ar le 15 décembre 2025
INSERT INTO paiement_publicite (id_societe, montant, date_paiement, reference_paiement, remarque)
VALUES (
    (SELECT id_societe FROM societe_annonceur WHERE nom_societe = 'Vaniala'),
    1000000,
    '2025-12-15',
    'VIREMENT-VANIALA-2025-001',
    'Premier paiement partiel pour campagne publicitaire Nov-Déc 2025'
);

-- Reste à payer pour Vaniala : 7,200,000 - 1,000,000 = 6,200,000 Ar

-- ============================================
-- NOTES
-- ============================================
-- Après avoir exécuté ce script, vous pouvez vérifier les résultats avec :
-- SELECT * FROM v_reste_a_payer_par_societe WHERE nom_societe = 'Vaniala';
-- 
-- Résultat attendu :
-- - total_a_payer : 7,200,000 Ar
-- - total_paye : 1,000,000 Ar
-- - reste_a_payer : 6,200,000 Ar
