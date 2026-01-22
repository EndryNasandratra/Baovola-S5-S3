# 📋 TODO - Gestion des Publicités dans les Avions

## 📊 Conception de la Base de Données

### ✅ Tables à créer (dans database/publicite.sql)

1. **societe_annonceur**
   - Gestion des sociétés clientes (Vaniala, Lewis, etc.)
   - Informations de contact
   - Statut actif/inactif

2. **video_publicitaire**
   - Les vidéos/pubs de chaque société
   - Durée, titre, description
   - Lien vers la société propriétaire
   - Statut actif/inactif

3. **tarif_diffusion_publicite**
   - Historique des tarifs de diffusion
   - Permet de changer le prix dans le temps
   - Date de début/fin pour chaque tarif
   - Tarif initial: 400 000 Ar/diffusion

4. **diffusion_publicite**
   - **Ligne = un enregistrement de diffusion d'une pub sur un vol**
   - `nombre_diffusions`: combien de fois la pub est passée
   - `cout_unitaire`: prix au moment de la diffusion
   - `cout_total`: calculé automatiquement (nombre × prix)
   - Lien vers: vidéo, vol, tarif

### 📈 Vues SQL créées

1. **v_ca_publicite_par_societe_mois** - CA par société et par mois
2. **v_ca_par_video** - CA par vidéo publicitaire
3. **v_ca_publicite_par_vol** - CA généré par chaque vol
4. **v_statistiques_publicite_globales** - Stats globales par période
5. **v_tarif_diffusion_actuel** - Tarif en vigueur actuellement

---

## 🔧 Backend à Créer

### 1️⃣ Entités Java (dans src/main/java/com/companieaerienne/entities/)

- [ ] **SocieteAnnonceur.java**
  ```java
  - Long id
  - String nom
  - String contactNom
  - String email
  - String telephone
  - String adresse
  - Boolean actif
  - LocalDateTime dateInscription
  - List<VideoPublicitaire> videos (OneToMany)
  ```

- [ ] **VideoPublicitaire.java**
  ```java
  - Long id
  - SocieteAnnonceur societe (ManyToOne)
  - String titre
  - String description
  - Integer duree
  - String urlVideo
  - LocalDateTime dateCreation
  - Boolean actif
  - List<DiffusionPublicite> diffusions (OneToMany)
  ```

- [ ] **TarifDiffusionPublicite.java**
  ```java
  - Long id
  - BigDecimal montant
  - LocalDateTime dateDebut
  - LocalDateTime dateFin
  - String description
  - Boolean actif
  ```

- [ ] **DiffusionPublicite.java**
  ```java
  - Long id
  - VideoPublicitaire video (ManyToOne)
  - VolProgrammation volProgrammation (ManyToOne)
  - TarifDiffusionPublicite tarif (ManyToOne)
  - Integer nombreDiffusions
  - LocalDateTime dateDiffusion
  - BigDecimal coutUnitaire
  - BigDecimal coutTotal (calculé)
  - String notes
  ```

### 2️⃣ Repositories (dans src/main/java/com/companieaerienne/repositories/)

- [ ] **SocieteAnnonceurRepository.java**
  - findAllByActifTrue()
  - findByNomContainingIgnoreCase()

- [ ] **VideoPublicitaireRepository.java**
  - findBySocieteId()
  - findAllByActifTrue()
  - findBySocieteIdAndActifTrue()

- [ ] **TarifDiffusionPubliciteRepository.java**
  - findTarifActuel() - récupère le tarif en vigueur
  - findByDateDebut()

- [ ] **DiffusionPubliciteRepository.java**
  - findByVolProgrammationId()
  - findByVideoId()
  - findByDateDiffusionBetween()
  - calculateCAByMonth()
  - calculateCABySociete()

### 3️⃣ Services (dans src/main/java/com/companieaerienne/services/)

- [ ] **SocieteAnnonceurService.java**
  - CRUD complet
  - activerDesactiver()
  - rechercherParNom()

- [ ] **VideoPublicitaireService.java**
  - CRUD complet
  - getVideosBySociete()
  - activerDesactiver()

