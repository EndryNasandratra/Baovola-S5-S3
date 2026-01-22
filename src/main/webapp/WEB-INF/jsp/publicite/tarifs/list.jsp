<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tarifs de Diffusion - Compagnie Aérienne</title>
    <jsp:include page="../../common/header.jsp"/>
</head>
<body class="bg-gray-50">
    <jsp:include page="../../common/navbar.jsp"/>
    
    <div class="main-layout">
        <div class="main-content-wrapper">
            <main class="main-content">
                <!-- En-tête -->
                <div class="bg-white shadow-sm border-b border-gray-200 px-6 py-4 mb-6">
                    <div class="flex justify-between items-center">
                        <div>
                            <h1 class="text-2xl font-bold text-gray-900">Tarifs de Diffusion</h1>
                            <p class="text-sm text-gray-600 mt-1">Gestion de l'historique des tarifs de diffusion publicitaire</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/publicite/tarifs/new" 
                           class="px-4 py-2 bg-gradient-to-r from-yellow-600 to-yellow-500 text-white rounded hover:from-yellow-700 hover:to-yellow-600 transition-all">
                            + Nouveau Tarif
                        </a>
                    </div>
                </div>
                
                <!-- Tarif actuel -->
                <c:if test="${tarifActuel != null}">
                    <div class="bg-gradient-to-r from-green-600 to-green-500 rounded-lg shadow-lg p-6 mb-6 text-white">
                        <div class="flex justify-between items-center">
                            <div>
                                <h2 class="text-lg font-semibold mb-2">Tarif Actuel</h2>
                                <p class="text-4xl font-bold">
                                    <fmt:formatNumber value="${tarifActuel.montant}" type="number" groupingUsed="true"/> Ar
                                </p>
                                <p class="text-sm mt-2 opacity-90">
                                    En vigueur depuis le ${tarifActuel.dateDebut}
                                </p>
                            </div>
                            <div class="text-right">
                                <span class="inline-block px-4 py-2 bg-white bg-opacity-20 rounded-lg">
                                    Par diffusion
                                </span>
                            </div>
                        </div>
                    </div>
                </c:if>
                
                <!-- Tableau des tarifs -->
                <div class="bg-white rounded-lg shadow overflow-hidden">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gradient-to-r from-gray-800 to-gray-900">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">ID</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Montant</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Date Début</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Date Fin</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Description</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Statut</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <c:forEach var="tarif" items="${tarifs}">
                                <tr class="hover:bg-gray-50">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${tarif.id}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-gray-900">
                                        <fmt:formatNumber value="${tarif.montant}" type="number" groupingUsed="true"/> Ar
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${tarif.dateDebut}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                                        ${tarif.dateFin != null ? tarif.dateFin : '-'}
                                    </td>
                                    <td class="px-6 py-4 text-sm text-gray-600">${tarif.description}</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <c:choose>
                                            <c:when test="${tarif.actif}">
                                                <span class="px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">Actif</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="px-2 py-1 text-xs font-semibold rounded-full bg-gray-100 text-gray-800">Inactif</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium space-x-2">
                                        <a href="${pageContext.request.contextPath}/publicite/tarifs/${tarif.id}" 
                                           class="text-yellow-600 hover:text-yellow-900">Modifier</a>
                                        <a href="${pageContext.request.contextPath}/publicite/tarifs/${tarif.id}/delete" 
                                           class="text-red-600 hover:text-red-900"
                                           onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce tarif ?')">
                                            Supprimer
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
