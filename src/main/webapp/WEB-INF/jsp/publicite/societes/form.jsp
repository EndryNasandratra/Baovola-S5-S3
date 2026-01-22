<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${isEdit ? 'Modifier' : 'Créer'} Société - Compagnie Aérienne</title>
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
                        ${isEdit ? 'Modifier la Société' : 'Créer une Nouvelle Société'}
                    </h1>
                </div>
                
                <!-- Formulaire -->
                <div class="max-w-3xl mx-auto">
                    <div class="bg-white rounded-lg shadow-md p-6">
                        <form method="POST" action="${pageContext.request.contextPath}/publicite/societes">
                            <c:if test="${isEdit}">
                                <input type="hidden" name="id" value="${societe.id}">
                            </c:if>
                            
                            <div class="space-y-4">
                                <!-- Nom -->
                                <div>
                                    <label for="nom" class="block text-sm font-medium text-gray-700">Nom de la Société *</label>
                                    <input type="text" id="nom" name="nom" value="${societe.nom}" required
                                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                </div>
                                
                                <!-- Nom du contact -->
                                <div>
                                    <label for="contactNom" class="block text-sm font-medium text-gray-700">Nom du Contact</label>
                                    <input type="text" id="contactNom" name="contactNom" value="${societe.contactNom}"
                                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                </div>
                                
                                <!-- Email -->
                                <div>
                                    <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                                    <input type="email" id="email" name="email" value="${societe.email}"
                                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                </div>
                                
                                <!-- Téléphone -->
                                <div>
                                    <label for="telephone" class="block text-sm font-medium text-gray-700">Téléphone</label>
                                    <input type="text" id="telephone" name="telephone" value="${societe.telephone}"
                                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                </div>
                                
                                <!-- Adresse -->
                                <div>
                                    <label for="adresse" class="block text-sm font-medium text-gray-700">Adresse</label>
                                    <textarea id="adresse" name="adresse" rows="3"
                                              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">${societe.adresse}</textarea>
                                </div>
                                
                                <!-- Actif -->
                                <div class="flex items-center">
                                    <input type="checkbox" id="actif" name="actif" ${societe.actif ? 'checked' : ''}
                                           class="h-4 w-4 text-yellow-600 focus:ring-yellow-500 border-gray-300 rounded">
                                    <label for="actif" class="ml-2 block text-sm text-gray-900">Société active</label>
                                </div>
                            </div>
                            
                            <!-- Boutons -->
                            <div class="mt-6 flex justify-end space-x-3">
                                <a href="${pageContext.request.contextPath}/publicite/societes" 
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
