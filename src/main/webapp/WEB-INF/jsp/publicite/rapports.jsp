<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Rapports Publicité - CA Payé</title>
    <jsp:include page="../common/header.jsp"/>
</head>
<body class="bg-gray-50 min-h-screen">
    <jsp:include page="../common/navbar.jsp"/>
    
    <div class="main-content-wrapper">
        <div class="main-content">
            <!-- En-tête -->
            <div class="bg-white shadow-sm border-b border-gray-200 px-6 py-4 mb-6 rounded-lg">
                <h1 class="text-2xl font-bold text-gray-900">Rapports Publicité</h1>
                <p class="text-sm text-gray-600 mt-1">Chiffre d'affaires basé sur les paiements reçus</p>
            </div>

            <!-- Statistiques globales -->
            <c:set var="caTotal" value="0"/>
            <c:set var="totalAPayer" value="0"/>
            <c:set var="totalImpaye" value="0"/>
            <c:forEach var="info" items="${restesAPayer}">
                <c:set var="caTotal" value="${caTotal + info.total_paye}"/>
                <c:set var="totalAPayer" value="${totalAPayer + info.total_a_payer}"/>
                <c:set var="totalImpaye" value="${totalImpaye + info.reste_a_payer}"/>
            </c:forEach>

            <div class="grid grid-cols-1 md:grid-cols-4 gap-6 mb-8">
                <div class="bg-white rounded-lg p-6 shadow-sm border border-yellow-400">
                    <div class="text-gray-600 text-sm mb-2">💰 CA Payé (Encaissé)</div>
                    <div class="text-3xl font-bold text-yellow-600">
                        <fmt:formatNumber value="${caTotal}" type="number" groupingUsed="true"/> Ar
                    </div>
                    <div class="text-xs text-gray-500 mt-2">Montants effectivement reçus</div>
                </div>
                
                <div class="bg-white rounded-lg p-6 shadow-sm border border-gray-200">
                    <div class="text-gray-600 text-sm mb-2">📊 Total Facturé</div>
                    <div class="text-3xl font-bold text-gray-900">
                        <fmt:formatNumber value="${totalAPayer}" type="number" groupingUsed="true"/> Ar
                    </div>
                    <div class="text-xs text-gray-500 mt-2">Total des diffusions</div>
                </div>
                
                <div class="bg-white rounded-lg p-6 shadow-sm border border-gray-200">
                    <div class="text-gray-600 text-sm mb-2">⏳ Impayé</div>
                    <div class="text-3xl font-bold text-gray-700">
                        <fmt:formatNumber value="${totalImpaye}" type="number" groupingUsed="true"/> Ar
                    </div>
                    <div class="text-xs text-gray-500 mt-2">Reste à encaisser</div>
                </div>
                
                <div class="bg-white rounded-lg p-6 shadow-sm border border-yellow-400">
                    <div class="text-gray-600 text-sm mb-2">📈 Taux de Recouvrement</div>
                    <div class="text-3xl font-bold text-yellow-600">
                        <c:choose>
                            <c:when test="${totalAPayer > 0}">
                                <fmt:formatNumber value="${(caTotal / totalAPayer) * 100}" maxFractionDigits="1"/>%
                            </c:when>
                            <c:otherwise>0%</c:otherwise>
                        </c:choose>
                    </div>
                    <div class="text-xs text-gray-500 mt-2">Paiements / Facturé</div>
                </div>
            </div>

            <!-- Section Navigation -->
            <div class="flex flex-wrap gap-4 mb-6">
                <a href="${pageContext.request.contextPath}/paiements-publicite" 
                   class="px-4 py-2 bg-gradient-to-r from-yellow-600 to-yellow-500 text-white rounded hover:from-yellow-700 hover:to-yellow-600 transition-all font-semibold">
                    💳 Voir les Paiements
                </a>
                <a href="${pageContext.request.contextPath}/paiements-publicite/reste-a-payer" 
                   class="px-4 py-2 bg-gray-800 text-yellow-400 rounded hover:bg-gray-900 transition-all font-semibold">
                    📋 Reste à Payer
                </a>
            </div>

            <!-- CA Payé par Société -->
            <div class="bg-white rounded-lg shadow overflow-hidden mb-8">
                <div class="px-6 py-4 bg-gradient-to-r from-gray-800 to-gray-900 border-b border-gray-200">
                    <h2 class="text-xl font-bold text-yellow-400">CA Payé par Société</h2>
                    <p class="text-sm text-gray-300 mt-1">Montants effectivement encaissés par société</p>
                </div>
                
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gradient-to-r from-gray-800 to-gray-900">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Société</th>
                                <th class="px-6 py-3 text-right text-xs font-medium text-yellow-400 uppercase tracking-wider">Total Facturé</th>
                                <th class="px-6 py-3 text-right text-xs font-medium text-yellow-400 uppercase tracking-wider">CA Payé</th>
                                <th class="px-6 py-3 text-right text-xs font-medium text-yellow-400 uppercase tracking-wider">Impayé</th>
                                <th class="px-6 py-3 text-right text-xs font-medium text-yellow-400 uppercase tracking-wider">Taux Paiement</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Statut</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <c:forEach var="info" items="${restesAPayer}">
                                <c:set var="tauxPaiement" value="${(info.total_paye / info.total_a_payer) * 100}"/>
                                <tr class="hover:bg-gray-50 transition-colors">
                                    <td class="px-6 py-4 text-sm">
                                        <div class="font-medium text-gray-900">${info.nom_societe}</div>
                                        <div class="text-xs text-gray-500">${info.contact != null ? info.contact : ''}</div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-right text-gray-600">
                                        <fmt:formatNumber value="${info.total_a_payer}" type="number" groupingUsed="true"/> Ar
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-right">
                                        <div class="font-bold text-yellow-600 text-lg">
                                            <fmt:formatNumber value="${info.total_paye}" type="number" groupingUsed="true"/> Ar
                                        </div>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-right font-semibold text-gray-700">
                                        <fmt:formatNumber value="${info.reste_a_payer}" type="number" groupingUsed="true"/> Ar
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-right font-bold text-yellow-600">
                                        <fmt:formatNumber value="${tauxPaiement}" maxFractionDigits="1"/>%
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm">
                                        <c:choose>
                                            <c:when test="${info.reste_a_payer <= 0}">
                                                <span class="px-3 py-1 bg-yellow-100 text-yellow-800 rounded-full text-xs font-semibold">
                                                    ✓ Payé
                                                </span>
                                            </c:when>
                                            <c:when test="${tauxPaiement >= 50}">
                                                <span class="px-3 py-1 bg-gray-200 text-gray-800 rounded-full text-xs font-semibold">
                                                    ⏳ Partiel
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="px-3 py-1 bg-gray-100 text-gray-600 rounded-full text-xs font-semibold border border-gray-300">
                                                    ○ Impayé
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty restesAPayer}">
                                <tr>
                                    <td colspan="6" class="px-6 py-8 text-center text-gray-500">
                                        Aucune donnée disponible.
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Informations importantes -->
            <div class="bg-white border border-yellow-300 rounded-lg p-6 shadow-sm">
                <div class="flex">
                    <div class="flex-shrink-0">
                        <svg class="h-6 w-6 text-yellow-600" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                    </div>
                    <div class="ml-3">
                        <h3 class="text-sm font-medium text-yellow-700">À propos du CA Payé</h3>
                        <div class="mt-2 text-sm text-gray-600">
                            <p><strong class="text-gray-900">Le CA affiché ici représente uniquement les montants effectivement payés et encaissés.</strong></p>
                            <ul class="list-disc list-inside mt-2 space-y-1">
                                <li>Le "Total Facturé" correspond au coût total des diffusions publicitaires réalisées</li>
                                <li>Le "CA Payé" représente les paiements effectivement reçus</li>
                                <li>L'"Impayé" est la différence entre le facturé et le payé</li>
                                <li>Seuls les montants dans "CA Payé" constituent le chiffre d'affaires réel</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
