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
                    <h1 class="text-2xl font-bold text-gray-900 mb-2">Disponibilités des Vols</h1>
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
                                    <a href="/vols" class="ml-1 text-sm font-medium text-gray-500 hover:text-brand-600 md:ml-2">Vols</a>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center">
                                    <svg class="w-5 h-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                                    <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Disponibilités</span>
                                </div>
                            </li>
                        </ol>
                    </nav>
                </div>

                <!-- Vols Grid -->
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                    <c:forEach items="${vols}" var="vol">
                        <div class="bg-white rounded-lg shadow-md border border-gray-200 overflow-hidden hover:shadow-lg transition-shadow">
                            <!-- Vol Header -->
                            <div class="bg-gradient-to-r from-brand-600 to-brand-700 text-white p-4">
                                <div class="flex items-center justify-between mb-2">
                                    <span class="text-sm font-medium opacity-90">Vol #${vol.id}</span>
                                    <span class="bg-white/20 px-2 py-1 rounded text-xs">${vol.duree}h</span>
                                </div>
                                <div class="flex items-center justify-between text-lg font-bold">
                                    <span>${vol.aeroportDepart.nom}</span>
                                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                                        <path fill-rule="evenodd" d="M10.293 3.293a1 1 0 011.414 0l6 6a1 1 0 010 1.414l-6 6a1 1 0 01-1.414-1.414L14.586 11H3a1 1 0 110-2h11.586l-4.293-4.293a1 1 0 010-1.414z" clip-rule="evenodd" />
                                    </svg>
                                    <span>${vol.aeroportArrivee.nom}</span>
                                </div>
                            </div>

                            <!-- Vol Details -->
                            <div class="p-4">


                                <!-- Jours disponibles -->
                                <div class="mb-3">
                                    <h4 class="text-sm font-semibold text-gray-700 mb-2 flex items-center gap-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-brand-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                                        </svg>
                                        Jours disponibles
                                    </h4>
                                    <div class="flex flex-wrap gap-1">
                                        <c:forEach items="${vol.jours}" var="jour">
                                            <span class="inline-flex items-center px-2 py-1 rounded-md bg-blue-50 text-blue-700 text-xs font-medium">
                                                ${jour}
                                            </span>
                                        </c:forEach>
                                        <c:if test="${empty vol.jours}">
                                            <span class="text-xs text-gray-400 italic">Aucun jour défini</span>
                                        </c:if>
                                    </div>
                                </div>

                                <!-- Heures disponibles -->
                                <div class="mb-4">
                                    <h4 class="text-sm font-semibold text-gray-700 mb-2 flex items-center gap-2">
                                        <svg xmlns="http://www.w3.org/2000/svg" class="h-4 w-4 text-brand-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z" />
                                        </svg>
                                        Heures de départ
                                    </h4>
                                    <div class="flex flex-wrap gap-1">
                                        <c:forEach items="${vol.heures}" var="heure">
                                            <span class="inline-flex items-center px-2 py-1 rounded-md bg-green-50 text-green-700 text-xs font-medium">
                                                ${heure}
                                            </span>
                                        </c:forEach>
                                        <c:if test="${empty vol.heures}">
                                            <span class="text-xs text-gray-400 italic">Aucune heure définie</span>
                                        </c:if>
                                    </div>
                                </div>

                                <!-- Action Button -->
                                <a href="/reservations/create?volId=${vol.id}" class="block w-full text-center bg-brand-600 text-white py-2 rounded-md hover:bg-brand-700 transition-colors text-sm font-medium">
                                    Réserver ce vol
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>

                <!-- Empty State -->
                <c:if test="${empty vols}">
                    <div class="text-center py-12">
                        <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 19l9 2-9-18-9 18 9-2zm0 0v-8" />
                        </svg>
                        <h3 class="mt-2 text-sm font-medium text-gray-900">Aucun vol disponible</h3>
                        <p class="mt-1 text-sm text-gray-500">Revenez plus tard pour voir les vols disponibles.</p>
                    </div>
                </c:if>

            </div>
    </div>
</main>
</body>
</html>
