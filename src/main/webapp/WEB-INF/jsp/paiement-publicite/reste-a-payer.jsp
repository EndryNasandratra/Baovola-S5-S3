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
        <div class="mb-8 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
            <div>
                <h1 class="text-2xl font-bold text-gray-900 mb-2">Reste à Payer par Société</h1>
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
                                <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Reste à Payer</span>
                            </div>
                        </li>
                    </ol>
                </nav>
            </div>
            <div class="flex gap-3">
                <a href="${pageContext.request.contextPath}/paiements-publicite" class="bg-gray-100 text-gray-700 px-4 py-2 rounded-md hover:bg-gray-200 shadow-sm transition-colors text-sm font-medium flex items-center gap-2">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M9 15L3 9m0 0l6-6M3 9h12a6 6 0 010 12h-3" />
                    </svg>
                    Liste des Paiements
                </a>
                <a href="${pageContext.request.contextPath}/paiements-publicite/create" class="bg-brand-600 text-white px-4 py-2 rounded-md hover:bg-brand-700 shadow-sm transition-colors text-sm font-medium flex items-center gap-2">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                    </svg>
                    Nouveau Paiement
                </a>
            </div>
        </div>

        <!-- Table reste à payer -->
        <div class="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
            <div class="px-6 py-4 border-b border-gray-200">
                <h3 class="text-lg font-medium text-gray-900">Détail par Société</h3>
            </div>
            <div class="overflow-x-auto">
                <table class="min-w-full text-left text-sm whitespace-nowrap">
                    <thead class="bg-gray-50 text-gray-900 font-semibold">
                        <tr>
                            <th class="px-6 py-3">Société</th>
                            <th class="px-6 py-3">Contact</th>
                            <th class="px-6 py-3 text-right">Total à Payer</th>
                            <th class="px-6 py-3 text-right">Total Payé</th>
                            <th class="px-6 py-3 text-right">Reste à Payer</th>
                            <th class="px-6 py-3">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="divide-y divide-gray-100 border-t border-gray-100">
                        <c:set var="totalAPayer" value="0"/>
                        <c:set var="totalPaye" value="0"/>
                        <c:set var="totalReste" value="0"/>
                        
                        <c:forEach var="reste" items="${restesAPayer}">
                            <c:set var="totalAPayer" value="${totalAPayer + reste.total_a_payer}"/>
                            <c:set var="totalPaye" value="${totalPaye + reste.total_paye}"/>
                            <c:set var="totalReste" value="${totalReste + reste.reste_a_payer}"/>
                            
                            <tr class="hover:bg-gray-50 transition-colors">
                                <td class="px-6 py-3 font-medium text-gray-900">
                                    ${reste.nom_societe}
                                </td>
                                <td class="px-6 py-3 text-gray-500">
                                    ${reste.contact != null ? reste.contact : '-'}
                                </td>
                                <td class="px-6 py-3 text-right text-gray-900">
                                    <fmt:formatNumber value="${reste.total_a_payer}" type="number" groupingUsed="true"/> Ar
                                </td>
                                <td class="px-6 py-3 text-right font-medium text-green-600">
                                    <fmt:formatNumber value="${reste.total_paye}" type="number" groupingUsed="true"/> Ar
                                </td>
                                <td class="px-6 py-3 text-right font-bold ${reste.reste_a_payer > 0 ? 'text-red-600' : 'text-green-600'}">
                                    <fmt:formatNumber value="${reste.reste_a_payer}" type="number" groupingUsed="true"/> Ar
                                </td>
                                <td class="px-6 py-3">
                                    <a href="${pageContext.request.contextPath}/paiements-publicite/societe/${reste.id_societe}" 
                                       class="text-brand-600 hover:text-brand-800 flex items-center gap-1">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-4 h-4">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z" />
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                        </svg>
                                        Détails
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        
                        <c:if test="${empty restesAPayer}">
                            <tr>
                                <td colspan="6" class="px-6 py-8 text-center text-gray-400">
                                    Aucune société n'a de reste à payer.
                                </td>
                            </tr>
                        </c:if>
                        
                        <!-- Ligne de total -->
                        <c:if test="${not empty restesAPayer}">
                            <tr class="bg-gray-50 font-bold border-t-2 border-gray-200">
                                <td colspan="2" class="px-6 py-4 text-sm text-gray-900 uppercase">
                                    Total Général
                                </td>
                                <td class="px-6 py-4 text-right text-gray-900">
                                    <fmt:formatNumber value="${totalAPayer}" type="number" groupingUsed="true"/> Ar
                                </td>
                                <td class="px-6 py-4 text-right text-green-600">
                                    <fmt:formatNumber value="${totalPaye}" type="number" groupingUsed="true"/> Ar
                                </td>
                                <td class="px-6 py-4 text-right ${totalReste > 0 ? 'text-red-600' : 'text-green-600'}">
                                    <fmt:formatNumber value="${totalReste}" type="number" groupingUsed="true"/> Ar
                                </td>
                                <td></td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Légende -->
        <div class="mt-6 bg-gray-50 rounded-lg border border-gray-200 p-4">
            <h3 class="text-sm font-medium text-gray-700 mb-2">Légende :</h3>
            <ul class="space-y-1 text-sm text-gray-600">
                <li class="flex items-center">
                    <span class="w-3 h-3 rounded-full bg-red-600 mr-2"></span>
                    <span>Montant en rouge : Société en impayé</span>
                </li>
                <li class="flex items-center">
                    <span class="w-3 h-3 rounded-full bg-green-600 mr-2"></span>
                    <span>Montant en vert : Société à jour dans ses paiements</span>
                </li>
            </ul>
        </div>

    </div>
</main>
</body>
</html>
