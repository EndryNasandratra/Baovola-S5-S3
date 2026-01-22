<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="common/header.jsp" />

<!-- Top Navbar -->
<jsp:include page="common/navbar.jsp" />

<!-- Main Content Wrapper -->
<main class="main-content-wrapper">
    <div class="main-content">
        
        <!-- Page Header with Breadcrumb -->
        <div class="mb-8 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
            <div>
                <h1 class="text-2xl font-bold text-gray-900 mb-2">Tableau de Bord</h1>
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
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Tableau de bord</span>
                            </div>
                        </li>
                    </ol>
                </nav>
            </div>
            <button class="bg-brand-600 text-white px-4 py-2 rounded-md hover:bg-brand-700 shadow-sm transition-colors text-sm font-medium flex items-center gap-2">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                </svg>
                Nouveau Rapport
            </button>
        </div>

                <!-- Stats Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                    <!-- Stat Card 1 -->
                    <div class="bg-white rounded-lg p-6 shadow-sm border border-gray-100">
                        <div class="flex items-center justify-between mb-4">
                            <h3 class="text-sm font-medium text-gray-500">Vols Aujourd'hui</h3>
                            <span class="p-2 bg-green-50 text-green-600 rounded-full">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 19.5v-15m0 0l-6.75 6.75M12 4.5l6.75 6.75" />
                                </svg>
                            </span>
                        </div>
                        <div class="text-2xl font-bold text-gray-900">${volsAujourdhui}</div>
                        <p class="text-xs text-green-600 mt-1 flex items-center">
                            Actuel aujourd'hui
                        </p>
                    </div>

                    <!-- Stat Card 2 -->
                    <div class="bg-white rounded-lg p-6 shadow-sm border border-gray-100">
                         <div class="flex items-center justify-between mb-4">
                            <h3 class="text-sm font-medium text-gray-500">Passagers</h3>
                            <span class="p-2 bg-blue-50 text-blue-600 rounded-full">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M15 19.128a9.38 9.38 0 002.625.372 9.337 9.337 0 004.121-.952 4.125 4.125 0 00-7.533-2.493M15 19.128v-.003c0-1.113-.285-2.16-.786-3.07M15 19.128v.106A12.318 12.318 0 018.624 21c-2.331 0-4.512-.645-6.374-1.766l-.001-.109a6.375 6.375 0 0111.964-3.07M12 6.375a3.375 3.375 0 11-6.75 0 3.375 3.375 0 016.75 0zm8.25 2.25a2.625 2.625 0 11-5.25 0 2.625 2.625 0 015.25 0z" />
                                </svg>
                            </span>
                        </div>
                        <div class="text-2xl font-bold text-gray-900">
                            <fmt:formatNumber value="${passagersMois}" type="number" />
                        </div>
                        <p class="text-xs text-gray-500 mt-1">Actuels ce mois</p>
                    </div>

                     <!-- Stat Card 3 -->
                    <div class="bg-white rounded-lg p-6 shadow-sm border border-gray-100">
                         <div class="flex items-center justify-between mb-4">
                            <h3 class="text-sm font-medium text-gray-500">Revenus</h3>
                            <span class="p-2 bg-purple-50 text-purple-600 rounded-full">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 6v12m-3-2.818l.879.659c1.171.879 3.07.879 4.242 0 1.172-.879 1.172-2.303 0-3.182C13.536 12.219 12.768 12 12 12c-.725 0-1.45-.22-2.003-.659-1.106-.879-1.106-2.303 0-3.182s2.9-.879 4.006 0l.415.33M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                                </svg>
                            </span>
                        </div>
                        <div class="text-2xl font-bold text-gray-900">
                            <fmt:formatNumber value="${revenusMois}" type="currency" currencySymbol="$" />
                        </div>
                        <p class="text-xs text-green-600 mt-1 font-bold">Ce mois-ci</p>
                    </div>

                    <!-- Stat Card 4 -->
                    <div class="bg-white rounded-lg p-6 shadow-sm border border-gray-100">
                         <div class="flex items-center justify-between mb-4">
                            <h3 class="text-sm font-medium text-gray-500">Retards</h3>
                            <span class="p-2 bg-red-50 text-red-600 rounded-full">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m-9.303 3.376c-.866 1.5.217 3.374 1.948 3.374h14.71c1.73 0 2.813-1.874 1.948-3.374L13.949 3.378c-.866-1.5-3.032-1.5-3.898 0L2.697 16.126zM12 15.75h.007v.008H12v-.008z" />
                                </svg>
                            </span>
                        </div>
                        <div class="text-2xl font-bold text-gray-900">${retards}</div>
                        <p class="text-xs text-red-600 mt-1">Attention requise</p>
                    </div>
                </div>

                <!-- Recent Flights Table -->
                 <div class="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
                    <div class="px-6 py-4 border-b border-gray-200 flex justify-between items-center">
                        <h3 class="text-lg font-medium text-gray-900">Vols Récents</h3>
                        <a href="${pageContext.request.contextPath}/vol-programmation" class="text-sm font-medium text-brand-600 hover:text-brand-700">Voir tout</a>
                    </div>
                    <div class="overflow-x-auto">
                        <table class="min-w-full text-left text-sm whitespace-nowrap">
                            <thead class="bg-gray-50 text-gray-900 font-semibold">
                                <tr>
                                    <th class="px-6 py-3">Vol No.</th>
                                    <th class="px-6 py-3">Destination</th>
                                    <th class="px-6 py-3">Départ</th>
                                    <th class="px-6 py-3">Statut</th>
                                    <th class="px-6 py-3">Action</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100 border-t border-gray-100">
                                <c:forEach items="${volsRecents}" var="prog">
                                    <tr class="hover:bg-gray-50 transition-colors">
                                        <td class="px-6 py-3 font-medium text-brand-600">VOL-${prog.vol.id}</td>
                                        <td class="px-6 py-3">${prog.vol.aeroportArrivee.nom}</td>
                                        <td class="px-6 py-3">
                                            <c:out value="${prog.dateHeure.toString().substring(11, 16)}" />
                                        </td>
                                        <td class="px-6 py-3">
                                            <c:set var="statut" value="${statusMap[prog.id]}" />
                                            <span class="inline-flex items-center gap-1 rounded-full px-2 py-1 text-xs font-semibold 
                                                ${statut == 'A l\'heure' || statut == 'En cours' ? 'bg-green-50 text-green-600' : 
                                                  statut == 'Retardé' ? 'bg-orange-50 text-orange-600' : 
                                                  statut == 'Annulé' ? 'bg-red-50 text-red-600' : 'bg-gray-50 text-gray-600'}">
                                                <span class="h-1.5 w-1.5 rounded-full 
                                                    ${statut == 'A l\'heure' || statut == 'En cours' ? 'bg-green-600' : 
                                                      statut == 'Retardé' ? 'bg-orange-600' : 
                                                      statut == 'Annulé' ? 'bg-red-600' : 'bg-gray-600'}"></span>
                                                ${statut}
                                            </span>
                                        </td>
                                        <td class="px-6 py-3 text-gray-500 hover:text-gray-700">
                                            <a href="${pageContext.request.contextPath}/vol-programmation/details/${prog.id}">
                                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                                                    <path stroke-linecap="round" stroke-linejoin="round" d="M8.25 4.5l7.5 7.5-7.5 7.5" />
                                                </svg>
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
    </div>
</main>
</body>
</html>
