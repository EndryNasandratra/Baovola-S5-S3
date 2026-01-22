<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de Bord Publicité - Compagnie Aérienne</title>
    <jsp:include page="../../common/header.jsp"/>
</head>
<body class="bg-gray-50">
    <jsp:include page="../../common/navbar.jsp"/>
    
    <div class="main-layout">
        <div class="main-content-wrapper">
            <main class="main-content">
                <!-- En-tête -->
                <div class="bg-white shadow-sm border-b border-gray-200 px-6 py-4 mb-6">
                    <h1 class="text-2xl font-bold text-gray-900">Tableau de Bord Publicité</h1>
                    <p class="text-sm text-gray-600 mt-1">Statistiques et rapports sur les diffusions publicitaires</p>
                </div>
                
                <!-- Cartes de statistiques -->
                <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">
                    <!-- Nombre total de diffusions -->
                    <div class="bg-gradient-to-br from-blue-600 to-blue-500 rounded-lg shadow-lg p-6 text-white">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-sm opacity-90 mb-2">Total Diffusions</p>
                                <p class="text-3xl font-bold">${stats.nombreTotalDiffusions}</p>
                            </div>
                            <div class="text-4xl opacity-80">📊</div>
                        </div>
                    </div>
                    
                    <!-- Nombre total de passages -->
                    <div class="bg-gradient-to-br from-purple-600 to-purple-500 rounded-lg shadow-lg p-6 text-white">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-sm opacity-90 mb-2">Total Passages</p>
                                <p class="text-3xl font-bold">${stats.nombreTotalPassages}</p>
                            </div>
                            <div class="text-4xl opacity-80">🎬</div>
                        </div>
                    </div>
                    
                    <!-- CA Total -->
                    <div class="bg-gradient-to-br from-green-600 to-green-500 rounded-lg shadow-lg p-6 text-white">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-sm opacity-90 mb-2">Chiffre d'Affaires Total</p>
                                <p class="text-2xl font-bold">
                                    <fmt:formatNumber value="${stats.caTotal}" type="number" groupingUsed="true"/> Ar
                                </p>
                            </div>
                            <div class="text-4xl opacity-80">💰</div>
                        </div>
                    </div>
                </div>
                
                <!-- Liens vers les rapports -->
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <!-- CA par Société -->
                    <div class="bg-white rounded-lg shadow-md overflow-hidden">
                        <div class="bg-gradient-to-r from-yellow-600 to-yellow-500 px-6 py-4">
                            <h2 class="text-xl font-bold text-white">CA par Société/Mois</h2>
                        </div>
                        <div class="p-6">
                            <p class="text-gray-600 mb-4">
                                Consultez le chiffre d'affaires généré par chaque société annonceur par mois
                            </p>
                            <a href="${pageContext.request.contextPath}/publicite/rapports/ca-par-societe" 
                               class="inline-block px-4 py-2 bg-yellow-600 text-white rounded hover:bg-yellow-700">
                                Voir le rapport →
                            </a>
                        </div>
                    </div>
                    
                    <!-- Autres rapports (à venir) -->
                    <div class="bg-white rounded-lg shadow-md overflow-hidden">
                        <div class="bg-gradient-to-r from-gray-800 to-gray-900 px-6 py-4">
                            <h2 class="text-xl font-bold text-yellow-400">Rapports Avancés</h2>
                        </div>
                        <div class="p-6">
                            <ul class="space-y-2 text-gray-600">
                                <li>✅ CA par société et mois</li>
                                <li>🔜 CA par vidéo</li>
                                <li>🔜 CA par vol</li>
                                <li>🔜 Statistiques détaillées</li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- Accès rapide -->
                <div class="mt-6 bg-white rounded-lg shadow-md p-6">
                    <h2 class="text-xl font-bold text-gray-900 mb-4">Accès Rapide</h2>
                    <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                        <a href="${pageContext.request.contextPath}/publicite/societes" 
                           class="block p-4 border-2 border-gray-200 rounded-lg hover:border-yellow-500 hover:bg-yellow-50 transition-all text-center">
                            <div class="text-3xl mb-2">🏢</div>
                            <p class="text-sm font-medium text-gray-900">Sociétés</p>
                        </a>
                        <a href="${pageContext.request.contextPath}/publicite/videos" 
                           class="block p-4 border-2 border-gray-200 rounded-lg hover:border-yellow-500 hover:bg-yellow-50 transition-all text-center">
                            <div class="text-3xl mb-2">🎥</div>
                            <p class="text-sm font-medium text-gray-900">Vidéos</p>
                        </a>
                        <a href="${pageContext.request.contextPath}/publicite/diffusions" 
                           class="block p-4 border-2 border-gray-200 rounded-lg hover:border-yellow-500 hover:bg-yellow-50 transition-all text-center">
                            <div class="text-3xl mb-2">📺</div>
                            <p class="text-sm font-medium text-gray-900">Diffusions</p>
                        </a>
                        <a href="${pageContext.request.contextPath}/publicite/tarifs" 
                           class="block p-4 border-2 border-gray-200 rounded-lg hover:border-yellow-500 hover:bg-yellow-50 transition-all text-center">
                            <div class="text-3xl mb-2">💵</div>
                            <p class="text-sm font-medium text-gray-900">Tarifs</p>
                        </a>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
