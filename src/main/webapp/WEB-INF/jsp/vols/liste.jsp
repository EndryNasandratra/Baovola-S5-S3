<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../common/header.jsp" />

<!-- Top Navbar -->
<jsp:include page="../common/navbar.jsp" />

<!-- Main Content Wrapper -->
<main class="main-content-wrapper">
    <div class="main-content">
                
                <!-- Page Header with Breadcrumb -->
                <div class="mb-8 flex flex-col gap-4 sm:flex-row sm:items-center sm:justify-between">
                    <div>
                         <h1 class="text-2xl font-bold text-gray-900 mb-2">Gestion des Vols</h1>
                        <!-- Breadcrumb -->
                        <nav class="flex" aria-label="Breadcrumb">
                            <ol class="inline-flex items-center space-x-1 md:space-x-2">
                                <li class="inline-flex items-center">
                                    <span class="inline-flex items-center text-sm font-medium text-gray-500">
                                        <svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm-1-11a1 1 0 112 0v2H11a1 1 0 110 2h-2a1 1 0 110-2h.01V7H9z" clip-rule="evenodd"></path></svg>
                                        Opérations
                                    </span>
                                </li>
                                <li>
                                    <div class="flex items-center">
                                        <svg class="w-5 h-5 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                                        <span class="ml-1 text-sm font-medium text-gray-500 md:ml-2">Vols</span>
                                    </div>
                                </li>
                            </ol>
                        </nav>
                    </div>
                    <button class="bg-brand-600 text-white px-4 py-2 rounded-md hover:bg-brand-700 shadow-sm transition-colors text-sm font-medium flex items-center gap-2">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M12 4.5v15m7.5-7.5h-15" />
                        </svg>
                        Nouveau Vol
                    </button>
                </div>

                <!-- Filters -->
                <div class="bg-white p-4 rounded-lg shadow-sm border border-gray-200 mb-6 flex flex-wrap gap-4 items-end">
                    <div>
                        <label for="filter-date" class="block text-xs font-medium text-gray-700 mb-1">Date</label>
                        <input type="date" id="filter-date" class="block w-full rounded-md border-gray-300 shadow-sm focus:border-brand-500 focus:ring-brand-500 sm:text-sm border p-2">
                    </div>
                    <div>
                        <label for="filter-status" class="block text-xs font-medium text-gray-700 mb-1">Statut</label>
                        <select id="filter-status" class="block w-full rounded-md border-gray-300 shadow-sm focus:border-brand-500 focus:ring-brand-500 sm:text-sm border p-2">
                            <option>Tous</option>
                            <option>Programmé</option>
                            <option>En Vol</option>
                            <option>Atterri</option>
                            <option>Retardé</option>
                        </select>
                    </div>
                    <button class="bg-gray-100 text-gray-700 px-4 py-2 rounded-md hover:bg-gray-200 transition-colors text-sm font-medium">
                        Filtrer
                    </button>
                </div>

                <!-- Flights Table -->
                <div class="bg-white rounded-lg shadow-sm border border-gray-200 overflow-hidden">
                     <div class="overflow-x-auto">
                        <table class="min-w-full text-left text-sm whitespace-nowrap">
                            <thead class="bg-gray-50 text-gray-900 font-semibold border-b border-gray-200">
                                <tr>
                                    <th class="px-6 py-3">Vol No.</th>
                                    <th class="px-6 py-3">Avion</th>
                                    <th class="px-6 py-3">Départ</th>
                                    <th class="px-6 py-3">Arrivée</th>
                                    <th class="px-6 py-3">Horaires</th>
                                    <th class="px-6 py-3">Statut</th>
                                    <th class="px-6 py-3">Actions</th>
                                </tr>
                            </thead>
                            <tbody class="divide-y divide-gray-100">
                                <!-- Static Item 1 -->
                                <tr class="hover:bg-gray-50 transition-colors">
                                    <td class="px-6 py-3 font-medium text-brand-600">AF-101</td>
                                    <td class="px-6 py-3">Airbus A320 (F-GKXY)</td>
                                    <td class="px-6 py-3">
                                        <div class="font-medium text-gray-900">Paris (CDG)</div>
                                    </td>
                                    <td class="px-6 py-3">
                                        <div class="font-medium text-gray-900">New York (JFK)</div>
                                    </td>
                                    <td class="px-6 py-3 text-gray-500">
                                        10:00 - 14:00
                                    </td>
                                    <td class="px-6 py-3">
                                        <span class="inline-flex items-center gap-1 rounded-full bg-green-50 px-2 py-1 text-xs font-semibold text-green-600">
                                            <span class="h-1.5 w-1.5 rounded-full bg-green-600"></span>
                                            Programmé
                                        </span>
                                    </td>
                                    <td class="px-6 py-3 text-gray-500">
                                        <button class="text-blue-600 hover:text-blue-800 mr-2">Modifier</button>
                                    </td>
                                </tr>

                                 <!-- Static Item 2 -->
                                <tr class="hover:bg-gray-50 transition-colors">
                                    <td class="px-6 py-3 font-medium text-brand-600">AF-205</td>
                                    <td class="px-6 py-3">Boeing 777 (F-GZNA)</td>
                                    <td class="px-6 py-3">
                                        <div class="font-medium text-gray-900">London (LHR)</div>
                                    </td>
                                    <td class="px-6 py-3">
                                        <div class="font-medium text-gray-900">Tokyo (HND)</div>
                                    </td>
                                    <td class="px-6 py-3 text-gray-500">
                                        18:30 - 14:45 (+1)
                                    </td>
                                    <td class="px-6 py-3">
                                        <span class="inline-flex items-center gap-1 rounded-full bg-blue-50 px-2 py-1 text-xs font-semibold text-blue-600">
                                            <span class="h-1.5 w-1.5 rounded-full bg-blue-600"></span>
                                            En Vol
                                        </span>
                                    </td>
                                    <td class="px-6 py-3 text-gray-500">
                                        <button class="text-blue-600 hover:text-blue-800 mr-2">Modifier</button>
                                    </td>
                                </tr>

                                 <!-- Static Item 3 -->
                                <tr class="hover:bg-gray-50 transition-colors">
                                    <td class="px-6 py-3 font-medium text-brand-600">AF-099</td>
                                    <td class="px-6 py-3">Boeing 737 (F-HUYI)</td>
                                    <td class="px-6 py-3">
                                        <div class="font-medium text-gray-900">Berlin (BER)</div>
                                    </td>
                                    <td class="px-6 py-3">
                                        <div class="font-medium text-gray-900">Madrid (MAD)</div>
                                    </td>
                                    <td class="px-6 py-3 text-gray-500">
                                        08:00 - 11:00
                                    </td>
                                    <td class="px-6 py-3">
                                        <span class="inline-flex items-center gap-1 rounded-full bg-yellow-50 px-2 py-1 text-xs font-semibold text-yellow-600">
                                            <span class="h-1.5 w-1.5 rounded-full bg-yellow-600"></span>
                                            Retardé
                                        </span>
                                    </td>
                                    <td class="px-6 py-3 text-gray-500">
                                        <button class="text-blue-600 hover:text-blue-800 mr-2">Modifier</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
    </div>
</main>
</body>
</html>
