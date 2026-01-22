<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${isEdit ? 'Modifier' : 'Créer'} Tarif - Compagnie Aérienne</title>
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
                        ${isEdit ? 'Modifier le Tarif' : 'Créer un Nouveau Tarif'}
                    </h1>
                </div>
                
                <!-- Formulaire -->
                <div class="max-w-3xl mx-auto">
                    <div class="bg-white rounded-lg shadow-md p-6">
                        <form method="POST" action="${pageContext.request.contextPath}/publicite/tarifs">
                            <c:if test="${isEdit}">
                                <input type="hidden" name="id" value="${tarif.id}">
                            </c:if>
                            
                            <div class="space-y-4">
                                <!-- Montant -->
                                <div>
                                    <label for="montant" class="block text-sm font-medium text-gray-700">Montant (Ar) *</label>
                                    <input type="number" id="montant" name="montant" value="${tarif.montant}" 
                                           required min="0" step="0.01"
                                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                    <p class="mt-1 text-sm text-gray-500">Prix par diffusion publicitaire</p>
                                </div>
                                
                                <!-- Date de début -->
                                <div>
                                    <label for="dateDebut" class="block text-sm font-medium text-gray-700">Date de Début *</label>
                                    <input type="datetime-local" id="dateDebut" name="dateDebut" 
                                           value="${tarif.dateDebut}" required
                                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                </div>
                                
                                <!-- Date de fin -->
                                <div>
                                    <label for="dateFin" class="block text-sm font-medium text-gray-700">Date de Fin</label>
                                    <input type="datetime-local" id="dateFin" name="dateFin" 
                                           value="${tarif.dateFin}"
                                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                    <p class="mt-1 text-sm text-gray-500">Laisser vide si pas de date de fin prévue</p>
                                </div>
                                
                                <!-- Description -->
                                <div>
                                    <label for="description" class="block text-sm font-medium text-gray-700">Description</label>
                                    <textarea id="description" name="description" rows="3"
                                              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">${tarif.description}</textarea>
                                </div>
                                
                                <!-- Actif -->
                                <div class="flex items-center">
                                    <input type="checkbox" id="actif" name="actif" ${tarif.actif || !isEdit ? 'checked' : ''}
                                           class="h-4 w-4 text-yellow-600 focus:ring-yellow-500 border-gray-300 rounded">
                                    <label for="actif" class="ml-2 block text-sm text-gray-900">Tarif actif</label>
                                </div>
                                
                                <!-- Avertissement -->
                                <c:if test="${!isEdit}">
                                    <div class="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
                                        <p class="text-sm text-yellow-800">
                                            ⚠️ <strong>Note:</strong> Si ce tarif est actif, il désactivera automatiquement l'ancien tarif actuel.
                                        </p>
                                    </div>
                                </c:if>
                            </div>
                            
                            <!-- Boutons -->
                            <div class="mt-6 flex justify-end space-x-3">
                                <a href="${pageContext.request.contextPath}/publicite/tarifs" 
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
