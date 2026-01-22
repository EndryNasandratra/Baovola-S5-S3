<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="../common/header.jsp" />

<!-- Top Navbar -->
<jsp:include page="../common/navbar.jsp" />

<!-- Main Content Wrapper -->
<main class="main-content-wrapper">
    <div class="main-content">
                
                <!-- Page Header with Breadcrumb -->
                <div class="mb-8 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
                    <div>
                        <h1 class="text-2xl font-bold text-gray-900 mb-2">Détails de la Programmation</h1>
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
                                        <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Vol #${programmation.id}</span>
                                    </div>
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
                    <!-- Flight Info Card -->
                    <div class="lg:col-span-2 space-y-8">
                        <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                            <div class="p-6 border-b border-gray-200 bg-gray-50/50">
                                <div class="flex justify-between items-center">
                                    <h2 class="text-xl font-bold text-gray-900">Informations du Vol</h2>
                                    <span class="px-3 py-1 bg-brand-600 text-white text-xs font-bold rounded-full">VOL #${programmation.id}</span>
                                </div>
                            </div>
                            <div class="p-6">
                                <div class="flex items-center justify-between mb-8">
                                    <div class="text-center">
                                        <div class="text-3xl font-bold text-gray-900">${programmation.vol.aeroportDepart.nom}</div>
                                        <div class="text-sm text-gray-500">Aéroport de Départ</div>
                                    </div>
                                    <div class="flex-1 px-8 flex flex-col items-center">
                                        <div class="text-xs text-gray-400 mb-1">${programmation.vol.duree}h de vol</div>
                                        <div class="w-full h-px bg-gray-200 relative">
                                            <div class="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 bg-white px-2">
                                                <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-brand-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8" />
                                                </svg>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <div class="text-3xl font-bold text-gray-900">${programmation.vol.aeroportArrivee.nom}</div>
                                        <div class="text-sm text-gray-500">Aéroport d'Arrivée</div>
                                    </div>
                                </div>
                                <div class="grid grid-cols-2 gap-6 pt-6 border-t border-gray-200">
                                    <div>
                                        <div class="text-xs text-gray-400 uppercase font-semibold mb-1">Date et Heure</div>
                                        <div class="text-gray-900 font-medium">${programmation.dateHeure}</div>
                                    </div>
                                    <div>
                                        <div class="text-xs text-gray-400 uppercase font-semibold mb-1">Avion</div>
                                        <div class="text-gray-900 font-medium">${programmation.avion.matricule} (${programmation.avion.capacite} places)</div>
                                    </div>
                                </div>

                                <div class="grid grid-cols-2 gap-6 pt-6 border-t border-gray-200 mt-4">
                                    <div>
                                        <div class="text-xs text-gray-400 uppercase font-semibold mb-1">Revenu Potentiel (Total)</div>
                                        <div class="text-xl font-bold text-brand-600">
                                            <fmt:formatNumber value="${potentialRevenue}" type="currency" currencySymbol="Ar" />
                                        </div>
                                    </div>
                                    <div>
                                        <div class="text-xs text-gray-400 uppercase font-semibold mb-1">Chiffre d'Affaires Actuel</div>
                                        <div class="text-xl font-bold text-green-600">
                                            <fmt:formatNumber value="${totalRevenue}" type="currency" currencySymbol="Ar" />
                                        </div>
                                    </div>
                                </div>

                                <!-- Tariffs Section -->
                                <div class="mt-8 pt-6 border-t border-gray-200">
                                    <div class="text-xs text-gray-400 uppercase font-semibold mb-4">Tarifs en Vigueur</div>
                                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                                        <c:forEach items="${configurations}" var="conf">
                                            <div class="bg-gray-50 rounded-lg p-4 border border-gray-100">
                                                <div class="flex items-center gap-2 mb-3">
                                                    <span class="w-2 h-2 bg-brand-500 rounded-full"></span>
                                                    <h4 class="text-sm font-bold text-gray-900 uppercase tracking-wider">${conf.classe.nom}</h4>
                                                </div>
                                                <div class="space-y-2">
                                                    <c:forEach items="${typePassagers}" var="type">
                                                        <c:set var="t_tarif" value="${allTariffs[conf.classe.id][type.id]}" />
                                                        <c:if test="${not empty t_tarif}">
                                                            <div class="flex justify-between items-center text-xs">
                                                                <span class="text-gray-500">${type.nom}</span>
                                                                <span class="font-bold text-brand-600">
                                                                    <fmt:formatNumber value="${t_tarif}" type="currency" currencySymbol="Ar" />
                                                                </span>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                                <div class="mt-3 pt-3 border-t border-gray-200 flex justify-between items-center">
                                                    <span class="text-[10px] text-gray-400 uppercase font-medium">Capacité</span>
                                                    <span class="text-xs font-bold text-gray-700">${conf.placeFin - conf.placeDebut + 1} places</span>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Reservations Table -->
                        <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                            <div class="p-6 border-b border-gray-200 bg-gray-50">
                                <h2 class="text-lg font-bold text-gray-900">Liste des Passagers</h2>
                            </div>
                            <div class="overflow-x-auto">
                                <table class="w-full text-left text-sm">
                                    <thead class="bg-gray-50 text-gray-900 font-semibold border-b border-gray-200">
                                        <tr>
                                            <th class="px-6 py-3">Passager</th>
                                            <th class="px-6 py-3">Détails des Sièges</th>
                                            <th class="px-6 py-3 text-right">Montant</th>
                                        </tr>
                                    </thead>
                                    <tbody class="divide-y divide-gray-100">
                                        <c:forEach items="${reservations}" var="res">
                                            <c:set var="totalResAmount" value="0" />
                                            <tr class="hover:bg-gray-50 transition-colors">
                                                <td class="px-6 py-4">
                                                    <div class="font-medium text-gray-900">${res.client.nom} ${res.client.prenom}</div>
                                                    <div class="text-xs text-gray-500">Réf: #${res.id} • ${res.client.email}</div>
                                                </td>
                                                <td class="px-6 py-4">
                                                    <div class="space-y-2">
                                                        <c:forEach items="${res.detailsPlaces}" var="rp">
                                                            <c:set var="seatClasse" value="${null}" />
                                                            <c:forEach items="${configurations}" var="conf">
                                                                <c:if test="${rp.place >= conf.placeDebut && rp.place <= conf.placeFin}">
                                                                    <c:set var="seatClasse" value="${conf.classe}" />
                                                                </c:if>
                                                            </c:forEach>
                                                            
                                                            <c:set var="seatTarif" value="0" />
                                                            <c:forEach items="${tarifs}" var="t">
                                                                <c:if test="${seatClasse != null && t.classe.id == seatClasse.id && t.typePassager.id == rp.typePassager.id}">
                                                                    <c:set var="seatTarif" value="${t.tarif}" />
                                                                </c:if>
                                                            </c:forEach>
                                                            <c:set var="totalResAmount" value="${totalResAmount + seatTarif}" />
                                                            
                                                            <div class="flex items-center gap-4 text-xs">
                                                                <span class="font-bold text-gray-700 w-8">${rp.place}</span>
                                                                <c:if test="${seatClasse != null}">
                                                                    <span class="inline-flex items-center rounded-full bg-blue-50 px-2 py-0.5 font-semibold text-blue-600 border border-blue-100">
                                                                        ${seatClasse.nom}
                                                                    </span>
                                                                </c:if>
                                                                <span class="inline-flex items-center rounded-full bg-purple-50 px-2 py-0.5 font-semibold text-purple-600 border border-purple-100">
                                                                    ${rp.typePassager.nom}
                                                                </span>
                                                                <span class="text-gray-500">
                                                                    <fmt:formatNumber value="${seatTarif}" type="currency" currencySymbol="Ar" />
                                                                </span>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </td>
                                                <td class="px-6 py-4 text-right font-bold text-brand-600 align-top">
                                                    <fmt:formatNumber value="${totalResAmount}" type="currency" currencySymbol="Ar" />
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${empty reservations}">
                                            <tr>
                                                <td colspan="3" class="px-6 py-12 text-center text-gray-400 italic">
                                                    Aucun passager enregistré pour ce vol.
                                                </td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- Financial Summary -->
                    <div class="space-y-8">
                        <!-- Status Card -->
                        <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                            <div class="p-6 border-b border-gray-200 bg-gray-50">
                                <h2 class="text-lg font-bold text-gray-900">Statut du Vol</h2>
                            </div>
                            <div class="p-6">
                                <div class="mb-4">
                                    <div class="text-xs text-gray-400 uppercase font-semibold mb-2">Statut Actuel</div>
                                    <c:choose>
                                        <c:when test="${not empty currentStatut}">
                                            <span class="px-3 py-1 inline-flex text-sm leading-5 font-semibold rounded-full 
                                                ${currentStatut.nom == 'Annulé' ? 'bg-red-100 text-red-800' : 
                                                  currentStatut.nom == 'Terminé' ? 'bg-green-100 text-green-800' : 
                                                  'bg-yellow-100 text-yellow-800'}">
                                                ${currentStatut.nom}
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="px-3 py-1 inline-flex text-sm leading-5 font-semibold rounded-full bg-gray-100 text-gray-800">
                                                N/A
                                            </span>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                                <form action="/vol-programmation-statut/update" method="post" class="space-y-4 pt-4 border-t border-gray-100">
                                    <input type="hidden" name="programmationId" value="${programmation.id}">
                                    <div>
                                        <label class="block text-xs font-semibold text-gray-400 uppercase mb-2">Modifier le statut</label>
                                        <select name="statutId" class="block w-full px-3 py-2 border border-gray-300 rounded-lg text-sm focus:ring-brand-500 focus:border-brand-500">
                                            <c:forEach items="${allStatuts}" var="s">
                                                <option value="${s.id}" ${currentStatut.id == s.id ? 'selected' : ''}>${s.nom}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <button type="submit" class="w-full bg-gray-900 text-white px-4 py-2 rounded-lg text-sm font-medium hover:bg-gray-800 transition-colors">
                                        Mettre à jour le statut
                                    </button>
                                </form>
                            </div>
                        </div>

                        <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                            <div class="p-6 border-b border-gray-200 bg-gray-50">
                                <h2 class="text-lg font-bold text-gray-900">Résumé Financier</h2>
                            </div>
                            <div class="p-6 space-y-6">
                                <div>
                                    <div class="text-xs text-gray-400 uppercase font-semibold mb-2">Chiffre d'Affaires Total</div>
                                    <div class="text-3xl font-bold text-brand-600">
                                        <fmt:formatNumber value="${totalRevenue}" type="currency" currencySymbol="Ar" />
                                    </div>
                                </div>
                                
                                <div class="pt-6 border-t border-gray-200">
                                    <div class="text-xs text-gray-400 uppercase font-semibold mb-4">Répartition par Classe & Type</div>
                                    <div class="space-y-6">
                                        <c:forEach items="${configurations}" var="conf">
                                            <c:set var="classId" value="${conf.classe.id}" />
                                            <c:set var="classRevenue" value="0" />
                                            
                                            <div class="space-y-2">
                                                <div class="flex justify-between items-center">
                                                    <span class="text-sm font-bold text-gray-900">${conf.classe.nom}</span>
                                                    <span class="text-[10px] text-gray-400 uppercase font-bold">${occupiedCountByClasse[classId]} places vendues</span>
                                                </div>
                                                
                                                <div class="pl-4 space-y-2 border-l-2 border-gray-100">
                                                    <c:forEach items="${typePassagers}" var="type">
                                                        <c:set var="typeId" value="${type.id}" />
                                                        <c:set var="count" value="${countByClasseAndType[classId][typeId]}" />
                                                        <c:set var="revenue" value="${revenueByClasseAndType[classId][typeId]}" />
                                                        <c:if test="${not empty count && count > 0}">
                                                            <c:set var="classRevenue" value="${classRevenue + revenue}" />
                                                            <div class="flex justify-between items-center text-xs">
                                                                <div class="text-gray-600">
                                                                    ${type.nom} <span class="text-gray-400">(${count})</span>
                                                                </div>
                                                                <div class="font-medium text-gray-900">
                                                                    <fmt:formatNumber value="${revenue}" type="currency" currencySymbol="Ar" />
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                    </c:forEach>
                                                </div>
                                                
                                                <div class="flex justify-between items-center pt-1">
                                                    <span class="text-[10px] text-gray-400 italic">Total ${conf.classe.nom}</span>
                                                    <span class="text-sm font-bold text-brand-600">
                                                        <fmt:formatNumber value="${classRevenue}" type="currency" currencySymbol="Ar" />
                                                    </span>
                                                </div>
                                                
                                                <div class="w-full bg-gray-100 h-1 rounded-full overflow-hidden">
                                                    <div class="bg-brand-600 h-full" style="width: ${totalRevenue > 0 ? (classRevenue / totalRevenue * 100) : 0}%"></div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>

                                <div class="pt-6 border-t border-gray-200">
                                    <c:set var="totalOccupied" value="0" />
                                    <c:forEach items="${reservations}" var="res">
                                        <c:set var="totalOccupied" value="${totalOccupied + res.nombrePlaces}" />
                                    </c:forEach>
                                    <div class="flex justify-between text-sm mb-2">
                                        <span class="text-gray-500">Taux de remplissage</span>
                                        <span class="font-bold text-gray-900">
                                            <fmt:formatNumber value="${(totalOccupied / programmation.avion.capacite) * 100}" maxFractionDigits="1" />%
                                        </span>
                                    </div>
                                    <div class="w-full bg-gray-100 h-2 rounded-full overflow-hidden">
                                        <div class="bg-green-500 h-full" style="width: ${(totalOccupied / programmation.avion.capacite) * 100}%"></div>
                                    </div>
                                    <div class="text-xs text-gray-400 mt-2">
                                        ${totalOccupied} / ${programmation.avion.capacite} places occupées
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Available Seats Card -->
                        <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                            <div class="p-6 border-b border-gray-200 bg-gray-50">
                                <h2 class="text-lg font-bold text-gray-900">Places Disponibles</h2>
                            </div>
                            <div class="p-6 space-y-6">
                                <c:forEach items="${configurations}" var="conf">
                                    <c:set var="classAvailable" value="${availableSeats[conf.classe.id]}" />
                                    <div>
                                        <div class="flex justify-between items-center mb-3">
                                            <span class="text-sm font-bold text-gray-900">${conf.classe.nom}</span>
                                            <span class="text-xs font-bold px-2.5 py-1 bg-green-100 text-green-700 rounded-full border border-green-200">
                                                ${classAvailable.size()} libres
                                            </span>
                                        </div>
                                        <div class="flex flex-wrap gap-2">
                                            <c:forEach items="${classAvailable}" var="seat">
                                                <span class="inline-flex items-center justify-center min-w-[2.5rem] h-8 px-2 text-xs font-bold border border-gray-200 rounded-lg bg-gray-50 text-gray-700 hover:border-brand-500 hover:text-brand-600 transition-colors cursor-default">
                                                    ${seat}
                                                </span>
                                            </c:forEach>
                                            <c:if test="${empty classAvailable}">
                                                <div class="w-full py-3 px-4 bg-red-50 border border-red-100 rounded-lg flex items-center gap-2 text-red-600">
                                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z" />
                                                    </svg>
                                                    <span class="text-xs font-semibold uppercase tracking-wider">Complet</span>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <!-- Actions Quick Access -->
                        <div class="bg-white rounded-xl shadow-sm border border-gray-200 p-6">
                            <h3 class="text-sm font-bold text-gray-900 mb-4">Actions rapides</h3>
                            <div class="grid grid-cols-1 gap-3">
                                <a href="/reservations/create?volId=${programmation.vol.id}&volProgrammationId=${programmation.id}" class="flex items-center justify-center gap-2 bg-brand-600 text-white px-4 py-2.5 rounded-lg font-medium hover:bg-brand-900 transition-colors">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                                    </svg>
                                    Nouvelle Réservation
                                </a>
                                <a href="/vol-programmation/edit/${programmation.id}" class="flex items-center justify-center gap-2 bg-gray-100 text-gray-700 px-4 py-2.5 rounded-lg font-medium hover:bg-gray-200 transition-colors">
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                                    </svg>
                                    Modifier le Vol
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</main>
</body>
</html>