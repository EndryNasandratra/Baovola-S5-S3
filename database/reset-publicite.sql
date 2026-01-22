-- ============================================
-- SCRIPT DE RÉINITIALISATION DES TABLES PUBLICITÉ
-- ============================================
-- Ce script supprime et recrée toutes les tables du module publicité
-- ATTENTION: Toutes les données seront perdues!

-- Suppression des vues (dans l'ordre)
DROP VIEW IF EXISTS v_paiements_details CASCADE;
DROP VIEW IF EXISTS v_reste_a_payer_par_societe CASCADE;
DROP VIEW IF EXISTS v_tarif_diffusion_actuel CASCADE;
DROP VIEW IF EXISTS v_statistiques_publicite_globales CASCADE;
DROP VIEW IF EXISTS v_ca_publicite_par_vol CASCADE;
DROP VIEW IF EXISTS v_ca_par_video CASCADE;
DROP VIEW IF EXISTS v_ca_publicite_par_societe_mois CASCADE;

-- Suppression des tables (dans l'ordre inverse des dépendances)
DROP TABLE IF EXISTS paiement_publicite CASCADE;
DROP TABLE IF EXISTS diffusion_publicite CASCADE;
DROP TABLE IF EXISTS tarif_diffusion_publicite CASCADE;
DROP TABLE IF EXISTS video_publicitaire CASCADE;
DROP TABLE IF EXISTS societe_annonceur CASCADE;

-- ============================================
-- RECRÉATION DES TABLES ET VUES
-- ============================================

-- Table des sociétés annonceurs (clients publicitaires)
CREATE TABLE societe_annonceur (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(150) NOT NULL,
    contact_nom VARCHAR(100),
    email VARCHAR(150),
    telephone VARCHAR(20),
    adresse TEXT,
    actif BOOLEAN DEFAULT TRUE,
    date_inscription TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des vidéos publicitaires
CREATE TABLE video_publicitaire (
    id SERIAL PRIMARY KEY,
    id_societe INTEGER REFERENCES societe_annonceur(id) ON DELETE CASCADE,
    titre VARCHAR(200) NOT NULL,
    description TEXT,
    duree INTEGER NOT NULL, -- durée en secondes
    url_video VARCHAR(500),
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actif BOOLEAN DEFAULT TRUE -- pour activer/désactiver une pub
);

-- Table des tarifs de diffusion (historique des prix)
CREATE TABLE tarif_diffusion_publicite (
    id SERIAL PRIMARY KEY,
    montant DECIMAL(12,2) NOT NULL, -- montant par diffusion
    date_debut TIMESTAMP NOT NULL,
    date_fin TIMESTAMP, -- NULL si tarif actuel
    description VARCHAR(200),
    actif BOOLEAN DEFAULT TRUE
);

-- Table des diffusions de publicités
CREATE TABLE diffusion_publicite (
    id SERIAL PRIMARY KEY,
    id_video INTEGER REFERENCES video_publicitaire(id) ON DELETE CASCADE,
    id_vol_programmation INTEGER REFERENCES vol_programmation(id) ON DELETE CASCADE,
    id_tarif INTEGER REFERENCES tarif_diffusion_publicite(id),
    nombre_diffusions INTEGER NOT NULL DEFAULT 1, -- nombre de fois que la pub est diffusée
    date_diffusion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cout_unitaire DECIMAL(12,2) NOT NULL, -- prix au moment de la diffusion
    cout_total DECIMAL(12,2) GENERATED ALWAYS AS (nombre_diffusions * cout_unitaire) STORED,
    notes TEXT
);

-- Table des paiements effectués par les sociétés annonceurs
CREATE TABLE paiement_publicite (
    id_paiement SERIAL PRIMARY KEY,
    id_societe INT NOT NULL REFERENCES societe_annonceur(id),
    montant DECIMAL(15, 2) NOT NULL CHECK (montant > 0),
    date_paiement DATE NOT NULL,
    reference_paiement VARCHAR(100),
    remarque TEXT,
    CONSTRAINT fk_paiement_societe FOREIGN KEY (id_societe) REFERENCES societe_annonceur(id)
);

-- ============================================
-- INDEX POUR PERFORMANCES
-- ============================================

CREATE INDEX idx_diffusion_date ON diffusion_publicite(date_diffusion);
CREATE INDEX idx_diffusion_video ON diffusion_publicite(id_video);
CREATE INDEX idx_diffusion_vol ON diffusion_publicite(id_vol_programmation);
CREATE INDEX idx_video_societe ON video_publicitaire(id_societe);
CREATE INDEX idx_tarif_dates ON tarif_diffusion_publicite(date_debut, date_fin);

-- ============================================
-- VUES POUR RAPPORTS ET STATISTIQUES
-- ============================================

-- Vue: CA par société et par mois
CREATE OR REPLACE VIEW v_ca_publicite_par_societe_mois AS
SELECT 
    sa.id AS id_societe,
    sa.nom AS nom_societe,
    EXTRACT(YEAR FROM dp.date_diffusion) AS annee,
    EXTRACT(MONTH FROM dp.date_diffusion) AS mois,
    COUNT(dp.id) AS nombre_enregistrements,
    SUM(dp.nombre_diffusions) AS total_diffusions,
    SUM(dp.cout_total) AS chiffre_affaires,
    AVG(dp.cout_unitaire) AS cout_moyen_unitaire
FROM diffusion_publicite dp
JOIN video_publicitaire vp ON dp.id_video = vp.id
JOIN societe_annonceur sa ON vp.id_societe = sa.id
GROUP BY sa.id, sa.nom, annee, mois
ORDER BY annee DESC, mois DESC, chiffre_affaires DESC;

-- Vue: CA par vidéo publicitaire
CREATE OR REPLACE VIEW v_ca_par_video AS
SELECT 
    vp.id AS id_video,
    vp.titre AS titre_video,
    sa.id AS id_societe,
    sa.nom AS nom_societe,
    COUNT(dp.id) AS nombre_diffusions_enregistrees,
    SUM(dp.nombre_diffusions) AS total_fois_diffusee,
    SUM(dp.cout_total) AS chiffre_affaires_total,
    AVG(dp.cout_unitaire) AS cout_moyen_unitaire,
    MIN(dp.date_diffusion) AS premiere_diffusion,
    MAX(dp.date_diffusion) AS derniere_diffusion
FROM video_publicitaire vp
JOIN societe_annonceur sa ON vp.id_societe = sa.id
LEFT JOIN diffusion_publicite dp ON vp.id = dp.id_video
GROUP BY vp.id, vp.titre, sa.id, sa.nom
ORDER BY chiffre_affaires_total DESC NULLS LAST;

-- Vue: CA par vol programmé
CREATE OR REPLACE VIEW v_ca_publicite_par_vol AS
SELECT 
    vp_prog.id AS id_vol_programmation,
    v.id AS id_vol,
    ad.nom AS aeroport_depart,
    aa.nom AS aeroport_arrivee,
    vp_prog.date_heure,
    COUNT(dp.id) AS nombre_pubs_diffusees,
    SUM(dp.nombre_diffusions) AS total_diffusions,
    SUM(dp.cout_total) AS chiffre_affaires
FROM vol_programmation vp_prog
JOIN vol v ON vp_prog.id_vol = v.id
JOIN aeroport ad ON v.id_aeroport_depart = ad.id
JOIN aeroport aa ON v.id_aeroport_arrivee = aa.id
LEFT JOIN diffusion_publicite dp ON vp_prog.id = dp.id_vol_programmation
GROUP BY vp_prog.id, v.id, ad.nom, aa.nom, vp_prog.date_heure
ORDER BY vp_prog.date_heure DESC;

-- Vue: Statistiques globales par période
CREATE OR REPLACE VIEW v_statistiques_publicite_globales AS
SELECT 
    EXTRACT(YEAR FROM dp.date_diffusion) AS annee,
    EXTRACT(MONTH FROM dp.date_diffusion) AS mois,
    COUNT(DISTINCT dp.id_video) AS nombre_videos_diffusees,
    COUNT(DISTINCT vp.id_societe) AS nombre_societes,
    COUNT(DISTINCT dp.id_vol_programmation) AS nombre_vols,
    COUNT(dp.id) AS nombre_enregistrements_diffusion,
    SUM(dp.nombre_diffusions) AS total_diffusions,
    SUM(dp.cout_total) AS chiffre_affaires_total,
    AVG(dp.cout_unitaire) AS cout_moyen_unitaire
FROM diffusion_publicite dp
JOIN video_publicitaire vp ON dp.id_video = vp.id
GROUP BY annee, mois
ORDER BY annee DESC, mois DESC;

-- Vue: Tarif actuel de diffusion
CREATE OR REPLACE VIEW v_tarif_diffusion_actuel AS
SELECT *
FROM tarif_diffusion_publicite
WHERE actif = TRUE 
  AND date_debut <= CURRENT_TIMESTAMP 
  AND (date_fin IS NULL OR date_fin >= CURRENT_TIMESTAMP)
ORDER BY date_debut DESC
LIMIT 1;

-- Vue pour le reste à payer par société
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

-- Vue détaillée des paiements avec informations société
CREATE OR REPLACE VIEW v_paiements_details AS
SELECT 
    pp.id_paiement,
    pp.id_societe,
    sa.nom AS nom_societe,
    pp.montant,
    pp.date_paiement,
    pp.reference_paiement,
    pp.remarque
FROM paiement_publicite pp
JOIN societe_annonceur sa ON pp.id_societe = sa.id
ORDER BY pp.date_paiement DESC;

-- ============================================
-- DONNÉES INITIALES
-- ============================================

-- Insertion du tarif initial (400 000 Ar)
INSERT INTO tarif_diffusion_publicite (montant, date_debut, date_fin, description, actif)
VALUES (400000.00, '2025-01-01', NULL, 'Tarif initial - 400 000 Ar par diffusion', TRUE);

-- Exemples de sociétés
INSERT INTO societe_annonceur (nom, contact_nom, email, telephone, actif)
VALUES 
    ('Vaniala', 'Contact Vaniala', 'contact@vaniala.mg', '034 00 000 01', TRUE),
    ('Lewis', 'Contact Lewis', 'contact@lewis.mg', '034 00 000 02', TRUE);

-- ============================================
-- COMMENTAIRES ET DOCUMENTATION
-- ============================================

COMMENT ON TABLE societe_annonceur IS 'Sociétés clientes qui font de la publicité dans les avions';
COMMENT ON TABLE video_publicitaire IS 'Vidéos publicitaires des sociétés';
COMMENT ON TABLE tarif_diffusion_publicite IS 'Historique des tarifs de diffusion publicitaire';
COMMENT ON TABLE diffusion_publicite IS 'Enregistrement de chaque diffusion de publicité sur un vol (avec nombre de fois diffusée)';
COMMENT ON TABLE paiement_publicite IS 'Paiements effectués par les sociétés annonceurs';

COMMENT ON COLUMN diffusion_publicite.nombre_diffusions IS 'Nombre de fois que la pub est passée durant ce vol';
COMMENT ON COLUMN diffusion_publicite.cout_unitaire IS 'Prix par diffusion au moment de l''enregistrement';
COMMENT ON COLUMN diffusion_publicite.cout_total IS 'Calculé automatiquement: nombre_diffusions × cout_unitaire';

-- ============================================
-- SCRIPT TERMINÉ
-- ============================================
-- Tables créées: societe_annonceur, video_publicitaire, tarif_diffusion_publicite, diffusion_publicite, paiement_publicite
-- Vues créées: 7 vues pour les rapports et statistiques
-- Données initiales: Tarif à 400 000 Ar + 2 sociétés (Vaniala, Lewis)
