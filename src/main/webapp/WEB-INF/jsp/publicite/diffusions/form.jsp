<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${isEdit ? 'Modifier' : 'Créer'} Diffusion - Compagnie Aérienne</title>
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
                        ${isEdit ? 'Modifier la Diffusion' : 'Créer une Nouvelle Diffusion'}
                    </h1>
                </div>
                
                <!-- Formulaire -->
                <div class="max-w-3xl mx-auto">
                    <div class="bg-white rounded-lg shadow-md p-6">
                        <form method="POST" action="${pageContext.request.contextPath}/publicite/diffusions">
                            <c:if test="${isEdit}">
                                <input type="hidden" name="id" value="${diffusion.id}">
                            </c:if>
                            
                            <div class="space-y-4">
                                <!-- Vidéo -->
                                <div>
                                    <label for="videoId" class="block text-sm font-medium text-gray-700">Vidéo Publicitaire *</label>
                                    <select id="videoId" name="videoId" required
                                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                        <option value="">Sélectionnez une vidéo</option>
                                        <c:forEach var="video" items="${videos}">
                                            <option value="${video.id}" ${video.id == diffusion.video.id ? 'selected' : ''}>
                                                ${video.titre} - ${video.societe.nom}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                <!-- Vol -->
                                <div>
                                    <label for="volProgrammationId" class="block text-sm font-medium text-gray-700">Vol Programmé *</label>
                                    <select id="volProgrammationId" name="volProgrammationId" required
                                            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                        <option value="">Sélectionnez un vol</option>
                                        <c:forEach var="vol" items="${vols}">
                                            <option value="${vol.id}" ${vol.id == diffusion.volProgrammation.id ? 'selected' : ''}>
                                                Vol #${vol.id} - ${vol.vol.aeroportDepart.nom} → ${vol.vol.aeroportArrivee.nom} - ${vol.dateHeure}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>
                                
                                <!-- Nombre de diffusions -->
                                <div>
                                    <label for="nombreDiffusions" class="block text-sm font-medium text-gray-700">Nombre de Diffusions *</label>
                                    <input type="number" id="nombreDiffusions" name="nombreDiffusions" 
                                           value="${diffusion.nombreDiffusions != null ? diffusion.nombreDiffusions : 1}" 
                                           required min="1"
                                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                    <p class="mt-1 text-sm text-gray-500">Nombre de fois que la publicité sera diffusée durant le vol</p>
                                </div>
                                
                                <!-- Coût unitaire -->
                                <div>
                                    <label for="coutUnitaire" class="block text-sm font-medium text-gray-700">Coût Unitaire (Ar) *</label>
                                    <input type="number" id="coutUnitaire" name="coutUnitaire" 
                                           value="${diffusion.coutUnitaire != null ? diffusion.coutUnitaire : tarifActuel}" 
                                           required min="0" step="0.01"
                                           class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">
                                    <p class="mt-1 text-sm text-gray-500">
                                        Tarif actuel: <fmt:formatNumber value="${tarifActuel}" type="number" groupingUsed="true"/> Ar
                                    </p>
                                </div>
                                
                                <!-- Notes -->
                                <div>
                                    <label for="notes" class="block text-sm font-medium text-gray-700">Notes</label>
                                    <textarea id="notes" name="notes" rows="3"
                                              class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:border-yellow-500 focus:ring-yellow-500">${diffusion.notes}</textarea>
                                </div>
                                
                                <!-- Calcul automatique du coût total -->
                                <div class="bg-yellow-50 border border-yellow-200 rounded-lg p-4">
                                    <p class="text-sm font-medium text-gray-700 mb-2">Aperçu du coût total</p>
                                    <p class="text-2xl font-bold text-gray-900" id="coutTotalPreview">0 Ar</p>
                                    <p class="text-xs text-gray-600 mt-1">Coût unitaire × Nombre de diffusions</p>
                                </div>
                            </div>
                            
                            <!-- Boutons -->
                            <div class="mt-6 flex justify-end space-x-3">
                                <a href="${pageContext.request.contextPath}/publicite/diffusions" 
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
    
    <script>
        // Calcul automatique du coût total
        function updateCoutTotal() {
            const nombreDiffusions = parseFloat(document.getElementById('nombreDiffusions').value) || 0;
            const coutUnitaire = parseFloat(document.getElementById('coutUnitaire').value) || 0;
            const coutTotal = nombreDiffusions * coutUnitaire;
            document.getElementById('coutTotalPreview').textContent = 
                coutTotal.toLocaleString('fr-FR') + ' Ar';
        }
        
        document.getElementById('nombreDiffusions').addEventListener('input', updateCoutTotal);
        document.getElementById('coutUnitaire').addEventListener('input', updateCoutTotal);
        
        // Calcul initial
        updateCoutTotal();
    </script>
</body>
</html>
