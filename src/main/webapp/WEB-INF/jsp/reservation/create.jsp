<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="../common/header.jsp" />

<!-- Top Navbar -->
<jsp:include page="../common/navbar.jsp" />

<!-- Main Content Wrapper -->
<main class="main-content-wrapper">
    <div class="main-content">
                
                <!-- Page Header with Breadcrumb -->
                <div class="mb-8">
                    <h1 class="text-2xl font-bold text-gray-900 mb-2">${reservation.id != null ? 'Modifier la' : 'Nouvelle'} Réservation</h1>
                    <!-- Breadcrumb -->
                    <nav class="flex" aria-label="Breadcrumb">
                        <ol class="inline-flex items-center space-x-1 md:space-x-2">
                            <li class="inline-flex items-center">
                                <a href="/" class="inline-flex items-center text-sm font-medium text-gray-500 hover:text-brand-600">
                                    <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path></svg>
                                    Accueil
                                </a>
                            </li>
                            <li>
                                <div class="flex items-center">
                                    <svg class="w-5 h-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                                    <a href="/reservations" class="ml-1 text-sm font-medium text-gray-500 hover:text-brand-600 md:ml-2">Réservations</a>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center">
                                    <svg class="w-5 h-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                                    <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Créer</span>
                                </div>
                            </li>
                        </ol>
                    </nav>
                </div>

                <!-- Form Card -->
                <div class="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
                    <form action="/reservations" method="post" class="space-y-6">
                        <input type="hidden" name="id" value="${reservation.id}">
                        
                        <!-- Vol Selection -->
                        <div>
                            <label for="vol" class="block text-sm font-medium text-gray-700 mb-2">Vol</label>
                            <select class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent" id="vol" required>
                                <option value="">Sélectionnez un vol</option>
                                <c:forEach items="${vols}" var="v">
                                    <option value="${v.id}" ${selectedVolId == v.id ? 'selected' : ''}>
                                        ${v.aeroportDepart.nom} → ${v.aeroportArrivee.nom} - ${v.duree}h
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Date et Heure du Vol (Programmation) -->
                        <div>
                            <label for="volProgrammation" class="block text-sm font-medium text-gray-700 mb-2">Date et Heure du Vol</label>
                            <select class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent" 
                                    id="volProgrammation" 
                                    name="volProgrammation.id" 
                                    required disabled>
                                <option value="">Choisir une date</option>
                            </select>
                            <p class="mt-1 text-sm text-gray-500">Sélectionnez d'abord un vol pour voir les créneaux disponibles</p>
                            <p id="volProgrammationDisplay" class="mt-1 text-sm text-gray-700 font-medium hidden"></p>
                        </div>

                        <!-- Client Selection -->
                        <div>
                            <label for="client" class="block text-sm font-medium text-gray-700 mb-2">Client</label>
                            <!-- DEBUG: Nombre de clients = ${clients.size()} -->
                            <select class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent" id="client" name="client.id" required>
                                <option value="">Sélectionnez un client</option>
                                <c:forEach items="${clients}" var="cl">
                                    <option value="${cl.id}" ${reservation.client.id == cl.id ? 'selected' : ''}>${cl.nom} ${cl.prenom} - ${cl.email}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="flex items-end gap-4">
                            <div class="flex-1">
                                <label for="nombrePlaces" class="block text-sm font-medium text-gray-700 mb-2">Nombre total de Places</label>
                                <input type="number" min="1" max="100" class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent" id="nombrePlaces" name="nombrePlaces" value="${reservation.id != null ? reservation.nombrePlaces : 1}" required>
                            </div>
                            <div class="flex gap-2 p-1 bg-gray-100 rounded-lg">
                                <button type="button" id="btnModePlan" class="px-4 py-2 text-sm font-medium rounded-md bg-white shadow-sm text-brand-600">Plan de salle</button>
                                <button type="button" id="btnModeManuel" class="px-4 py-2 text-sm font-medium rounded-md text-gray-600 hover:text-gray-900">Saisie manuelle</button>
                            </div>
                        </div>

                        <!-- Saisie Manuelle (Cachée par défaut) -->
                        <div id="manualInputSection" class="hidden space-y-4 bg-white p-6 rounded-lg border border-gray-200 shadow-sm">
                            <h3 class="text-sm font-bold text-gray-900 border-b pb-2 mb-4">Répartition Manuelle des Places</h3>
                            <div id="manualGridContainer" class="overflow-x-auto">
                                <!-- Généré dynamiquement : Table Type Passager x Classe -->
                            </div>
                            <div class="flex justify-end mt-4">
                                <button type="button" onclick="applyManualReservation()" class="bg-brand-600 text-white px-4 py-2 rounded-md hover:bg-brand-700 text-sm font-medium">
                                    Attribuer les places
                                </button>
                            </div>
                        </div>

                        <!-- Sélection des Places (Plan de salle) -->
                        <div id="seatMapSection">
                            <label class="block text-sm font-medium text-gray-700 mb-3">Sélection des Places</label>
                            <div class="bg-gray-50 p-6 rounded-lg border border-gray-200">
                                <!-- Légende -->
                                <div class="flex gap-4 mb-6 text-sm">
                                    <div class="flex items-center gap-2">
                                        <div class="w-8 h-8 bg-green-100 border border-green-300 rounded"></div>
                                        <span>Disponible</span>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <div class="w-8 h-8 bg-brand-600 text-white border border-brand-700 rounded flex items-center justify-center font-bold">✓</div>
                                        <span>Sélectionné</span>
                                    </div>
                                    <div class="flex items-center gap-2">
                                        <div class="w-8 h-8 bg-red-200 border-2 border-red-400 rounded"></div>
                                        <span>Déjà réservé</span>
                                    </div>
                                </div>

                                <!-- Grille de Sièges Dynamique -->
                                <div id="seatsContainer" class="space-y-2">
                                    <!-- Les sièges seront générés dynamiquement par JavaScript -->
                                </div>

                                <!-- Pagination -->
                                <div id="paginationContainer" class="mt-4 flex items-center justify-center gap-2">
                                    <!-- La pagination sera générée dynamiquement -->
                                </div>

                                <!-- Liste des places sélectionnées avec types de passager -->
                                <div id="selectedSeatsDetails" class="mt-8 space-y-4 hidden">
                                    <h4 class="text-sm font-bold text-gray-900 border-b pb-2">Détails des Passagers</h4>
                                    <div id="seatsDetailsList" class="space-y-3">
                                        <!-- Généré dynamiquement -->
                                    </div>
                                </div>

                                <div class="mt-4 text-sm text-gray-600">
                                    Places sélectionnées: <span id="selectedSeatsDisplay" class="font-bold text-brand-600">Aucune</span>
                                </div>
                            </div>
                        </div>

                        <div class="flex gap-3 pt-4">
                            <button type="submit" class="bg-brand-600 text-white px-6 py-2 rounded-md hover:bg-brand-700 shadow-sm transition-colors text-sm font-medium">
                                Enregistrer la réservation
                            </button>
                            <a href="/reservations" class="bg-gray-100 text-gray-700 px-6 py-2 rounded-md hover:bg-gray-200 shadow-sm transition-colors text-sm font-medium">
                                Annuler
                            </a>
                        </div>
                    </form>
                </div>

            </div>
        </main>
    </div>

    <script>
        // Gestion de la sélection des sièges
        const nombrePlacesInput = document.getElementById('nombrePlaces');
        const selectedSeatsDisplay = document.getElementById('selectedSeatsDisplay');
        const seatsDetailsList = document.getElementById('seatsDetailsList');
        const selectedSeatsDetails = document.getElementById('selectedSeatsDetails');
        const seatsContainer = document.getElementById('seatsContainer');
        const paginationContainer = document.getElementById('paginationContainer');
        const volSelect = document.getElementById('vol');
        const volProgrammationSelect = document.getElementById('volProgrammation');
        const volProgrammationDisplay = document.getElementById('volProgrammationDisplay');
        const initialVolProgrammationId = '${selectedVolProgrammationId}';
        const currentReservationId = '${reservation.id}';
        let initialVolProgrammationApplied = false;

        // Données de la réservation actuelle pour le pré-remplissage en mode modification
        const currentReservationSeats = [
            <c:forEach items="${reservation.detailsPlaces}" var="rp" varStatus="status">
                { place: "${rp.place}", typeId: ${rp.typePassager.id} }${!status.last ? ',' : ''}
            </c:forEach>
        ];

        // Éléments pour le mode manuel
        const btnModePlan = document.getElementById('btnModePlan');
        const btnModeManuel = document.getElementById('btnModeManuel');
        const manualInputSection = document.getElementById('manualInputSection');
        const seatMapSection = document.getElementById('seatMapSection');
        const manualGridContainer = document.getElementById('manualGridContainer');
        
        // Liste des types de passagers injectée par JSP
        const typePassagers = [
            <c:forEach items="${typePassagers}" var="t" varStatus="status">
                { id: ${t.id}, nom: '${t.nom}' }${!status.last ? ',' : ''}
            </c:forEach>
        ];
        
        let selectedSeats = [];
        let plageDebut = 1;
        let plageFin = 36;
        let currentPage = 1;
        let occupiedSeats = []; // Places déjà réservées
        const seatsPage = 36; // 6 rangées × 6 sièges
        const seatsPerRow = 6;
        let avionClasses = []; // Stocke les plages de sièges par classe pour l'avion actuel

        // Gestion du basculement de mode
        btnModePlan.addEventListener('click', () => {
            btnModePlan.classList.add('bg-white', 'shadow-sm', 'text-brand-600');
            btnModePlan.classList.remove('text-gray-600');
            btnModeManuel.classList.remove('bg-white', 'shadow-sm', 'text-brand-600');
            btnModeManuel.classList.add('text-gray-600');
            manualInputSection.classList.add('hidden');
            seatMapSection.classList.remove('hidden');
            nombrePlacesInput.readOnly = false; // Permettre l'édition en mode plan de salle
        });

        btnModeManuel.addEventListener('click', () => {
            btnModeManuel.classList.add('bg-white', 'shadow-sm', 'text-brand-600');
            btnModeManuel.classList.remove('text-gray-600');
            btnModePlan.classList.remove('bg-white', 'shadow-sm', 'text-brand-600');
            btnModePlan.classList.add('text-gray-600');
            manualInputSection.classList.remove('hidden');
            seatMapSection.classList.add('hidden');
            nombrePlacesInput.readOnly = true; // Verrouiller en mode manuel (calculé par la grille)
            generateManualGrid();
        });

        function generateManualGrid() {
            if (avionClasses.length === 0) {
                manualGridContainer.innerHTML = '<p class="text-gray-500 text-center py-4">Veuillez d\'abord sélectionner un vol et une date.</p>';
                return;
            }

            // Récupérer les classes uniques
            const classes = [];
            avionClasses.forEach(ac => {
                const classObj = ac.classe || { id: ac.id_classe, nom: 'Classe ' + ac.id_classe };
                if (!classes.find(c => c.id === classObj.id)) {
                    classes.push(classObj);
                }
            });

            let html = '<table class="min-w-full divide-y divide-gray-200 border">';
            html += '<thead class="bg-gray-50"><tr><th class="px-4 py-2 text-left text-xs font-bold text-gray-500 uppercase">Type Passager</th>';
            classes.forEach(c => {
                const availableCount = countAvailableSeatsForClass(c.id);
                html += '<th class="px-4 py-2 text-center text-xs font-bold text-gray-500 uppercase">' + 
                        c.nom + '<br><span class="text-[10px] font-normal text-brand-600">(' + availableCount + ' dispo)</span></th>';
            });
            html += '</tr></thead><tbody class="bg-white divide-y divide-gray-200">';

            typePassagers.forEach(tp => {
                html += '<tr><td class="px-4 py-2 text-sm font-medium text-gray-900">' + tp.nom + '</td>';
                classes.forEach(c => {
                    html += '<td class="px-4 py-2 text-center">' +
                                '<input type="number" min="0" value="0" ' +
                                    'class="manual-count-input w-16 px-2 py-1 border border-gray-300 rounded text-center text-sm" ' +
                                    'data-type-id="' + tp.id + '" data-classe-id="' + c.id + '" ' +
                                    'onchange="updateTotalManualCount()">' +
                             '</td>';
                });
                html += '</tr>';
            });
            html += '</tbody></table>';
            manualGridContainer.innerHTML = html;
        }

        function countAvailableSeatsForClass(classeId) {
            let count = 0;
            for (let s = 1; s <= plageFin; s++) {
                const classeInfo = avionClasses.find(c => s >= c.placeDebut && s <= c.placeFin);
                if (classeInfo) {
                    const currentId = (classeInfo.classe && classeInfo.classe.id) ? classeInfo.classe.id : classeInfo.id_classe;
                    if (currentId == classeId) {
                        const isOccupied = occupiedSeats.some(os => os == s);
                        if (!isOccupied) count++;
                    }
                }
            }
            return count;
        }

        function updateTotalManualCount() {
            let total = 0;
            document.querySelectorAll('.manual-count-input').forEach(input => {
                total += parseInt(input.value) || 0;
            });
            nombrePlacesInput.value = total;
        }

        function applyManualReservation() {
            const counts = [];
            const classTotals = {};

            document.querySelectorAll('.manual-count-input').forEach(input => {
                const count = parseInt(input.value) || 0;
                if (count > 0) {
                    const typeId = parseInt(input.dataset.typeId);
                    const classeId = parseInt(input.dataset.classeId);
                    
                    counts.push({
                        typeId: typeId,
                        classeId: classeId,
                        count: count
                    });

                    classTotals[classeId] = (classTotals[classeId] || 0) + count;
                }
            });

            if (counts.length === 0) {
                alert("Veuillez saisir au moins une place.");
                return;
            }

            // Vérifier la disponibilité totale par classe avant de commencer
            for (const [classeId, totalRequested] of Object.entries(classTotals)) {
                const available = countAvailableSeatsForClass(classeId);
                if (totalRequested > available) {
                    alert("Pas assez de places disponibles en " + getClassNom(classeId) + ".\n" +
                          "Total demandé : " + totalRequested + "\n" +
                          "Disponible : " + available);
                    return;
                }
            }

            // Réinitialiser les sièges sélectionnés
            selectedSeats = [];
            window.manualTypeMapping = {};
            
            // Pour chaque demande (Type x Classe), trouver des sièges disponibles
            for (const request of counts) {
                const availableInClass = findAvailableSeatsInClass(request.classeId, request.count);
                
                availableInClass.forEach(seatNum => {
                    const s = seatNum.toString();
                    selectedSeats.push(s);
                    window.manualTypeMapping[s] = request.typeId;
                });
            }

            updateSeatStates();
            updateDisplay();
            
            // Repasser en mode plan pour voir le résultat
            btnModePlan.click();
            alert("Les places ont été attribuées automatiquement.");
        }

        function findAvailableSeatsInClass(classeId, count) {
            const available = [];
            // Parcourir tous les sièges de l'avion (de 1 à plageFin)
            for (let s = 1; s <= plageFin; s++) {
                // Trouver la classe pour ce siège en utilisant la même logique que l'affichage
                const classeInfo = avionClasses.find(c => s >= c.placeDebut && s <= c.placeFin);
                
                if (classeInfo) {
                    // Vérifier si la classe correspond (comparaison flexible)
                    const currentClasseId = (classeInfo.classe && classeInfo.classe.id) ? classeInfo.classe.id : classeInfo.id_classe;
                    
                    if (currentClasseId == classeId) {
                        // Vérifier si le siège est occupé ou déjà sélectionné
                        const isOccupied = occupiedSeats.some(os => os == s);
                        const isSelected = selectedSeats.some(ss => ss == s);
                        
                        if (!isOccupied && !isSelected) {
                            available.push(s);
                            if (available.length === count) return available;
                        }
                    }
                }
            }
            return available;
        }

        function getClassNom(classeId) {
            const ac = avionClasses.find(ac => {
                const currentId = (ac.classe && ac.classe.id) ? ac.classe.id : ac.id_classe;
                return currentId == classeId;
            });
            return ac ? (ac.classe ? ac.classe.nom : 'Classe ' + classeId) : 'Inconnue';
        }

        // Écouter le changement de vol pour charger les programmations disponibles
        volSelect.addEventListener('change', async function() {
            const volId = this.value;
            volProgrammationSelect.innerHTML = '<option value="">Choisir une date</option>';
            volProgrammationDisplay.textContent = '';
            volProgrammationDisplay.classList.add('hidden');
            volProgrammationSelect.disabled = true;
            
            if (!volId) return;
            
            try {
                // Récupérer les programmations disponibles (retourne liste d'objets {id, dateHeure, avionId, avionCapacite})
                const response = await fetch('/api/vol/' + volId + '/programmations');
                const programmations = await response.json();
                
                if (programmations.length > 0) {
                    programmations.forEach(prog => {
                        const option = document.createElement('option');
                        option.value = prog.id;
                        const date = new Date(prog.dateHeure);
                        option.textContent = date.toLocaleDateString() + ' ' + date.toLocaleTimeString().substring(0, 5);
                        option.dataset.avionId = prog.avionId;
                        option.dataset.avionCapacite = prog.avionCapacite;
                        volProgrammationSelect.appendChild(option);
                    });
                    volProgrammationSelect.disabled = false;

                    // Si on a un ID pré-sélectionné (via URL)
                    if (initialVolProgrammationId && !initialVolProgrammationApplied) {
                        volProgrammationSelect.value = initialVolProgrammationId;
                        initialVolProgrammationApplied = true;
                        volProgrammationSelect.dispatchEvent(new Event('change'));
                    }
                }
            } catch (error) {
                console.error('Erreur lors du chargement des programmations:', error);
            }
        });

        // Écouter le changement de programmation pour charger les places occupées, les classes et les tarifs
        volProgrammationSelect.addEventListener('change', async function() {
            const vpId = this.value;
            const selectedOption = this.options[this.selectedIndex];
            
            if (!vpId) {
                volProgrammationDisplay.textContent = '';
                volProgrammationDisplay.classList.add('hidden');
                avionClasses = [];
                seatsContainer.innerHTML = '<p class="text-gray-500 text-center py-8">Veuillez sélectionner un vol et une date</p>';
                paginationContainer.innerHTML = '';
                return;
            }

            const avionId = selectedOption.dataset.avionId;
            const avionCapacite = selectedOption.dataset.avionCapacite;
            
            // Mettre à jour la plage de fin si on a la capacité de l'avion
            if (avionCapacite) {
                plageFin = parseInt(avionCapacite);
            }

            try {
                // Charger les places occupées et les classes en parallèle
                const urlOccupied = '/api/places-occupees/' + vpId + (currentReservationId ? '?excludeReservationId=' + currentReservationId : '');
                const [occupiedResponse, classesResponse] = await Promise.all([
                    fetch(urlOccupied),
                    fetch('/api/avion/' + avionId + '/classes-places')
                ]);

                occupiedSeats = await occupiedResponse.json();
                avionClasses = await classesResponse.json();

                // Pré-remplir les sièges si on est en mode modification
                if (currentReservationId && selectedSeats.length === 0) {
                    currentReservationSeats.forEach(rs => {
                        selectedSeats.push(rs.place);
                    });
                }

                currentPage = 1;
                generateSeats();
                updateSeatStates();
                updateDisplay();
                generateManualGrid(); // Mettre à jour le grid manuel aussi
            } catch (error) {
                console.error('Erreur lors du chargement des données de la programmation:', error);
            }
        });

        // Fonction pour générer la grille de sièges
         function generateSeats() {
            const totalSeats = plageFin - plageDebut + 1;
            const totalPages = Math.ceil(totalSeats / seatsPage);
            
            // Calculer les sièges pour la page actuelle
            const startSeat = plageDebut + (currentPage - 1) * seatsPage;
            const endSeat = Math.min(startSeat + seatsPage - 1, plageFin);
            
            seatsContainer.innerHTML = '';
            
            let seatNum = startSeat;
            while (seatNum <= endSeat) {
                const row = document.createElement('div');
                row.className = 'flex gap-2 justify-center mb-2';
                
                // Première moitié de la rangée (3 sièges)
                for (let i = 0; i < 3 && seatNum <= endSeat; i++, seatNum++) {
                    const btn = createSeatButton(seatNum);
                    row.appendChild(btn);
                }
                
                // Allée centrale
                const aisle = document.createElement('div');
                aisle.className = 'w-8';
                row.appendChild(aisle);
                
                // Deuxième moitié de la rangée (3 sièges)
                for (let i = 0; i < 3 && seatNum <= endSeat; i++, seatNum++) {
                    const btn = createSeatButton(seatNum);
                    row.appendChild(btn);
                }
                
                seatsContainer.appendChild(row);
            }
            
            generatePagination(totalPages);
        }

        // Fonction pour créer un bouton de siège
        function createSeatButton(seatNum) {
            const btn = document.createElement('button');
            btn.type = 'button';
            btn.dataset.seat = seatNum;
            btn.className = 'seat-btn w-10 h-10 relative flex items-center justify-center rounded transition-all text-sm font-bold';
            
            // Trouver la classe pour ce siège
            const classeInfo = avionClasses.find(c => seatNum >= c.placeDebut && seatNum <= c.placeFin);
            let classCode = '';
            if (classeInfo) {
                const nom = classeInfo.classe.nom;
                if (nom.includes('Première')) classCode = 'PC';
                else if (nom.includes('Affaires')) classCode = 'Af';
                else if (nom.includes('Premium')) classCode = 'Pr';
                else if (nom.includes('Économique')) classCode = 'Ec';
                
                btn.title = nom + ' - Siège ' + seatNum;
                // Colorer légèrement selon la classe pour aider l'utilisateur
                if (nom.includes('Première')) btn.classList.add('ring-2', 'ring-yellow-400');
                else if (nom.includes('Affaires')) btn.classList.add('ring-2', 'ring-blue-400');
            }
            
            // Contenu du bouton avec l'exposant de classe
            var innerContent = '<span class="seat-num-text">' + seatNum + '</span>';
            if (classCode) {
                innerContent += '<span class="absolute -top-1.5 -right-1 bg-white px-0.5 border border-gray-200 rounded text-[8px] font-bold text-gray-500 leading-none py-0.5">' + classCode + '</span>';
            }
            btn.innerHTML = innerContent;
            
            // Vérifier si la place est occupée (comparaison flexible)
            const isOccupied = occupiedSeats.some(os => os == seatNum);
            
            if (isOccupied) {
                btn.classList.add('bg-red-200', 'border-2', 'border-red-400', 'cursor-not-allowed');
                btn.disabled = true;
            } else {
                btn.classList.add('bg-green-100', 'border', 'border-green-300', 'hover:border-brand-500');
                btn.disabled = false;
            }
            
            btn.addEventListener('click', function(e) {
                e.preventDefault();
                if (this.disabled) return;
                
                const maxSeats = parseInt(nombrePlacesInput.value);
                const seat = this.dataset.seat;

                if (selectedSeats.includes(seat)) {
                    selectedSeats = selectedSeats.filter(s => s !== seat);
                } else if (selectedSeats.length < maxSeats) {
                    selectedSeats.push(seat);
                } else {
                    alert('Vous avez atteint le nombre maximum de places (' + maxSeats + ')');
                }

                updateSeatStates();
                updateDisplay();
            });
            
            return btn;
        }

        // Fonction pour générer la pagination
        function generatePagination(totalPages) {
            paginationContainer.innerHTML = '';
            
            if (totalPages <= 1) return;
            
            // Bouton Précédent
            const prevBtn = document.createElement('button');
            prevBtn.type = 'button';
            prevBtn.className = 'px-3 py-1 border rounded ' + (currentPage === 1 ? 'bg-gray-100 text-gray-400 cursor-not-allowed' : 'bg-white text-gray-700 hover:bg-gray-50');
            prevBtn.textContent = '‹ Précédent';
            prevBtn.disabled = currentPage === 1;
            prevBtn.addEventListener('click', () => {
                if (currentPage > 1) {
                    currentPage--;
                    generateSeats();
                    updateSeatStates();
                }
            });
            paginationContainer.appendChild(prevBtn);
            
            // Numéros de page
            for (let i = 1; i <= totalPages; i++) {
                const pageBtn = document.createElement('button');
                pageBtn.type = 'button';
                pageBtn.className = 'px-3 py-1 border rounded ' + (i === currentPage ? 'bg-brand-600 text-white' : 'bg-white text-gray-700 hover:bg-gray-50');
                pageBtn.textContent = i;
                pageBtn.addEventListener('click', () => {
                    currentPage = i;
                    generateSeats();
                    updateSeatStates();
                });
                paginationContainer.appendChild(pageBtn);
            }
            
            // Bouton Suivant
            const nextBtn = document.createElement('button');
            nextBtn.type = 'button';
            nextBtn.className = 'px-3 py-1 border rounded ' + (currentPage === totalPages ? 'bg-gray-100 text-gray-400 cursor-not-allowed' : 'bg-white text-gray-700 hover:bg-gray-50');
            nextBtn.textContent = 'Suivant ›';
            nextBtn.disabled = currentPage === totalPages;
            nextBtn.addEventListener('click', () => {
                if (currentPage < totalPages) {
                    currentPage++;
                    generateSeats();
                    updateSeatStates();
                }
            });
            paginationContainer.appendChild(nextBtn);
        }

        // Fonction pour mettre à jour l'état des sièges
        function updateSeatStates() {
            const seatButtons = document.querySelectorAll('.seat-btn');
            seatButtons.forEach(btn => {
                const seatNum = btn.dataset.seat;
                const isSelected = selectedSeats.some(ss => ss == seatNum);
                const isOccupied = occupiedSeats.some(os => os == seatNum);

                if (isSelected) {
                    btn.classList.remove('bg-green-100', 'border-green-300', 'text-gray-900');
                    btn.classList.add('bg-brand-600', 'text-white', 'border-brand-700');
                } else if (!isOccupied) {
                    btn.classList.remove('bg-brand-600', 'text-white', 'border-brand-700');
                    btn.classList.add('bg-green-100', 'border-green-300', 'text-gray-900');
                }
            });
        }

        // Fonction pour charger les places occupées et rafraîchir la grille
        async function updateAvailableSeats() {
            const volProgrammationId = volProgrammationSelect.value;

            if (!volProgrammationId) {
                occupiedSeats = [];
                generateSeats();
                return;
            }

            try {
                const response = await fetch('/api/places-occupees/' + volProgrammationId);
                if (response.ok) {
                    occupiedSeats = await response.json();
                } else {
                    occupiedSeats = [];
                }
                generateSeats();
                updateSeatStates();
                updateDisplay();
            } catch (error) {
                console.error('Erreur lors de la récupération des places occupées:', error);
                occupiedSeats = [];
                generateSeats();
            }
        }

        // Écouter les changements de nombre de places
        nombrePlacesInput.addEventListener('change', function() {
            const maxSeats = parseInt(this.value);
            if (selectedSeats.length > maxSeats) {
                selectedSeats = selectedSeats.slice(0, maxSeats);
                updateSeatStates();
                updateDisplay();
            }
        });

        function updateDisplay() {
            if (selectedSeats.length > 0) {
                selectedSeatsDisplay.textContent = selectedSeats.sort((a, b) => a - b).join(', ');
                selectedSeatsDetails.classList.remove('hidden');
            } else {
                selectedSeatsDisplay.textContent = 'Aucune';
                selectedSeatsDetails.classList.add('hidden');
            }
            
            // Mettre à jour la liste des détails des passagers
            updateSeatsDetailsList();
        }

        function updateSeatsDetailsList() {
            // Créer un mapping des types de passagers actuels pour préserver les choix de l'utilisateur
            const currentDetails = Array.from(seatsDetailsList.querySelectorAll('.seat-detail-item')).reduce((acc, el) => {
                const seatNum = el.dataset.seat;
                const typeId = el.querySelector('select').value;
                acc[seatNum] = typeId;
                return acc;
            }, {});

            seatsDetailsList.innerHTML = '';
            selectedSeats.sort((a, b) => a - b).forEach((seat, index) => {
                const item = document.createElement('div');
                item.className = 'seat-detail-item flex items-center justify-between bg-white p-3 rounded border border-gray-100 shadow-sm';
                item.dataset.seat = seat;
                
                const seatNum = parseInt(seat);
                const classeInfo = avionClasses.find(c => seatNum >= c.placeDebut && seatNum <= c.placeFin);
                const classeName = classeInfo ? (classeInfo.classe ? classeInfo.classe.nom : 'Classe ' + classeInfo.id_classe) : 'Inconnue';

                // Priorité au mapping manuel si défini, sinon au type déjà sélectionné, sinon au type de la réservation existante
                let selectedType = currentDetails[seat];
                if (window.manualTypeMapping && window.manualTypeMapping[seat]) {
                    selectedType = window.manualTypeMapping[seat];
                }
                
                // Si toujours pas de type, chercher dans les données de la réservation initiale
                if (!selectedType && currentReservationId) {
                    const originalSeat = currentReservationSeats.find(rs => rs.place == seat);
                    if (originalSeat) {
                        selectedType = originalSeat.typeId;
                    }
                }

                item.innerHTML = 
                    '<div class="flex items-center gap-3">' +
                        '<span class="w-8 h-8 bg-brand-600 text-white rounded-full flex items-center justify-center font-bold text-xs">' + seat + '</span>' +
                        '<div>' +
                            '<div class="text-xs font-bold text-gray-900">Siège ' + seat + '</div>' +
                            '<div class="text-[10px] text-gray-500">' + classeName + '</div>' +
                        '</div>' +
                    '</div>' +
                    '<div class="flex items-center gap-2">' +
                        '<label class="text-[10px] font-bold text-gray-400 uppercase">Type:</label>' +
                        '<input type="hidden" name="detailsPlaces[' + index + '].place" value="' + seat + '">' +
                        '<select name="detailsPlaces[' + index + '].typePassager.id" class="text-xs border border-gray-300 rounded px-2 py-1 focus:ring-1 focus:ring-brand-500 outline-none">' +
                            typePassagers.map(function(t) { 
                                return '<option value="' + t.id + '"' + (selectedType == t.id ? ' selected' : '') + '>' + t.nom + '</option>'; 
                            }).join('') +
                        '</select>' +
                    '</div>';
                seatsDetailsList.appendChild(item);
            });
            
            // Nettoyer le mapping manuel après la mise à jour de la liste
            window.manualTypeMapping = null;
        }

        // Initialiser
        if (volSelect.value) {
            volSelect.dispatchEvent(new Event('change'));
        }
    </script>
</body>
</html>
