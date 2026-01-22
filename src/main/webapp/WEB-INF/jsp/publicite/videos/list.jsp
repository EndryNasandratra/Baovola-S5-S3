<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vidéos Publicitaires - Compagnie Aérienne</title>
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
                            <h1 class="text-2xl font-bold text-gray-900">Vidéos Publicitaires</h1>
                            <p class="text-sm text-gray-600 mt-1">Gestion des vidéos publicitaires</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/publicite/videos/new" 
                           class="px-4 py-2 bg-gradient-to-r from-yellow-600 to-yellow-500 text-white rounded hover:from-yellow-700 hover:to-yellow-600 transition-all">
                            + Nouvelle Vidéo
                        </a>
                    </div>
                </div>
                
                <!-- Filtres -->
                <div class="bg-white rounded-lg shadow-sm p-4 mb-6">
                    <form method="GET" class="flex gap-4 items-end">
                        <div class="flex-1">
                            <label for="societeId" class="block text-sm font-medium text-gray-700 mb-1">Filtrer par société</label>
                            <select id="societeId" name="societeId" 
                                    class="block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                <option value="">Toutes les sociétés</option>
                                <c:forEach var="societe" items="${societes}">
                                    <option value="${societe.id}">${societe.nom}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button type="submit" class="px-4 py-2 bg-gray-800 text-yellow-400 rounded hover:bg-gray-900">
                            Filtrer
                        </button>
                    </form>
                </div>
                
                <!-- Tableau des vidéos -->
                <div class="bg-white rounded-lg shadow overflow-hidden">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gradient-to-r from-gray-800 to-gray-900">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">ID</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Titre</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Société</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Durée</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Date Création</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Statut</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <c:forEach var="video" items="${videos}">
                                <tr class="hover:bg-gray-50">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${video.id}</td>
                                    <td class="px-6 py-4 text-sm font-medium text-gray-900">${video.titre}</td>
                                    <td class="px-6 py-4 text-sm text-gray-600">${video.societe.nom}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${video.duree}s</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${video.dateCreation}</td>
                                    <td class="px-6 py-4 whitespace-nowrap">
                                        <c:choose>
                                            <c:when test="${video.actif}">
                                                <span class="px-2 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800">Actif</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="px-2 py-1 text-xs font-semibold rounded-full bg-red-100 text-red-800">Inactif</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium space-x-2">
                                        <a href="${pageContext.request.contextPath}/publicite/videos/${video.id}" 
                                           class="text-yellow-600 hover:text-yellow-900">Modifier</a>
                                        <a href="${pageContext.request.contextPath}/publicite/videos/${video.id}/toggle" 
                                           class="text-blue-600 hover:text-blue-900">
                                            ${video.actif ? 'Désactiver' : 'Activer'}
                                        </a>
                                        <a href="${pageContext.request.contextPath}/publicite/videos/${video.id}/delete" 
                                           class="text-red-600 hover:text-red-900"
                                           onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette vidéo ?')">
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
