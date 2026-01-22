<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${isEdit ? 'Modifier' : 'Créer'} Vidéo - Compagnie Aérienne</title>
    <jsp:include page="../../common/header.jsp"/>
</head>
<body class="bg-gray-50">
    <jsp:include page="../../common/navbar.jsp"/>
    
    <div class="main-layout">
        <div class="main-content-wrapper">
            <main class="main-content">
                <!-- En-tête -->
                <div class="bg-white shadow-sm border-b border-gray-200 px-6 py-4 mb-6">
                    <h1 class="text-2xl font-bold text-gray-900">
                        ${isEdit ? 'Modifier la Vidéo' : 'Créer une Nouvelle Vidéo'}
                    </h1>
                </div>
                
                <!-- Formulaire -->
                <div class="max-w-3xl mx-auto">
                    <div class="bg-white rounded-lg shadow-md p-6">
                        <form method="POST" action="${pageContext.request.contextPath}/publicite/videos">
                            <c:if test="${isEdit}">
                                <input type="hidden" name="id" value="${video.id}">
                                <input type="hidden" name="societeId" value="${video.societe.id}">
                            </c:if>
                            
                            <div class="space-y-4">
                                <!-- Société -->
                                <c:if test="${!isEdit}">
                                    <div>
                                        <label for="societeId" class="block text-sm font-medium text-gray-700">Société *</label>
                                        <select id="societeId" name="societeId" required
                                                class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                            <option value="">Sélectionnez une société</option>
                                            <c:forEach var="societe" items="${societes}">
                                                <option value="${societe.id}">${societe.nom}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </c:if>
                                
                                <c:if test="${isEdit}">
                                    <div>
                                        <label class="block text-sm font-medium text-gray-700">Société</label>
                                        <p class="mt-1 text-sm text-gray-900">${video.societe.nom}</p>
                                    </div>
                                </c:if>
                                
                                <!-- Titre -->
                                <div>
                                    <label for="titre" class="block text-sm font-medium text-gray-700">Titre de la Vidéo *</label>
                                    <input type="text" id="titre" name="titre" value="${video.titre}" required
                                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                </div>
                                
                                <!-- Description -->
                                <div>
                                    <label for="description" class="block text-sm font-medium text-gray-700">Description</label>
                                    <textarea id="description" name="description" rows="4"
                                              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">${video.description}</textarea>
                                </div>
                                
                                <!-- Durée -->
                                <div>
                                    <label for="duree" class="block text-sm font-medium text-gray-700">Durée (en secondes) *</label>
                                    <input type="number" id="duree" name="duree" value="${video.duree}" required min="1"
                                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                </div>
                                
                                <!-- URL Vidéo -->
                                <div>
                                    <label for="urlVideo" class="block text-sm font-medium text-gray-700">URL de la Vidéo</label>
                                    <input type="url" id="urlVideo" name="urlVideo" value="${video.urlVideo}"
                                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                </div>
                                
                                <!-- Actif -->
                                <div class="flex items-center">
                                    <input type="checkbox" id="actif" name="actif" ${video.actif || !isEdit ? 'checked' : ''}
                                           class="h-4 w-4 text-yellow-600 focus:ring-yellow-500 border-gray-300 rounded">
                                    <label for="actif" class="ml-2 block text-sm text-gray-900">Vidéo active</label>
                                </div>
                            </div>
                            
                            <!-- Boutons -->
                            <div class="mt-6 flex justify-end space-x-3">
                                <a href="${pageContext.request.contextPath}/publicite/videos" 
                                   class="px-4 py-2 border border-gray-300 rounded-md text-gray-700 hover:bg-gray-50">
                                    Annuler
                                </a>
                                <button type="submit" 
                                        class="px-4 py-2 bg-gradient-to-r from-yellow-600 to-yellow-500 text-white rounded-md hover:from-yellow-700 hover:to-yellow-600">
                                    ${isEdit ? 'Modifier' : 'Créer'}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
