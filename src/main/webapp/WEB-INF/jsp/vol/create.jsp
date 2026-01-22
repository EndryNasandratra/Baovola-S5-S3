<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="../common/header.jsp" />

<jsp:include page="../common/navbar.jsp" />

<main class="main-content-wrapper">
    <div class="main-content" style="max-width: 48rem; margin: 0 auto;">
                
                <div class="mb-8">
                    <h1 class="text-2xl font-bold text-brand-900 mb-2">${vol.id != null ? 'Modifier' : 'Nouveau'} Vol</h1>
                    <nav class="flex" aria-label="Breadcrumb">
                        <ol class="inline-flex items-center space-x-1 md:space-x-2">
                            <li class="inline-flex items-center">
                                <a href="/" class="inline-flex items-center text-sm font-medium text-gray-500 hover:text-brand-600">Accueil</a>
                            </li>
                            <li>
                                <div class="flex items-center">
                                    <svg class="w-5 h-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                                    <a href="/vols" class="ml-1 text-sm font-medium text-gray-500 hover:text-brand-600 md:ml-2">Vols</a>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center">
                                    <svg class="w-5 h-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                                    <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Détails</span>
                                </div>
                            </li>
                        </ol>
                    </nav>
                </div>

                <div class="bg-white rounded-lg shadow-md border border-brand-200 p-6">
                    <form action="/vols/save" method="post" class="space-y-6">
                        <input type="hidden" name="id" value="${vol.id}">
                        
                        <div class="grid grid-cols-1 gap-6 sm:grid-cols-2">
                            <div>
                                <label for="aeroportDepart" class="block text-sm font-medium text-brand-700 mb-2">Aéroport de Départ</label>
                                <select name="aeroportDepart.id" id="aeroportDepart" required
                                        class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent">
                                    <option value="">Sélectionner...</option>
                                    <c:forEach items="${aeroports}" var="a">
                                        <option value="${a.id}" ${vol.aeroportDepart.id == a.id ? 'selected' : ''}>${a.nom}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div>
                                <label for="aeroportArrivee" class="block text-sm font-medium text-brand-700 mb-2">Aéroport d'Arrivée</label>
                                <select name="aeroportArrivee.id" id="aeroportArrivee" required
                                        class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent">
                                    <option value="">Sélectionner...</option>
                                    <c:forEach items="${aeroports}" var="a">
                                        <option value="${a.id}" ${vol.aeroportArrivee.id == a.id ? 'selected' : ''}>${a.nom}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>

                        <div>
                            <label for="duree" class="block text-sm font-medium text-brand-700 mb-2">Durée (en heures)</label>
                            <input type="number" step="0.01" name="duree" id="duree" value="${vol.duree}" required
                                   class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent">
                        </div>

                        <div class="flex gap-3 pt-4">
                            <button type="submit" class="bg-gradient-to-r from-brand-600 to-brand-700 text-white px-6 py-2 rounded-md hover:from-brand-700 hover:to-brand-800 shadow-lg transition-all text-sm font-medium">
                                Enregistrer
                            </button>
                            <a href="/vols" class="bg-brand-100 text-brand-700 px-6 py-2 rounded-md hover:bg-brand-200 shadow-sm transition-colors text-sm font-medium">
                                Annuler
                            </a>
                        </div>
                    </form>
                </div>
            </div>
    </div>
</main>
</body>
</html>
