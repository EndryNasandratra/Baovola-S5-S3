<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="w-64 bg-gray-50 border-r border-gray-200 hidden md:flex flex-col h-screen fixed inset-y-0 left-0 z-10">
    <!-- Logo Area -->
    <div class="h-16 flex items-center px-6 border-b border-gray-200 bg-white">
        <div class="flex items-center gap-2 font-semibold text-gray-800 text-lg">
            <div class="w-8 h-8 bg-brand-600 rounded-md flex items-center justify-center text-white">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 13.5l10.5-11.25L12 10.5h8.25L9.75 21.75 12 13.5H3.75z" />
                </svg>
            </div>
            <span>EMIRATES </span>
        </div>
    </div>

    <!-- Scrollable Navigation -->
    <nav class="flex-1 overflow-y-auto py-4 px-3 space-y-1">
        <!-- Section: Core -->
        <div class="px-3 mb-2 text-xs font-semibold text-gray-400 uppercase tracking-wider">
            Tableau de Bord
        </div>
        <% String activePage = (String) request.getAttribute("activePage"); %>
        
        <a href="/" class="flex items-center gap-3 px-3 py-2 text-sm font-medium rounded-md group transition-all duration-200 <%= "home".equals(activePage) ? "bg-white text-brand-600 shadow-sm ring-1 ring-gray-900/5" : "text-gray-600 hover:bg-gray-100 hover:text-gray-900" %>">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 transition-colors <%= "home".equals(activePage) ? "text-brand-500" : "text-gray-400 group-hover:text-gray-500" %>">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z" />
            </svg>
            Accueil
        </a>

        <!-- Section: Operations -->
        <div class="px-3 mt-6 mb-2 text-xs font-semibold text-gray-400 uppercase tracking-wider">
            Opérations
        </div>
        
        <a href="/vols" class="flex items-center gap-3 px-3 py-2 text-sm font-medium rounded-md group transition-all duration-200 <%= "vols".equals(activePage) ? "bg-white text-brand-600 shadow-sm ring-1 ring-gray-900/5" : "text-gray-600 hover:bg-gray-100 hover:text-gray-900" %>">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 transition-colors <%= "vols".equals(activePage) ? "text-brand-500" : "text-gray-400 group-hover:text-gray-500" %>">
                <path stroke-linecap="round" stroke-linejoin="round" d="M6 12L3.269 3.126A59.768 59.768 0 0121.485 12 59.77 59.77 0 013.27 20.876L5.999 12zm0 0h7.5" />
            </svg>
            Vols
        </a>

        <a href="/vol-programmation" class="flex items-center gap-3 px-3 py-2 text-sm font-medium rounded-md group transition-all duration-200 <%= "programmation".equals(activePage) ? "bg-white text-brand-600 shadow-sm ring-1 ring-gray-900/5" : "text-gray-600 hover:bg-gray-100 hover:text-gray-900" %>">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 transition-colors <%= "programmation".equals(activePage) ? "text-brand-500" : "text-gray-400 group-hover:text-gray-500" %>">
                <path stroke-linecap="round" stroke-linejoin="round" d="M6.75 3v2.25M17.25 3v2.25M3 18.75V7.5a2.25 2.25 0 012.25-2.25h13.5A2.25 2.25 0 0121 7.5v11.25m-18 0A2.25 2.25 0 005.25 21h13.5A2.25 2.25 0 0021 18.75m-18 0v-7.5A2.25 2.25 0 015.25 9h13.5A2.25 2.25 0 0121 11.25v7.5" />
            </svg>
            Programmations
        </a>

        <a href="/reservations" class="flex items-center gap-3 px-3 py-2 text-sm font-medium rounded-md group transition-all duration-200 <%= "reservations".equals(activePage) ? "bg-white text-brand-600 shadow-sm ring-1 ring-gray-900/5" : "text-gray-600 hover:bg-gray-100 hover:text-gray-900" %>">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 transition-colors <%= "reservations".equals(activePage) ? "text-brand-500" : "text-gray-400 group-hover:text-gray-500" %>">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 12h3.75M9 15h3.75M9 18h3.75m3 .75H18a2.25 2.25 0 002.25-2.25V6.108c0-1.135-.845-2.098-1.976-2.192a48.424 48.424 0 00-1.123-.08m-5.801 0c-.065.21-.1.433-.1.664 0 .414.336.75.75.75h4.5a.75.75 0 00.75-.75 2.25 2.25 0 00-.1-.664m-5.8 0A2.251 2.251 0 0113.5 2.25H15c1.012 0 1.867.668 2.15 1.586m-5.8 0c-.376.023-.75.05-1.124.08C9.095 4.01 8.25 4.973 8.25 6.108V8.25m0 0H4.875c-.621 0-1.125.504-1.125 1.125v11.25c0 .621.504 1.125 1.125 1.125h9.75c.621 0 1.125-.504 1.125-1.125V9.375c0-.621-.504-1.125-1.125-1.125H8.25zM6.75 12h.008v.008H6.75V12zm0 3h.008v.008H6.75V15zm0 3h.008v.008H6.75V18z" />
            </svg>
            Réservations
        </a>

        <!-- Section: Settings -->
        <div class="px-3 mt-6 mb-2 text-xs font-semibold text-gray-400 uppercase tracking-wider">
            Paramètres
        </div>

        <a href="/aeroports" class="flex items-center gap-3 px-3 py-2 text-sm font-medium rounded-md group transition-all duration-200 <%= "aeroports".equals(activePage) ? "bg-white text-brand-600 shadow-sm ring-1 ring-gray-900/5" : "text-gray-600 hover:bg-gray-100 hover:text-gray-900" %>">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 transition-colors <%= "aeroports".equals(activePage) ? "text-brand-500" : "text-gray-400 group-hover:text-gray-500" %>">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 11-6 0 3 3 0 016 0z" />
                <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1115 0z" />
            </svg>
            Aéroports
        </a>

        <a href="/avions" class="flex items-center gap-3 px-3 py-2 text-sm font-medium rounded-md group transition-all duration-200 <%= "avions".equals(activePage) ? "bg-white text-brand-600 shadow-sm ring-1 ring-gray-900/5" : "text-gray-600 hover:bg-gray-100 hover:text-gray-900" %>">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 transition-colors <%= "avions".equals(activePage) ? "text-brand-500" : "text-gray-400 group-hover:text-gray-500" %>">
                <path stroke-linecap="round" stroke-linejoin="round" d="M6 12L3.269 3.126A59.768 59.768 0 0121.485 12 59.77 59.77 0 013.27 20.876L5.999 12zm0 0h7.5" />
            </svg>
            Avions
        </a>

        <a href="/avions/classes-places" class="flex items-center gap-3 px-3 py-2 text-sm font-medium rounded-md group transition-all duration-200 <%= "classes-places".equals(activePage) ? "bg-white text-brand-600 shadow-sm ring-1 ring-gray-900/5" : "text-gray-600 hover:bg-gray-100 hover:text-gray-900" %>">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 transition-colors <%= "classes-places".equals(activePage) ? "text-brand-500" : "text-gray-400 group-hover:text-gray-500" %>">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25a2.25 2.25 0 01-2.25-2.25v-2.25z" />
            </svg>
            Classes de Places
        </a>

        <a href="/statuts-vol" class="flex items-center gap-3 px-3 py-2 text-sm font-medium rounded-md group transition-all duration-200 <%= "statuts-vol".equals(activePage) ? "bg-white text-brand-600 shadow-sm ring-1 ring-gray-900/5" : "text-gray-600 hover:bg-gray-100 hover:text-gray-900" %>">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 transition-colors <%= "statuts-vol".equals(activePage) ? "text-brand-500" : "text-gray-400 group-hover:text-gray-500" %>">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
            </svg>
            Statuts de Vol
        </a>

        <a href="/classes" class="flex items-center gap-3 px-3 py-2 text-sm font-medium rounded-md group transition-all duration-200 <%= "classes".equals(activePage) ? "bg-white text-brand-600 shadow-sm ring-1 ring-gray-900/5" : "text-gray-600 hover:bg-gray-100 hover:text-gray-900" %>">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 transition-colors <%= "classes".equals(activePage) ? "text-brand-500" : "text-gray-400 group-hover:text-gray-500" %>">
                <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6A2.25 2.25 0 016 3.75h2.25A2.25 2.25 0 0110.5 6v2.25a2.25 2.25 0 01-2.25 2.25H6a2.25 2.25 0 01-2.25-2.25V6zM3.75 15.75A2.25 2.25 0 016 13.5h2.25a2.25 2.25 0 012.25 2.25V18a2.25 2.25 0 01-2.25 2.25H6A2.25 2.25 0 013.75 18v-2.25zM13.5 6a2.25 2.25 0 012.25-2.25H18A2.25 2.25 0 0120.25 6v2.25A2.25 2.25 0 0118 10.5h-2.25a2.25 2.25 0 01-2.25-2.25V6zM13.5 15.75a2.25 2.25 0 012.25-2.25H18a2.25 2.25 0 012.25 2.25V18A2.25 2.25 0 0118 20.25h-2.25A2.25 2.25 0 0113.5 18v-2.25z" />
            </svg>
            Classes
        </a>

        <a href="/type-passager" class="flex items-center gap-3 px-3 py-2 text-sm font-medium rounded-md group transition-all duration-200 <%= "type-passager".equals(activePage) ? "bg-white text-brand-600 shadow-sm ring-1 ring-gray-900/5" : "text-gray-600 hover:bg-gray-100 hover:text-gray-900" %>">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 transition-colors <%= "type-passager".equals(activePage) ? "text-brand-500" : "text-gray-400 group-hover:text-gray-500" %>">
                <path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0zM4.501 20.118a7.5 7.5 0 0114.998 0A17.933 17.933 0 0112 21.75c-2.676 0-5.216-.584-7.499-1.632z" />
            </svg>
            Types de Passager
        </a>

        <a href="#" class="flex items-center gap-3 px-3 py-2 text-sm font-medium text-gray-600 rounded-md hover:bg-gray-100 hover:text-gray-900 group">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-5 h-5 text-gray-400 group-hover:text-gray-500">
                <path stroke-linecap="round" stroke-linejoin="round" d="M11.42 15.17L17.25 21A2.652 2.652 0 0021 17.25l-5.877-5.877M11.425 15.17V8.625c0-1.78-1.442-3.223-3.223-3.223h3.224m0 0h.01m-6.845 0a3.224 3.224 0 00-3.222 3.223v6.52" />
            </svg>
            Maintenance
        </a>
    </nav>
    
    <!-- User Footer -->
    <div class="border-t border-gray-200 p-4">
        <div class="flex items-center gap-3">
            <div class="w-9 h-9 rounded-full bg-gray-200 flex items-center justify-center text-gray-500 font-bold">
                A
            </div>
            <div class="flex-1 min-w-0">
                <p class="text-sm font-medium text-gray-900 truncate">Admin User</p>
                <p class="text-xs text-gray-500 truncate">admin@esky.com</p>
            </div>
        </div>
    </div>
</aside>