- [ ] **TarifDiffusionPubliciteService.java**
  - CRUD complet
  - getTarifActuel()
  - creerNouveauTarif() - ferme l'ancien, crée le nouveau
  - getHistoriqueTarifs()

- [ ] **DiffusionPubliciteService.java**
  - CRUD complet
  - enregistrerDiffusion() - avec calcul automatique du coût total
  - getCAParMois()
  - getCAParSociete()
  - getCAParVideo()
  - getCAParVol()
  - getStatistiquesGlobales()

### 4️⃣ Controllers (dans src/main/java/com/companieaerienne/controllers/)

- [ ] **SocieteAnnonceurController.java**
  ```java
  GET  /societes-annonceurs           -> list.jsp
  GET  /societes-annonceurs/new       -> create.jsp
  POST /societes-annonceurs/save      -> save & redirect
  GET  /societes-annonceurs/edit/{id} -> create.jsp (mode edit)
  POST /societes-annonceurs/delete    -> delete & redirect
  POST /societes-annonceurs/toggle    -> activer/désactiver
  ```

- [ ] **VideoPublicitaireController.java**
  ```java
  GET  /videos-publicitaires                 -> list.jsp
  GET  /videos-publicitaires/new             -> create.jsp
  GET  /videos-publicitaires/societe/{id}    -> list.jsp (filtrée)
  POST /videos-publicitaires/save            -> save & redirect
  GET  /videos-publicitaires/edit/{id}       -> create.jsp (mode edit)
  POST /videos-publicitaires/delete          -> delete & redirect
  POST /videos-publicitaires/toggle          -> activer/désactiver
  ```

- [ ] **TarifDiffusionPubliciteController.java**
  ```java
  GET  /tarifs-diffusion              -> list.jsp
  GET  /tarifs-diffusion/new          -> create.jsp
  POST /tarifs-diffusion/save         -> save & redirect
  GET  /tarifs-diffusion/historique   -> historique.jsp
  ```

- [ ] **DiffusionPubliciteController.java**
  ```java
  GET  /diffusions-publicite          -> list.jsp
  GET  /diffusions-publicite/new      -> create.jsp
  POST /diffusions-publicite/save     -> save & redirect
  GET  /diffusions-publicite/vol/{id} -> list.jsp (par vol)
  POST /diffusions-publicite/delete   -> delete & redirect
  ```

- [ ] **RapportPubliciteController.java**
  ```java
  GET  /rapports/publicite/dashboard       -> dashboard.jsp
  GET  /rapports/publicite/ca-mensuel      -> ca-mensuel.jsp
  GET  /rapports/publicite/ca-societe      -> ca-societe.jsp
  GET  /rapports/publicite/ca-video        -> ca-video.jsp
  GET  /rapports/publicite/ca-vol          -> ca-vol.jsp
  
  // APIs pour graphiques
  GET  /api/publicite/ca-by-month          -> JSON
  GET  /api/publicite/ca-by-societe        -> JSON
  GET  /api/publicite/statistiques         -> JSON
  ```

---

## 🎨 Frontend à Créer (JSP)

### 📁 Structure des dossiers
```
src/main/webapp/WEB-INF/jsp/
├── societe-annonceur/
│   ├── list.jsp           ✅ À créer
│   └── create.jsp         ✅ À créer
├── video-publicitaire/
│   ├── list.jsp           ✅ À créer
│   └── create.jsp         ✅ À créer
├── tarif-diffusion/
│   ├── list.jsp           ✅ À créer
│   ├── create.jsp         ✅ À créer
│   └── historique.jsp     ✅ À créer
├── diffusion-publicite/
│   ├── list.jsp           ✅ À créer
│   └── create.jsp         ✅ À créer
└── rapport-publicite/
    ├── dashboard.jsp      ✅ À créer (vue d'ensemble)
    ├── ca-mensuel.jsp     ✅ À créer (CA par mois)
    ├── ca-societe.jsp     ✅ À créer (CA par société)
    ├── ca-video.jsp       ✅ À créer (CA par vidéo)
    └── ca-vol.jsp         ✅ À créer (CA par vol)
```

