<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sociétés Annonceurs - Compagnie Aérienne</title>
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
                            <h1 class="text-2xl font-bold text-gray-900">Sociétés Annonceurs</h1>
                            <p class="text-sm text-gray-600 mt-1">Gestion des sociétés annonceurs</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/publicite/societes/new" 
                           class="px-4 py-2 bg-gradient-to-r from-yellow-600 to-yellow-500 text-white rounded hover:from-yellow-700 hover:to-yellow-600 transition-all">
                            + Nouvelle Société
                        </a>
                    </div>
                </div>
                
                <!-- Tableau des sociétés -->
                <div class="bg-white rounded-lg shadow overflow-hidden">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gradient-to-r from-gray-800 to-gray-900">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">ID</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Nom</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Contact</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Email</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Téléphone</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Statut</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <c:forEach var="societe" items="${societes}">
                                <tr class="hover:bg-gray-50">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${societe.id}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">${societe.nom}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${societe.contactNom}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${societe.email}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${societe.telephone}</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <c:choose>
                                            <c:when test="${societe.actif}">
                                                <span class="px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">Actif</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="px-2 py-1 text-xs font-semibold rounded-full bg-red-100 text-red-800">Inactif</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium space-x-2">
                                        <a href="${pageContext.request.contextPath}/publicite/societes/${societe.id}" 
                                           class="text-yellow-600 hover:text-yellow-900">Modifier</a>
                                        <a href="${pageContext.request.contextPath}/publicite/societes/${societe.id}/toggle" 
                                           class="text-blue-600 hover:text-blue-900">
                                            ${societe.actif ? 'Désactiver' : 'Activer'}
                                        </a>
                                        <a href="${pageContext.request.contextPath}/publicite/societes/${societe.id}/delete" 
                                           class="text-red-600 hover:text-red-900"
                                           onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette société ?')">
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
