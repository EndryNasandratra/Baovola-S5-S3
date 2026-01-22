<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CA par Société - Compagnie Aérienne</title>
    <jsp:include page="../../common/header.jsp"/>
</head>
<body class="bg-gray-50">
    <jsp:include page="../../common/navbar.jsp"/>
    
    <div class="main-layout">
        <div class="main-content-wrapper">
            <main class="main-content">
                <!-- En-tête -->
                <div class="bg-white shadow-sm border-b border-gray-200 px-6 py-4 mb-6">
                    <h1 class="text-2xl font-bold text-gray-900">Chiffre d'Affaires par Société</h1>
                    <p class="text-sm text-gray-600 mt-1">Analyse du CA généré par chaque société annonceur</p>
                </div>
                
                <!-- Filtres -->
                <div class="bg-white rounded-lg shadow-sm p-6 mb-6">
                    <form method="GET" class="flex gap-4 items-end">
                        <div>
                            <label for="annee" class="block text-sm font-medium text-gray-700 mb-1">Année</label>
                            <input type="number" id="annee" name="annee" value="${annee}" 
                                   min="2020" max="2030"
                                   class="block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                        </div>
                        <div>
                            <label for="mois" class="block text-sm font-medium text-gray-700 mb-1">Mois</label>
                            <select id="mois" name="mois" 
                                    class="block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                <option value="1" ${mois == 1 ? 'selected' : ''}>Janvier</option>
                                <option value="2" ${mois == 2 ? 'selected' : ''}>Février</option>
                                <option value="3" ${mois == 3 ? 'selected' : ''}>Mars</option>
                                <option value="4" ${mois == 4 ? 'selected' : ''}>Avril</option>
                                <option value="5" ${mois == 5 ? 'selected' : ''}>Mai</option>
                                <option value="6" ${mois == 6 ? 'selected' : ''}>Juin</option>
                                <option value="7" ${mois == 7 ? 'selected' : ''}>Juillet</option>
                                <option value="8" ${mois == 8 ? 'selected' : ''}>Août</option>
                                <option value="9" ${mois == 9 ? 'selected' : ''}>Septembre</option>
                                <option value="10" ${mois == 10 ? 'selected' : ''}>Octobre</option>
                                <option value="11" ${mois == 11 ? 'selected' : ''}>Novembre</option>
                                <option value="12" ${mois == 12 ? 'selected' : ''}>Décembre</option>
                            </select>
                        </div>
                        <button type="submit" class="px-6 py-2 bg-gradient-to-r from-yellow-600 to-yellow-500 text-white rounded hover:from-yellow-700 hover:to-yellow-600">
                            Filtrer
                        </button>
                    </form>
                </div>
                
                <!-- Total -->
                <div class="bg-gradient-to-r from-green-600 to-green-500 rounded-lg shadow-lg p-6 mb-6 text-white">
                    <div class="flex justify-between items-center">
                        <div>
                            <h2 class="text-lg font-semibold mb-2">Chiffre d'Affaires Total</h2>
                            <p class="text-4xl font-bold">
                                <fmt:formatNumber value="${caTotal}" type="number" groupingUsed="true"/> Ar
                            </p>
                            <p class="text-sm mt-2 opacity-90">
                                Pour le mois de ${mois}/${annee}
                            </p>
                        </div>
                        <div class="text-6xl opacity-80">💰</div>
                    </div>
                </div>
                
                <!-- Tableau par société -->
                <div class="bg-white rounded-lg shadow overflow-hidden">
                    <div class="px-6 py-4 bg-gradient-to-r from-gray-800 to-gray-900">
                        <h2 class="text-xl font-bold text-yellow-400">Détails par Société</h2>
                    </div>
                    
                    <c:choose>
                        <c:when test="${not empty caParSociete}">
                            <table class="min-w-full divide-y divide-gray-200">
                                <thead class="bg-gray-100">
                                    <tr>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">Société</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">Chiffre d'Affaires</th>
                                        <th class="px-6 py-3 text-left text-xs font-medium text-gray-700 uppercase tracking-wider">% du Total</th>
                                    </tr>
                                </thead>
                                <tbody class="bg-white divide-y divide-gray-200">
                                    <c:forEach var="entry" items="${caParSociete}">
                                        <tr class="hover:bg-gray-50">
                                            <td class="px-6 py-4 text-sm font-medium text-gray-900">${entry.key}</td>
                                            <td class="px-6 py-4 text-sm font-bold text-green-600">
                                                <fmt:formatNumber value="${entry.value}" type="number" groupingUsed="true"/> Ar
                                            </td>
                                            <td class="px-6 py-4 text-sm text-gray-600">
                                                <c:set var="percentage" value="${(entry.value / caTotal) * 100}" />
                                                <div class="flex items-center">
                                                    <div class="flex-1 bg-gray-200 rounded-full h-2 mr-3">
                                                        <div class="bg-yellow-600 h-2 rounded-full" 
                                                             style="width: ${percentage}%"></div>
                                                    </div>
                                                    <fmt:formatNumber value="${percentage}" pattern="#0.0" />%
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <div class="p-8 text-center text-gray-500">
                                <p class="text-lg">Aucune donnée disponible pour cette période</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
                
                <!-- Retour -->
                <div class="mt-6">
                    <a href="${pageContext.request.contextPath}/publicite/rapports" 
                       class="inline-flex items-center px-4 py-2 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50">
                        ← Retour au tableau de bord
                    </a>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
