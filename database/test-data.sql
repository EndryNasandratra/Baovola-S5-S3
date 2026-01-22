-- ===============================
-- INSERTIONS DES DONNÉES DE TEST
-- ===============================

-- ===============================
-- TABLE: aeroport
-- ===============================
INSERT INTO aeroport (nom) VALUES
('TNR'),
('NSB'),
('ANT'),
('MHG'),
('SM'),
('TOL'),
('TOA'),
('MOR');

-- ===============================
-- TABLE: pilote
-- ===============================
INSERT INTO pilote (nom, prenom) VALUES
('Rakoto', 'Jean'),
('Randria', 'Paul'),
('Razafy', 'Marie'),
('Andrianina', 'Michel'),
('Raharison', 'Sophie');

-- ===============================
-- TABLE: avion
-- ===============================
INSERT INTO avion (matricule, capacite) VALUES
('5R-MFT', 180),
('5R-MGA', 150),
('5R-MJA', 120),
('5R-MVT', 100),
('5R-MKA', 200);

-- ===============================
-- TABLE: classe
-- ===============================
INSERT INTO classe (nom) VALUES
('Économique'),
('Affaires'),
('Première Classe');

-- ===============================
-- TABLE: type_passager
-- ===============================
INSERT INTO type_passager (nom) VALUES
('Adulte'),
('Enfant');

-- ===============================
-- TABLE: client
-- ===============================
INSERT INTO client (nom, prenom, email, telephone) VALUES
('Rakotomalala', 'Jean', 'jean.rakoto@email.mg', '0341234567'),
('Rasoanaivo', 'Marie', 'marie.rasoanaivo@email.mg', '0339876543'),
('Andriamanjato', 'Paul', 'paul.andria@email.mg', '0325544433'),
('Razafindrakoto', 'Sophie', 'sophie.raza@email.mg', '0347788899'),
('Randrianarisoa', 'Michel', 'michel.randria@email.mg', '0332211100');

-- ===============================
-- TABLE: classe_place
-- ===============================
INSERT INTO classe_place (id_classe, place_debut, place_fin, id_avion)
SELECT c.id, 1, 12, a.id FROM classe c, avion a WHERE c.nom = 'Première Classe' AND a.matricule = '5R-MFT'
UNION ALL
SELECT c.id, 13, 36, a.id FROM classe c, avion a WHERE c.nom = 'Affaires' AND a.matricule = '5R-MFT'
UNION ALL
SELECT c.id, 37, 180, a.id FROM classe c, avion a WHERE c.nom = 'Économique' AND a.matricule = '5R-MFT'
UNION ALL
SELECT c.id, 1, 10, a.id FROM classe c, avion a WHERE c.nom = 'Première Classe' AND a.matricule = '5R-MGA'
UNION ALL
SELECT c.id, 11, 30, a.id FROM classe c, avion a WHERE c.nom = 'Affaires' AND a.matricule = '5R-MGA'
UNION ALL
SELECT c.id, 31, 150, a.id FROM classe c, avion a WHERE c.nom = 'Économique' AND a.matricule = '5R-MGA'
UNION ALL
SELECT c.id, 1, 24, a.id FROM classe c, avion a WHERE c.nom = 'Affaires' AND a.matricule = '5R-MJA'
UNION ALL
SELECT c.id, 25, 120, a.id FROM classe c, avion a WHERE c.nom = 'Économique' AND a.matricule = '5R-MJA'
UNION ALL
SELECT c.id, 1, 100, a.id FROM classe c, avion a WHERE c.nom = 'Économique' AND a.matricule = '5R-MVT'
UNION ALL
SELECT c.id, 1, 16, a.id FROM classe c, avion a WHERE c.nom = 'Première Classe' AND a.matricule = '5R-MKA'
UNION ALL
SELECT c.id, 17, 48, a.id FROM classe c, avion a WHERE c.nom = 'Affaires' AND a.matricule = '5R-MKA'
UNION ALL
SELECT c.id, 49, 200, a.id FROM classe c, avion a WHERE c.nom = 'Économique' AND a.matricule = '5R-MKA';