### 📄 Pages détaillées

#### 1. Sociétés Annonceurs

- [ ] **list.jsp** - Liste des sociétés
  - Tableau: Nom, Contact, Email, Téléphone, Statut
  - Boutons: Nouveau, Modifier, Activer/Désactiver
  - Recherche par nom
  - Badge actif/inactif

- [ ] **create.jsp** - Créer/Modifier société
  - Formulaire: nom, contact, email, téléphone, adresse
  - Validation côté client
  - Bouton activer/désactiver

#### 2. Vidéos Publicitaires

- [ ] **list.jsp** - Liste des vidéos
  - Tableau: Titre, Société, Durée, Date création, Statut
  - Filtre par société
  - Boutons: Nouvelle, Modifier, Activer/Désactiver, Voir diffusions
  - Badge actif/inactif

- [ ] **create.jsp** - Créer/Modifier vidéo
  - Select société
  - Champs: titre, description, durée (en secondes), URL
  - Preview de la vidéo (optionnel)

#### 3. Tarifs de Diffusion

- [ ] **list.jsp** - Liste des tarifs
  - Tableau: Montant, Date début, Date fin, Description, Statut
  - Indication du tarif actuel (badge)
  - Bouton: Nouveau tarif

- [ ] **create.jsp** - Créer nouveau tarif
  - Champ montant (en Ar)
  - Date de début (automatique ou manuelle)
  - Description
  - Info: ferme automatiquement le tarif précédent

- [ ] **historique.jsp** - Historique des tarifs
  - Timeline des tarifs
  - Graphique d'évolution

#### 4. Diffusions de Publicités

- [ ] **list.jsp** - Liste des diffusions
  - Tableau: Date, Vol, Vidéo, Société, Nb diffusions, Coût total
  - Filtres: Date, Vol, Société, Vidéo
  - Boutons: Nouvelle diffusion, Modifier, Supprimer
  - Total CA affiché en bas

- [ ] **create.jsp** - Enregistrer une diffusion
  - **Select Vol programmé** (avec info: date, route)
  - **Select Vidéo publicitaire** (avec société)
  - **Input: Nombre de diffusions** (défaut: 1)
  - **Affichage du coût unitaire actuel**
  - **Calcul automatique du coût total**
  - Champ notes (optionnel)
  - Bouton: Enregistrer

#### 5. Rapports et Statistiques

- [ ] **dashboard.jsp** - Vue d'ensemble
  - KPIs en cartes:
    * CA total du mois en cours
    * Nombre de diffusions ce mois
    * Nombre de sociétés actives
    * Nombre de vols avec pub ce mois
  - Graphique: Évolution CA par mois (6 derniers mois)
  - Top 5 sociétés par CA
  - Top 5 vidéos les plus diffusées

- [ ] **ca-mensuel.jsp** - CA par mois
  - Tableau: Mois/Année, Total diffusions, CA, Coût moyen
  - Filtre par année
  - Graphique d'évolution
  - Export Excel/PDF

- [ ] **ca-societe.jsp** - CA par société
  - Tableau par société et par mois
  - Exemple (selon image fournie):
    ```
    Décembre 2025:
    - Vaniala: 20 diffusions × 400 000 = 8 000 000 Ar
    - Lewis: 10 diffusions × 400 000 = 4 000 000 Ar
    TOTAL: 12 000 000 Ar
    ```
  - Filtres: Société, Période
  - Graphique en barres par société
  - Export Excel/PDF

- [ ] **ca-video.jsp** - CA par vidéo
  - Tableau: Vidéo, Société, Total diffusions, CA généré
  - Période de diffusion (première/dernière)
  - Coût moyen unitaire
  - Filtre par société

- [ ] **ca-vol.jsp** - CA par vol
  - Tableau: Vol, Date, Route, Nb pubs, Total diffusions, CA
  - Filtre par date, route
  - Identification des vols les plus rentables

---

## 🔗 Modifications du Navbar

- [ ] Ajouter une section "Publicité" dans le navbar
  ```
  Section: PUBLICITÉ
  - Sociétés Annonceurs
  - Vidéos Publicitaires
  - Diffusions
  - Tarifs de Diffusion
  - Rapports CA
  ```

