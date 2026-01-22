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
                    <h1 class="text-2xl font-bold text-gray-900 mb-2">${programmation.id != null ? 'Modifier la Programmation' : 'Nouvelle Programmation'}</h1>
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
                                    <a href="/vol-programmation" class="ml-1 text-sm font-medium text-gray-500 hover:text-brand-600 md:ml-2">Programmations</a>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center">
                                    <svg class="w-5 h-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                                    <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">${programmation.id != null ? 'Modifier' : 'Créer'}</span>
                                </div>
                            </li>
                        </ol>
                    </nav>
                </div>

                <!-- Form Card -->
                <div class="bg-white rounded-lg shadow-sm border border-gray-200 p-6">
                    <form action="/vol-programmation/save" method="post" class="space-y-6">
                        <input type="hidden" name="id" value="${programmation.id}">
                        
                        <!-- Vol Selection -->
                        <div>
                            <label for="vol" class="block text-sm font-medium text-gray-700 mb-2">Choisir un Vol</label>
                            <select class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent" id="vol" name="vol.id" required>
                                <option value="">Sélectionnez un vol</option>
                                <c:forEach items="${vols}" var="v">
                                    <option value="${v.id}" ${programmation.vol.id == v.id ? 'selected' : ''}>
                                        ${v.aeroportDepart.nom} → ${v.aeroportArrivee.nom} (${v.duree}h)
                                    </option>
                                </c:forEach>
                            </select>
                            <p class="mt-1 text-sm text-gray-500">Le vol définit l'origine, la destination et la durée.</p>
                        </div>

                        <!-- Avion Selection -->
                        <div>
                            <label for="avion" class="block text-sm font-medium text-gray-700 mb-2">Choisir un Avion</label>
                            <select class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent" id="avion" name="avion.id" required>
                                <option value="">Sélectionnez un avion</option>
                                <c:forEach items="${avions}" var="a">
                                    <option value="${a.id}" ${programmation.avion.id == a.id ? 'selected' : ''}>
                                        ${a.matricule} - Capacité: ${a.capacite}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>

                        <!-- Date et Heure -->
                        <div>
                            <label for="dateHeure" class="block text-sm font-medium text-gray-700 mb-2">Date et Heure de départ</label>
                            <input type="datetime-local" 
                                   class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent" 
                                   id="dateHeure" 
                                   name="dateHeure" 
                                   value="${programmation.dateHeure}"
                                   required>
                        </div>

                        <!-- Tarifs par Classe et Type de Passager -->
                        <div class="border-t border-gray-100 pt-6">
                            <h3 class="text-sm font-semibold text-gray-900 mb-4">Grille Tarifaire (Classe & Type Passager)</h3>

                            <!-- Section Formule de Remise Rapide (uniquement en édition) -->
                            <c:if test="${programmation.id != null}">
                                <div class="bg-blue-50 p-4 rounded-lg border border-blue-100 mb-6">
                                    <h4 class="text-sm font-bold text-blue-800 mb-3 flex items-center gap-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z" />
                                        </svg>
                                        Ajouter une Formule de Remise pour ce vol
                                    </h4>
                                    <div class="grid grid-cols-1 md:grid-cols-5 gap-4 items-end">
                                        <div>
                                            <label class="block text-[10px] font-bold text-blue-600 uppercase mb-1">Classe</label>
                                            <select id="quick-remise-classe" class="w-full p-2 border border-blue-200 rounded text-sm focus:ring-blue-500 outline-none">
                                                <c:forEach items="${classes}" var="c">
                                                    <option value="${c.id}">${c.nom}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div>
                                            <label class="block text-[10px] font-bold text-blue-600 uppercase mb-1">Appliquer à</label>
                                            <select id="quick-remise-appliquer" class="w-full p-2 border border-blue-200 rounded text-sm focus:ring-blue-500 outline-none">
                                                <c:forEach items="${typePassagers}" var="tp">
                                                    <option value="${tp.id}">${tp.nom}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div>
                                            <label class="block text-[10px] font-bold text-blue-600 uppercase mb-1">Basé sur</label>
                                            <select id="quick-remise-reference" class="w-full p-2 border border-blue-200 rounded text-sm focus:ring-blue-500 outline-none">
                                                <c:forEach items="${typePassagers}" var="tp">
                                                    <option value="${tp.id}">${tp.nom}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div>
                                            <label class="block text-[10px] font-bold text-blue-600 uppercase mb-1">Valeur & Formule</label>
                                            <div class="flex">
                                                <input type="number" id="quick-remise-valeur" class="w-full p-2 border border-blue-200 rounded-l text-sm focus:ring-blue-500 outline-none" placeholder="Ex: 10">
                                                <select id="quick-remise-formule" class="p-2 border border-l-0 border-blue-200 rounded-r text-sm focus:ring-blue-500 outline-none bg-white">
                                                    <option value="%">%</option>
                                                    <option value="-">-</option>
                                                </select>
                                            </div>
                                        </div>
                                        <button type="button" onclick="addQuickRemise()" class="bg-blue-600 text-white p-2 rounded text-sm font-bold hover:bg-blue-700 transition-colors">
                                            Appliquer
                                        </button>
                                    </div>
                                    <p class="text-[10px] text-blue-500 mt-2 italic">* L'application mettra à jour les tarifs dans la grille ci-dessous et enregistrera la règle pour ce vol.</p>
                                </div>
                            </c:if>

                            <div class="space-y-6">
                                <c:forEach items="${classes}" var="classe">
                                    <div class="bg-gray-50 p-4 rounded-lg border border-gray-100">
                                        <h4 class="text-xs font-bold text-gray-700 uppercase tracking-wider mb-3 flex items-center gap-2">
                                            <span class="w-2 h-2 bg-brand-500 rounded-full"></span>
                                            ${classe.nom}
                                        </h4>
                                        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
                                            <c:forEach items="${typePassagers}" var="type">
                                                <c:set var="tarifKey" value="tarif_${classe.id}_${type.id}" />
                                                <c:set var="remiseAppliquee" value="${null}" />
                                                <c:forEach items="${remises}" var="r">
                                                    <c:if test="${r.classe.id == classe.id && r.typePassagerAppliquer.id == type.id}">
                                                        <c:set var="remiseAppliquee" value="${r}" />
                                                    </c:if>
                                                </c:forEach>
                                                
                                                <div>
                                                    <div class="flex justify-between items-center mb-1">
                                                        <label for="tarif_${classe.id}_${type.id}" class="block text-[10px] font-medium text-gray-400">Passager: ${type.nom}</label>
                                                        <c:if test="${remiseAppliquee != null}">
                                                            <span class="text-[9px] font-bold text-brand-600 bg-brand-50 px-1.5 rounded border border-brand-100" title="Calculé automatiquement">
                                                                ${remiseAppliquee.formule == '%' ? '' : remiseAppliquee.formule}${remiseAppliquee.remise}${remiseAppliquee.formule == '%' ? '%' : ''} de ${remiseAppliquee.typePassagerReference.nom}
                                                            </span>
                                                        </c:if>
                                                    </div>
                                                    <div class="relative">
                                                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                                            <span class="text-gray-400 text-xs">Ar</span>
                                                        </div>
                                                        <input type="number" 
                                                               step="0.01" 
                                                               name="tarif_${classe.id}_${type.id}" 
                                                               id="tarif_${classe.id}_${type.id}" 
                                                               data-classe-id="${classe.id}"
                                                               data-type-id="${type.id}"
                                                               value="${requestScope[tarifKey]}"
                                                               class="tarif-input w-full pl-8 pr-4 py-1.5 border border-gray-300 rounded focus:outline-none focus:ring-1 focus:ring-brand-500 focus:border-transparent text-sm" 
                                                               placeholder="Tarif pour ${type.nom}" 
                                                               required>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <!-- Statut de la Programmation (visible uniquement en édition) -->
                        <c:if test="${programmation.id != null}">
                            <div class="border-t border-gray-100 pt-6">
                                <label for="statutId" class="block text-sm font-medium text-gray-700 mb-2">Statut de la Programmation</label>
                                <select class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent" id="statutId" name="statutId">
                                    <c:forEach items="${allStatuts}" var="statut">
                                        <option value="${statut.id}" ${currentStatut.id == statut.id ? 'selected' : ''}>${statut.nom}</option>
                                    </c:forEach>
                                </select>
                                <p class="mt-1 text-sm text-gray-500">Modifier le statut de cette programmation de vol.</p>
                            </div>
                        </c:if>

                        <!-- Actions -->
                        <div class="flex gap-3 pt-4">
                            <button type="submit" class="bg-brand-600 text-white px-6 py-2 rounded-md hover:bg-brand-700 shadow-sm transition-colors text-sm font-medium">
                                Enregistrer
                            </button>
                            <a href="/vol-programmation" class="bg-gray-100 text-gray-700 px-6 py-2 rounded-md hover:bg-gray-200 shadow-sm transition-colors text-sm font-medium">
                                Annuler
                            </a>
                        </div>
                    </form>
                </div>

            </div>
        </main>
    </div>

    <script>
        // Données des remises configurées
        const remises = [
            <c:forEach items="${remises}" var="r" varStatus="status">
                {
                    remise: ${r.remise},
                    formule: '${r.formule}',
                    idAppliquer: ${r.typePassagerAppliquer.id},
                    idReference: ${r.typePassagerReference.id},
                    idClasse: ${r.classe.id}
                }<c:if test="${!status.last}">,</c:if>
            </c:forEach>
        ];

        function addQuickRemise() {
            const classeId = document.getElementById('quick-remise-classe').value;
            const appliquerId = document.getElementById('quick-remise-appliquer').value;
            const referenceId = document.getElementById('quick-remise-reference').value;
            const valeur = document.getElementById('quick-remise-valeur').value;
            const formule = document.getElementById('quick-remise-formule').value;
            const progId = "${programmation.id}";

            if (!valeur || referenceId === appliquerId) {
                alert("Veuillez remplir correctement la formule.");
                return;
            }

            // 1. Envoyer au serveur pour enregistrer la remise
            fetch('/remise-tarif/save-quick', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams({
                    'id_vol_programmation': progId,
                    'id_classe': classeId,
                    'id_type_passager_appliquer': appliquerId,
                    'id_type_passager_reference': referenceId,
                    'remise': valeur,
                    'formule': formule
                })
            })
            .then(response => {
                if (response.ok) {
                    // 2. Mettre à jour la liste locale des remises pour le calcul JS immédiat
                    const existingIdx = remises.findIndex(r => r.idClasse == classeId && r.idAppliquer == appliquerId);
                    const newRemise = {
                        remise: parseFloat(valeur),
                        formule: formule,
                        idAppliquer: parseInt(appliquerId),
                        idReference: parseInt(referenceId),
                        idClasse: parseInt(classeId)
                    };

                    if (existingIdx !== -1) remises[existingIdx] = newRemise;
                    else remises.push(newRemise);

                    // 3. Déclencher le recalcul automatique sur l'input de référence
                    const refInput = document.querySelector(`.tarif-input[data-classe-id="${classeId}"][data-type-id="${referenceId}"]`);
                    if (refInput) {
                        refInput.dispatchEvent(new Event('input'));
                    }
                    
                    alert("Formule appliquée et enregistrée.");
                    // Recharger la page pour voir les badges mis à jour et les nouveaux tarifs calculés
                    location.reload();
                } else {
                    alert("Erreur lors de l'enregistrement de la formule.");
                }
            });
        }

        document.addEventListener('DOMContentLoaded', function() {
            const inputs = document.querySelectorAll('.tarif-input');
            
            inputs.forEach(input => {
                 input.addEventListener('input', function() {
                     const classeId = parseInt(this.dataset.classeId);
                     const typeId = parseInt(this.dataset.typeId);
                     const value = parseFloat(this.value) || 0;
                     
                     // Trouver si ce changement doit en impacter d'autres via les remises
                     remises.forEach(remise => {
                         // Si l'input modifié est la référence pour une remise dans cette classe
                         if (remise.idReference === typeId && remise.idClasse === classeId) {
                             const targetInput = document.querySelector('.tarif-input[data-classe-id="' + classeId + '"][data-type-id="' + remise.idAppliquer + '"]');
                             
                             if (targetInput) {
                                 let calculatedValue = 0;
                                 if (remise.formule === '%') {
                                     calculatedValue = value * (remise.remise / 100);
                                 } else if (remise.formule === '-') {
                                     calculatedValue = value - remise.remise;
                                 }
                                 
                                 if (calculatedValue < 0) calculatedValue = 0;
                                 targetInput.value = calculatedValue.toFixed(2);
                             }
                         }
                     });
                 });
             });

             // Calculer les tarifs initiaux si on est en mode édition
             inputs.forEach(input => {
                if (input.value && !input.dataset.initialCalculated) {
                    input.dispatchEvent(new Event('input'));
                    input.dataset.initialCalculated = "true";
                }
             });
         });
    </script>
</body>
</html>