-- ===============================
-- TABLE: vol
-- ===============================
INSERT INTO vol (id_aeroport_depart, id_aeroport_arrivee, duree)
SELECT d.id, a.id, 1.50 FROM aeroport d, aeroport a WHERE d.nom = 'TNR' AND a.nom = 'NSB' -- Vol 1
UNION ALL
SELECT d.id, a.id, 1.50 FROM aeroport d, aeroport a WHERE d.nom = 'NSB' AND a.nom = 'TNR' -- Vol 2
UNION ALL
SELECT d.id, a.id, 1.75 FROM aeroport d, aeroport a WHERE d.nom = 'TNR' AND a.nom = 'ANT' -- Vol 3
UNION ALL
SELECT d.id, a.id, 1.25 FROM aeroport d, aeroport a WHERE d.nom = 'MHG' AND a.nom = 'TNR' -- Vol 4
UNION ALL
SELECT d.id, a.id, 0.75 FROM aeroport d, aeroport a WHERE d.nom = 'TNR' AND a.nom = 'SM'  -- Vol 5
UNION ALL
SELECT d.id, a.id, 1.17 FROM aeroport d, aeroport a WHERE d.nom = 'TNR' AND a.nom = 'TOA' -- Vol 6
UNION ALL
SELECT d.id, a.id, 2.17 FROM aeroport d, aeroport a WHERE d.nom = 'NSB' AND a.nom = 'TNR' -- Vol 7 (Different duree from Vol 2)
UNION ALL
SELECT d.id, a.id, 0.75 FROM aeroport d, aeroport a WHERE d.nom = 'MHG' AND a.nom = 'MOR'; -- Vol 8

-- ===============================
-- TABLE: vol_programmation
-- ===============================
INSERT INTO vol_programmation (id_vol, id_avion, date_heure)
SELECT v.id, av.id, TIMESTAMP '2026-01-10 08:00:00' FROM vol v, avion av, aeroport d, aeroport a WHERE v.id_aeroport_depart = d.id AND v.id_aeroport_arrivee = a.id AND d.nom = 'TNR' AND a.nom = 'NSB' AND v.duree = 1.50 AND av.matricule = '5R-MFT'
UNION ALL
SELECT v.id, av.id, TIMESTAMP '2026-01-10 14:00:00' FROM vol v, avion av, aeroport d, aeroport a WHERE v.id_aeroport_depart = d.id AND v.id_aeroport_arrivee = a.id AND d.nom = 'NSB' AND a.nom = 'TNR' AND v.duree = 1.50 AND av.matricule = '5R-MGA'
UNION ALL
SELECT v.id, av.id, TIMESTAMP '2026-01-11 09:30:00' FROM vol v, avion av, aeroport d, aeroport a WHERE v.id_aeroport_depart = d.id AND v.id_aeroport_arrivee = a.id AND d.nom = 'TNR' AND a.nom = 'ANT' AND av.matricule = '5R-MJA'
UNION ALL
SELECT v.id, av.id, TIMESTAMP '2026-01-12 11:00:00' FROM vol v, avion av, aeroport d, aeroport a WHERE v.id_aeroport_depart = d.id AND v.id_aeroport_arrivee = a.id AND d.nom = 'MHG' AND a.nom = 'TNR' AND av.matricule = '5R-MVT';

-- ===============================
-- TABLE: statut_reservation
-- ===============================
INSERT INTO statut_reservation (nom) VALUES
('En attente'),
('Confirmée'),
('Annulée'),
('Complétée'),
('En cours');

-- ===============================
-- TABLE: statut_vol
-- ===============================
INSERT INTO statut_vol (nom) VALUES
('À l''heure'),
('Retardé'),
('Annulé'),
('Embarquement'),
('En vol'),
('Atterri'),
('En cours');

-- ===============================
-- TABLE: vol_programmation_statut (initialisation)
-- ===============================
INSERT INTO vol_programmation_statut (id_vol_programmation, id_statut)
SELECT vp.id, s.id
FROM vol_programmation vp
JOIN statut_vol s ON s.nom = 'En cours';

-- ===============================
-- TABLE: tarif_vol (initialisation)
-- ===============================
-- ===============================
-- TABLE: remise_tarif
-- ===============================
INSERT INTO remise_tarif (remise, formule, id_type_passager_appliquer, id_type_passager_reference, id_classe, id_vol_programmation) VALUES
(10.00, '%', 2, 1, 1, NULL), -- Enfant = 10% de l'Adulte en Première Classe (Global)
(10.00, '%', 2, 1, 2, NULL), -- Enfant = 10% de l'Adulte en Affaires (Global)
(10.00, '%', 2, 1, 3, NULL); -- Enfant = 10% de l'Adulte en Économique (Global)

-- ===============================
-- TABLE: reservation & reservation_place (exemples)
-- ===============================