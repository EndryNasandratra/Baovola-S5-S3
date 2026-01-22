CREATE TABLE avion (
    id SERIAL PRIMARY KEY,
    matricule VARCHAR(50),
    capacite INTEGER
);

-- Création de la table Aeroport
CREATE TABLE aeroport (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100)
);

-- Création de la table Pilote
CREATE TABLE pilote (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100)
);

-- Création de la table Vol
CREATE TABLE vol (
    id SERIAL PRIMARY KEY,
    id_aeroport_depart INTEGER REFERENCES aeroport(id),
    id_aeroport_arrivee INTEGER REFERENCES aeroport(id),
    duree DECIMAL(5,2)
);

-- Création de la table StatutVol
CREATE TABLE statut_vol (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50)
);

-- Création de la table VolProgrammation (L'avion est assigné à la programmation)
CREATE TABLE vol_programmation (
    id serial primary key,
    id_vol INTEGER REFERENCES vol(id),
    id_avion INTEGER REFERENCES avion(id),
    date_heure TIMESTAMP
);

-- Historique des statuts d'une programmation de vol
CREATE TABLE vol_programmation_statut (
    id SERIAL PRIMARY KEY,
    id_vol_programmation INTEGER REFERENCES vol_programmation(id),
    id_statut INTEGER REFERENCES statut_vol(id),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Création de la table AvionPilote
CREATE TABLE avion_pilote (
    id_avion INTEGER REFERENCES avion(id),
    id_pilote INTEGER REFERENCES pilote(id),
    date DATE,
    PRIMARY KEY (id_avion, id_pilote, date)
);

-- Création de la table Client
CREATE TABLE client (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(150),
    telephone VARCHAR(20)
);

-- Création de la table Classe
CREATE TABLE classe (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50)
);

-- Création de la table ClassePlace (définit les plages de sièges par classe et par avion)
CREATE TABLE classe_place (
    id_classe INTEGER REFERENCES classe(id),
    place_debut INTEGER,
    place_fin INTEGER,
    id_avion INTEGER REFERENCES avion(id),
    PRIMARY KEY (id_classe, id_avion)
);

-- Création de la table Reservation (lien vers la programmation du vol)
CREATE TABLE reservation (
    id SERIAL PRIMARY KEY,
    id_vol_programmation INTEGER REFERENCES vol_programmation(id),
    id_client INTEGER REFERENCES client(id),
    nombre_places INTEGER DEFAULT 1
);

-- Création de la table TypePassager
CREATE TABLE type_passager (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

-- Création de la table ReservationPlace
CREATE TABLE reservation_place (
    id_reservation INTEGER REFERENCES reservation(id),
    place INTEGER,
    id_type_passager INTEGER REFERENCES type_passager(id)
);

-- Création de la table StatutReservation
CREATE TABLE statut_reservation (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50)
);

-- Création de la table HistoriqueReservation
CREATE TABLE historique_reservation (
    id SERIAL PRIMARY KEY,
    id_reservation INTEGER REFERENCES reservation(id),
    id_statut INTEGER REFERENCES statut_reservation(id),
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Création de la table TarifVol
CREATE TABLE tarif_vol (
    id SERIAL PRIMARY KEY,
    id_vol_programmation INTEGER REFERENCES vol_programmation(id),
    id_classe INTEGER REFERENCES classe(id),
    id_type_passager INTEGER REFERENCES type_passager(id),
    tarif DECIMAL(10,2)
);

CREATE TABLE remise_tarif (
    id SERIAL PRIMARY KEY,
    remise NUMERIC(10,2) NOT NULL,
    formule VARCHAR(10) NOT NULL,
    id_type_passager_appliquer INTEGER REFERENCES type_passager(id), 
    id_type_passager_reference INTEGER REFERENCES type_passager(id), 
    id_classe INTEGER REFERENCES classe(id),
    id_vol_programmation INTEGER REFERENCES vol_programmation(id)
);