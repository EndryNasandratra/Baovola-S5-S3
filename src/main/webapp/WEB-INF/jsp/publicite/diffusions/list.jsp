<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diffusions Publicitaires - Compagnie Aérienne</title>
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
                            <h1 class="text-2xl font-bold text-gray-900">Diffusions Publicitaires</h1>
                            <p class="text-sm text-gray-600 mt-1">Gestion des diffusions de publicité dans les vols</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/publicite/diffusions/new" 
                           class="px-4 py-2 bg-gradient-to-r from-yellow-600 to-yellow-500 text-white rounded hover:from-yellow-700 hover:to-yellow-600 transition-all">
                            + Nouvelle Diffusion
                        </a>
                    </div>
                </div>
                
                <!-- Tableau des diffusions -->
                <div class="bg-white rounded-lg shadow overflow-hidden">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gradient-to-r from-gray-800 to-gray-900">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">ID</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Vidéo</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Société</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Vol</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Nb Diffusions</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Coût Unit.</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Coût Total</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Date</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-yellow-400 uppercase tracking-wider">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            <c:forEach var="diffusion" items="${diffusions}">
                                <tr class="hover:bg-gray-50">
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900">${diffusion.id}</td>
                                    <td class="px-6 py-4 text-sm font-medium text-gray-900">${diffusion.video.titre}</td>
                                    <td class="px-6 py-4 text-sm text-gray-600">${diffusion.video.societe.nom}</td>
                                    <td class="px-6 py-4 text-sm text-gray-600">Vol #${diffusion.volProgrammation.id}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 font-semibold">${diffusion.nombreDiffusions}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">
                                        <fmt:formatNumber value="${diffusion.coutUnitaire}" type="number" groupingUsed="true"/> Ar
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-bold text-green-600">
                                        <fmt:formatNumber value="${diffusion.coutTotal}" type="number" groupingUsed="true"/> Ar
                                    </td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-600">${diffusion.dateDiffusion}</td>
                                    <td class="px-6 py-4 whitespace-nowrap text-sm font-medium space-x-2">
                                        <a href="${pageContext.request.contextPath}/publicite/diffusions/${diffusion.id}" 
                                           class="text-yellow-600 hover:text-yellow-900">Modifier</a>
                                        <a href="${pageContext.request.contextPath}/publicite/diffusions/${diffusion.id}/delete" 
                                           class="text-red-600 hover:text-red-900"
                                           onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette diffusion ?')">
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