---

## 📊 Exemple de Calcul (selon image)

### Décembre 2025:
- **Vaniala**: 20 diffusions × 400 000 Ar = **8 000 000 Ar**
- **Lewis**: 10 diffusions × 400 000 Ar = **4 000 000 Ar**
- **TOTAL CA Décembre 2025**: **12 000 000 Ar**

### Logique:
1. Chaque société peut avoir plusieurs vidéos
2. Chaque vidéo peut être diffusée sur plusieurs vols
3. Pour chaque vol, on enregistre le **nombre de diffusions**
4. Le coût total = nombre_diffusions × cout_unitaire (tarif du moment)
5. Le CA se calcule en sommant tous les coûts totaux

---

## 🚀 Ordre de Développement Recommandé

### Phase 1: Base de données ✅
1. [x] Créer database/publicite.sql
2. [ ] Exécuter le script SQL
3. [ ] Vérifier les tables et vues

### Phase 2: Backend (Entités + Repositories)
4. [ ] Créer les 4 entités Java
5. [ ] Créer les 4 repositories
6. [ ] Tests unitaires des repositories

### Phase 3: Backend (Services)
7. [ ] SocieteAnnonceurService
8. [ ] VideoPublicitaireService
9. [ ] TarifDiffusionPubliciteService
10. [ ] DiffusionPubliciteService
11. [ ] Tests unitaires des services

### Phase 4: Backend (Controllers)
12. [ ] SocieteAnnonceurController
13. [ ] VideoPublicitaireController
14. [ ] TarifDiffusionPubliciteController
15. [ ] DiffusionPubliciteController
16. [ ] RapportPubliciteController

### Phase 5: Frontend (Pages de gestion)
17. [ ] Sociétés: list.jsp + create.jsp
18. [ ] Vidéos: list.jsp + create.jsp
19. [ ] Tarifs: list.jsp + create.jsp + historique.jsp
20. [ ] Diffusions: list.jsp + create.jsp

### Phase 6: Frontend (Rapports)
21. [ ] Dashboard publicité
22. [ ] Rapport CA mensuel
23. [ ] Rapport CA par société
24. [ ] Rapport CA par vidéo
25. [ ] Rapport CA par vol

### Phase 7: Intégration
26. [ ] Ajouter les liens dans le navbar
27. [ ] Tests d'intégration
28. [ ] Tests utilisateur

---

## 📝 Notes Importantes

### ⚠️ Points d'attention:
1. **Coût unitaire flexible**: Le prix peut changer dans le temps via la table `tarif_diffusion_publicite`
2. **Nombre de diffusions variable**: On peut enregistrer qu'une pub a été diffusée 1, 2, 5 fois, etc. sur un vol
3. **Plusieurs pubs par vol**: Un vol peut diffuser plusieurs vidéos différentes
4. **Calcul automatique**: Le coût total est calculé automatiquement (nombre × prix)
5. **Historique**: Toutes les diffusions sont tracées pour reporting

### 💡 Fonctionnalités bonus (optionnelles):
- [ ] Upload de vidéos (stockage)
- [ ] Preview des vidéos dans l'interface
- [ ] Export Excel des rapports
- [ ] Export PDF des rapports
- [ ] Graphiques avec Chart.js ou similaire
- [ ] Dashboard avec stats en temps réel
- [ ] Notifications pour les diffusions
- [ ] API REST pour applications mobiles

---

## 🎯 Priorités

### 🔴 Haute priorité (MVP):
1. Tables SQL créées et vues
2. CRUD Sociétés + Vidéos + Diffusions
3. Page enregistrement diffusion (la plus importante)
4. Rapport CA par société et par mois

### 🟡 Moyenne priorité:
5. Gestion des tarifs de diffusion
6. Dashboard publicité
7. Autres rapports (vidéo, vol)

### 🟢 Basse priorité:
8. Graphiques avancés
9. Export Excel/PDF
10. Fonctionnalités bonus

---

**Date de création**: 22 janvier 2026
**Dernière mise à jour**: 22 janvier 2026
