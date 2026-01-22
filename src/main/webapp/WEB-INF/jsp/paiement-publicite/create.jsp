<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../common/header.jsp" />

<!-- Top Navbar -->
<jsp:include page="../common/navbar.jsp" />

<!-- Main Content Wrapper -->
<main class="main-content-wrapper">
    <div class="main-content">
                
        <!-- Page Header with Breadcrumb -->
        <div class="mb-8 max-w-3xl mx-auto">
            <h1 class="text-2xl font-bold text-gray-900 mb-2">Enregistrer un Paiement</h1>
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
                            <a href="${pageContext.request.contextPath}/paiements-publicite" class="ml-1 text-sm font-medium text-gray-500 hover:text-brand-600 md:ml-2">Paiements</a>
                        </div>
                    </li>
                    <li>
                        <div class="flex items-center">
                            <svg class="w-5 h-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                            <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Nouveau</span>
                        </div>
                    </li>
                </ol>
            </nav>
        </div>

        <!-- Message d'erreur -->
        <c:if test="${not empty error}">
            <div class="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-lg mb-4 flex items-center max-w-3xl mx-auto">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 mr-2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 11-18 0 9 9 0 0118 0zm-9 3.75h.008v.008H12v-.008z" />
                </svg>
                ${error}
            </div>
        </c:if>

        <!-- Form Card -->
        <div class="bg-white rounded-lg shadow-sm border border-gray-200 p-6 max-w-3xl mx-auto">
            <form action="${pageContext.request.contextPath}/paiements-publicite/create" method="post" class="space-y-6">
                
                <div>
                    <label for="idSociete" class="block text-sm font-medium text-gray-700 mb-2">Société Annonceur *</label>
                    <select name="idSociete" id="idSociete" required onchange="updateRestePayer()"
                            class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent">
                        <option value="">-- Sélectionner une société --</option>
                        <c:forEach var="info" items="${societesAvecReste}">
                            <option value="${info.id_societe}" 
                                    data-total-a-payer="${info.total_a_payer}"
                                    data-total-paye="${info.total_paye}">
                                ${info.nom_societe} - Reste: <fmt:formatNumber value="${info.reste_a_payer}" type="number" groupingUsed="true"/> Ar
                            </option>
                        </c:forEach>
                    </select>
                    <p class="mt-1 text-sm text-gray-500">Seules les sociétés ayant un reste à payer sont affichées</p>
                </div>

                <!-- Informations financières de la société -->
                <div id="societeInfo" class="hidden"></div>

                <div>
                    <label for="montant" class="block text-sm font-medium text-gray-700 mb-2">Montant du Paiement (Ar) *</label>
                    <input type="number" name="montant" id="montant" required min="0" step="0.01"
                           class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent"
                           placeholder="Ex: 1000000">
                    <p class="mt-1 text-sm text-gray-500">Montant en Ariary (Ar)</p>
                </div>

                <div>
                    <label for="datePaiement" class="block text-sm font-medium text-gray-700 mb-2">Date du Paiement *</label>
                    <input type="date" name="datePaiement" id="datePaiement" required
                           value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>"
                           class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent">
                </div>

                <div>
                    <label for="referencePaiement" class="block text-sm font-medium text-gray-700 mb-2">Référence de Paiement</label>
                    <input type="text" name="referencePaiement" id="referencePaiement" maxlength="100"
                           class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent"
                           placeholder="Ex: VIREMENT-2026-001">
                    <p class="mt-1 text-sm text-gray-500">Numéro de transaction, référence bancaire, etc.</p>
                </div>

                <div>
                    <label for="remarque" class="block text-sm font-medium text-gray-700 mb-2">Remarque</label>
                    <textarea name="remarque" id="remarque" rows="3"
                              class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent"
                              placeholder="Informations complémentaires sur ce paiement..."></textarea>
                </div>

                <div class="flex gap-4 pt-4">
                    <button type="submit" 
                            class="bg-brand-600 text-white px-6 py-2 rounded-md hover:bg-brand-700 shadow-sm transition-colors font-medium flex items-center gap-2">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                        Enregistrer le Paiement
                    </button>
                    <a href="${pageContext.request.contextPath}/paiements-publicite" 
                       class="bg-gray-100 text-gray-700 px-6 py-2 rounded-md hover:bg-gray-200 shadow-sm transition-colors font-medium">
                        Annuler
                    </a>
                </div>
            </form>
        </div>

        <!-- Guide d'utilisation -->
        <div class="mt-6 bg-blue-50 rounded-lg border border-blue-200 p-6 max-w-3xl mx-auto">
            <h3 class="text-lg font-medium text-blue-800 mb-3 flex items-center gap-2">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M11.25 11.25l.041-.02a.75.75 0 011.063.852l-.708 2.836a.75.75 0 001.063.853l.041-.021M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-9-3.75h.008v.008H12V8.25z" />
                </svg>
                Comment ça marche ?
            </h3>
            <ul class="space-y-2 text-sm text-blue-700">
                <li class="flex items-start">
                    <span class="font-bold mr-2">•</span>
                    <span><strong>Sélectionnez une société :</strong> Seules les sociétés ayant un reste à payer sont affichées</span>
                </li>
                <li class="flex items-start">
                    <span class="font-bold mr-2">•</span>
                    <span><strong>Montant :</strong> Vous pouvez faire un paiement partiel ou total</span>
                </li>
                <li class="flex items-start">
                    <span class="font-bold mr-2">•</span>
                    <span><strong>Date :</strong> Date de réception du paiement (par défaut aujourd'hui)</span>
                </li>
                <li class="flex items-start">
                    <span class="font-bold mr-2">•</span>
                    <span><strong>Référence :</strong> Permet de tracer le paiement (numéro de virement, chèque, etc.)</span>
                </li>
            </ul>
        </div>

    </div>
</main>

<script>
    function updateRestePayer() {
        const select = document.getElementById('idSociete');
        const selectedOption = select.options[select.selectedIndex];
        const totalAPayer = parseFloat(selectedOption.getAttribute('data-total-a-payer') || 0);
        const totalPaye = parseFloat(selectedOption.getAttribute('data-total-paye') || 0);
        const resteAPayer = totalAPayer - totalPaye;
        
        const infoDiv = document.getElementById('societeInfo');
        if (select.value) {
            infoDiv.innerHTML = `
                <div class="grid grid-cols-3 gap-4 p-4 bg-gray-50 rounded-lg border border-gray-200">
                    <div>
                        <div class="text-xs text-gray-500 mb-1">Total à payer</div>
                        <div class="text-lg font-bold text-gray-900">${totalAPayer.toLocaleString('fr-FR')} Ar</div>
                    </div>
                    <div>
                        <div class="text-xs text-gray-500 mb-1">Déjà payé</div>
                        <div class="text-lg font-bold text-green-600">${totalPaye.toLocaleString('fr-FR')} Ar</div>
                    </div>
                    <div>
                        <div class="text-xs text-gray-500 mb-1">Reste à payer</div>
                        <div class="text-lg font-bold ${resteAPayer > 0 ? 'text-red-600' : 'text-green-600'}">
                            ${resteAPayer.toLocaleString('fr-FR')} Ar
                        </div>
                    </div>
                </div>
            `;
            infoDiv.classList.remove('hidden');
        } else {
            infoDiv.classList.add('hidden');
        }
    }
</script>
</body>
</html>
