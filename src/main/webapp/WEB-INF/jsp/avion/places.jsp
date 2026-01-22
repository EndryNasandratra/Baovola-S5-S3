<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<jsp:include page="../common/header.jsp" />

<!-- Top Navbar -->
<jsp:include page="../common/navbar.jsp" />

<!-- Main Content Wrapper -->
<main class="main-content-wrapper">
    <div class="main-content">
                
                <!-- Page Header -->
                <div class="mb-8">
                    <h1 class="text-2xl font-bold text-gray-900 mb-2">Configuration des Places</h1>
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
                                    <a href="/avions" class="ml-1 text-sm font-medium text-gray-500 hover:text-brand-600 md:ml-2">Avions</a>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center">
                                    <svg class="w-5 h-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                                    <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Places : ${avion.matricule}</span>
                                </div>
                            </li>
                        </ol>
                    </nav>
                </div>

                <div class="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                    <div class="p-6 border-b border-gray-200 bg-gray-50">
                        <div class="flex justify-between items-center">
                            <div>
                                <h2 class="text-lg font-bold text-gray-900">Configuration de l'avion ${avion.matricule}</h2>
                                <p class="text-sm text-gray-500">Capacité totale : <span class="font-bold text-gray-900">${avion.capacite} places</span></p>
                            </div>
                            <div class="h-10 w-10 bg-brand-100 rounded-full flex items-center justify-center text-brand-600">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10" />
                                </svg>
                            </div>
                        </div>
                    </div>

                    <form action="/avions/${avion.id}/places/save" method="post" class="p-6" id="configForm">
                        <div class="space-y-6">
                            <c:forEach items="${classes}" var="classe">
                                <div class="p-5 border border-gray-200 rounded-xl hover:border-brand-300 transition-colors bg-white shadow-sm">
                                    <div class="flex items-center justify-between mb-4">
                                        <div class="flex items-center gap-3">
                                            <div class="w-2 h-8 bg-brand-600 rounded-full"></div>
                                            <h3 class="text-lg font-bold text-gray-900">${classe.nom}</h3>
                                        </div>
                                    </div>
                                    
                                    <c:set var="classePlace" value="${null}" />
                                    <c:forEach items="${avionPlaces}" var="ap">
                                        <c:if test="${ap.classe.id == classe.id}">
                                            <c:set var="classePlace" value="${ap}" />
                                        </c:if>
                                    </c:forEach>

                                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                                        <div class="space-y-2">
                                            <label class="text-xs font-bold text-gray-500 uppercase tracking-wider">Place de début</label>
                                            <div class="relative">
                                                <input type="number" name="placeDebut_${classe.id}" value="${classePlace != null ? classePlace.placeDebut : ''}" 
                                                       class="w-full pl-4 pr-4 py-2.5 bg-gray-50 border border-gray-300 rounded-lg focus:ring-2 focus:ring-brand-500 focus:border-brand-500 outline-none transition-all"
                                                       placeholder="0">
                                            </div>
                                        </div>
                                        <div class="space-y-2">
                                            <label class="text-xs font-bold text-gray-500 uppercase tracking-wider">Place de fin</label>
                                            <div class="relative">
                                                <input type="number" name="placeFin_${classe.id}" value="${classePlace != null ? classePlace.placeFin : ''}" 
                                                       class="w-full pl-4 pr-4 py-2.5 bg-gray-50 border border-gray-300 rounded-lg focus:ring-2 focus:ring-brand-500 focus:border-brand-500 outline-none transition-all"
                                                       placeholder="0">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <div id="error-message" class="mt-6 p-4 bg-red-50 border border-red-200 text-red-600 rounded-lg text-sm font-medium hidden">
                            <!-- JS Error Message -->
                        </div>

                        <div class="mt-8 flex items-center justify-end gap-4 pt-6 border-t border-gray-100">
                            <a href="/avions" class="px-6 py-2.5 text-sm font-bold text-gray-500 hover:text-gray-700 transition-colors">
                                Annuler
                            </a>
                            <button type="submit" class="px-8 py-2.5 bg-brand-600 text-white rounded-lg font-bold hover:bg-brand-700 shadow-md shadow-brand-200 transition-all">
                                Enregistrer la Configuration
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </main>
    </div>

    <script>
        document.getElementById('configForm').addEventListener('submit', function(e) {
            const inputs = Array.from(this.querySelectorAll('input[type="number"]'));
            const errorDiv = document.getElementById('error-message');
            const capacity = ${avion.capacite};
            
            let ranges = [];
            let isValid = true;
            let message = "";

            // Collect and validate individual ranges
            for(let i = 0; i < inputs.length; i += 2) {
                const start = parseInt(inputs[i].value);
                const end = parseInt(inputs[i+1].value);

                if(!isNaN(start) || !isNaN(end)) {
                    if(isNaN(start) || isNaN(end)) {
                        isValid = false;
                        message = "Veuillez remplir les deux champs pour chaque classe configurée.";
                        break;
                    }
                    if(start < 1 || end < 1) {
                        isValid = false;
                        message = "Les numéros de places doivent être supérieurs à 0.";
                        break;
                    }
                    if(start > end) {
                        isValid = false;
                        message = "La place de début ne peut pas être supérieure à la place de fin.";
                        break;
                    }
                    if(end > capacity) {
                        isValid = false;
                        message = `La place de fin (${end}) dépasse la capacité de l'avion (${capacity}).`;
                        break;
                    }
                    ranges.push({start, end});
                }
            }

            // Check for overlaps
            if(isValid) {
                ranges.sort((a, b) => a.start - b.start);
                for(let i = 0; i < ranges.length - 1; i++) {
                    if(ranges[i].end >= ranges[i+1].start) {
                        isValid = false;
                        message = "Les plages de places ne doivent pas se chevaucher.";
                        break;
                    }
                }
            }

            if(!isValid) {
                e.preventDefault();
                errorDiv.textContent = message;
                errorDiv.classList.remove('hidden');
                errorDiv.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
        });
    </script>
</body>
</html>
