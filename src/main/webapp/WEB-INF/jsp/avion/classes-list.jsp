<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<jsp:include page="../common/header.jsp" />

<jsp:include page="../common/navbar.jsp" />

<main class="main-content-wrapper">
    <div class="main-content">
                
                <div class="mb-8 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
                    <div>
                        <h1 class="text-2xl font-bold text-gray-900 mb-2">Gestion des Classes de Places</h1>
                        <nav class="flex" aria-label="Breadcrumb">
                            <ol class="inline-flex items-center space-x-1 md:space-x-2">
                                <li class="inline-flex items-center">
                                    <a href="/" class="inline-flex items-center text-sm font-medium text-gray-500 hover:text-brand-600">
                                        <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20"><path d="M10.707 2.293a1 1 0 00-1.414 0l-7 7a1 1 0 001.414 1.414L4 10.414V17a1 1 0 001 1h2a1 1 0 001-1v-2a1 1 0 011-1h2a1 1 0 011 1v2a1 1 0 001 1h2a1 1 0 001-1v-6.586l.293.293a1 1 0 001.414-1.414l-7-7z"></path></svg>
                                        Accueil
                                    </a>
                                </li>
                                <li>
                                    <div class="flex items-center">
                                        <svg class="w-5 h-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                                        <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Classes de Places</span>
                                    </div>
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
                    <div class="px-6 py-4 border-b border-gray-200 flex justify-between items-center">
                        <h3 class="text-lg font-medium text-gray-900">Sélectionner un Avion pour configurer ses places</h3>
                        <div class="flex items-center gap-2">
                            <form action="/avions/classes-places" method="get" class="flex gap-2">
                                <input type="text" name="search" placeholder="Rechercher matricule..." class="px-3 py-1.5 border border-gray-300 rounded-md text-sm focus:outline-none focus:ring-2 focus:ring-brand-500" value="${param.search}">
                                <button type="submit" class="bg-gray-100 text-gray-700 px-3 py-1.5 rounded-md hover:bg-gray-200 text-sm font-medium">Filtrer</button>
                            </form>
                        </div>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 p-6">
                        <c:forEach items="${avions}" var="avion">
                            <div class="bg-gray-50 rounded-xl border border-gray-200 p-6 hover:shadow-md transition-shadow">
                                <div class="flex items-start justify-between mb-4">
                                    <div class="w-12 h-12 bg-white rounded-lg border border-gray-200 flex items-center justify-center text-brand-600 shadow-sm">
                                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-6 h-6">
                                            <path stroke-linecap="round" stroke-linejoin="round" d="M6 12L3.269 3.126A59.768 59.768 0 0121.485 12 59.77 59.77 0 013.27 20.876L5.999 12zm0 0h7.5" />
                                        </svg>
                                    </div>
                                    <span class="px-2.5 py-0.5 rounded-full text-xs font-medium bg-brand-100 text-brand-800">
                                        ${avion.capacite} places
                                    </span>
                                </div>
                                <h4 class="text-lg font-bold text-gray-900 mb-1">${avion.matricule}</h4>
                                <p class="text-sm text-gray-500 mb-6">Configuration des plages de sièges par classe de billet.</p>
                                <a href="/avions/${avion.id}/places" class="block w-full text-center bg-white border border-gray-300 text-gray-700 px-4 py-2 rounded-lg text-sm font-semibold hover:bg-gray-50 transition-colors">
                                    Configurer les places
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                    <c:if test="${empty avions}">
                        <div class="text-center py-12">
                            <p class="text-gray-500">Aucun avion trouvé.</p>
                        </div>
                    </c:if>
                </div>
            </div>
    </div>
</main>
</body>
</html>
