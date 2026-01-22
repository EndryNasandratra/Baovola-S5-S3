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
        <div class="mb-8">
            <h1 class="text-2xl font-bold text-gray-900 mb-2">Modifier un Paiement</h1>
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
                            <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Modifier #${paiement.idPaiement}</span>
                        </div>
                    </li>
                </ol>
            </nav>
        </div>

        <!-- Message d'erreur -->
        <c:if test="${not empty error}">
            <div class="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-lg mb-4 flex items-center">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 mr-2">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M12 9v3.75m9-.75a9 9 0 11-18 0 9 9 0 0118 0zm-9 3.75h.008v.008H12v-.008z" />
                </svg>
                ${error}
            </div>
        </c:if>

        <!-- Form Card -->
        <div class="bg-white rounded-lg shadow-sm border border-gray-200 p-6 max-w-2xl">
            <form action="${pageContext.request.contextPath}/paiements-publicite/edit/${paiement.idPaiement}" method="post" class="space-y-6">
                
                <div>
                    <label for="idSociete" class="block text-sm font-medium text-gray-700 mb-2">Société Annonceur *</label>
                    <select name="idSociete" id="idSociete" required
                            class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent">
                        <c:forEach var="societe" items="${societes}">
                            <option value="${societe.id}" 
                                    ${societe.id == paiement.societeAnnonceur.id ? 'selected' : ''}>
                                ${societe.nom}
                            </option>
                        </c:forEach>
                    </select>
                </div>

                <div>
                    <label for="montant" class="block text-sm font-medium text-gray-700 mb-2">Montant (Ar) *</label>
                    <input type="number" name="montant" id="montant" required min="0" step="0.01"
                           value="${paiement.montant}"
                           class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent">
                </div>

                <div>
                    <label for="datePaiement" class="block text-sm font-medium text-gray-700 mb-2">Date du Paiement *</label>
                    <input type="date" name="datePaiement" id="datePaiement" required
                           value="${paiement.datePaiement}"
                           class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent">
                </div>

                <div>
                    <label for="referencePaiement" class="block text-sm font-medium text-gray-700 mb-2">Référence de Paiement</label>
                    <input type="text" name="referencePaiement" id="referencePaiement" maxlength="100"
                           value="${paiement.referencePaiement}"
                           class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent">
                </div>

                <div>
                    <label for="remarque" class="block text-sm font-medium text-gray-700 mb-2">Remarque</label>
                    <textarea name="remarque" id="remarque" rows="3"
                              class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-brand-500 focus:border-transparent">${paiement.remarque}</textarea>
                </div>

                <div class="flex gap-4 pt-4">
                    <button type="submit" 
                            class="bg-brand-600 text-white px-6 py-2 rounded-md hover:bg-brand-700 shadow-sm transition-colors font-medium flex items-center gap-2">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                        Enregistrer
                    </button>
                    <a href="${pageContext.request.contextPath}/paiements-publicite" 
                       class="bg-gray-100 text-gray-700 px-6 py-2 rounded-md hover:bg-gray-200 shadow-sm transition-colors font-medium">
                        Annuler
                    </a>
                </div>
            </form>
        </div>

    </div>
</main>
</body>
</html>
