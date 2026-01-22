<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AIRLINK  - Emirates Airline System</title>
    <!-- Google Fonts: Inter & Poppins -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <!-- Emirates Theme CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/emirates-theme.css">
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Inter', 'sans-serif'],
                        display: ['Poppins', 'sans-serif'],
                    },
                    colors: {
                        brand: {
                            50: '#fef9f3',
                            100: '#fef3e6',
                            200: '#fde8cc',
                            300: '#fcd789',
                            400: '#fac847',
                            500: '#d4a944',
                            600: '#b8860b',
                            700: '#8b6308',
                            800: '#6b4a04',
                            900: '#4a3202',
                        },
                        emirates: {
                            gold: '#d4a944',
                            darkGold: '#8b6308',
                            black: '#1a1a1a',
                            darkGray: '#2d2d2d',
                            lightGray: '#f5f5f5',
                            white: '#ffffff',
                            accent: '#00a86b',
                            red: '#dc2626',
                            blue: '#2563eb',
                        }
                    }
                }
            }
        }
    </script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body { 
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f5f5f5 0%, #e8e8e8 100%);
            color: #2d2d2d;
            min-height: 100vh;
        }
        
        h1, h2, h3, h4, h5, h6 {
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            color: #1a1a1a;
        }
        
        /* Emirates Theme Variables */
        :root {
            --emirates-gold: #d4a944;
            --emirates-dark-gold: #8b6308;
            --emirates-black: #1a1a1a;
            --emirates-dark-gray: #2d2d2d;
            --emirates-light-gray: #f5f5f5;
            --emirates-white: #ffffff;
            --emirates-accent: #00a86b;
            --emirates-red: #dc2626;
            --emirates-blue: #2563eb;
        }
        
        /* Button Styles */
        .btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            padding: 0.625rem 1.25rem;
            font-size: 0.875rem;
            font-weight: 500;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
            cursor: pointer;
            border: none;
            font-family: 'Inter', sans-serif;
            text-decoration: none;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
        }
        
        .btn-primary {
            background: linear-gradient(135deg, var(--emirates-gold) 0%, var(--emirates-dark-gold) 100%);
            color: white;
            box-shadow: 0 4px 6px rgba(212, 169, 68, 0.3);
        }
        
        .btn-primary:hover {
            background: linear-gradient(135deg, var(--emirates-dark-gold) 0%, #6b4a04 100%);
            box-shadow: 0 6px 12px rgba(212, 169, 68, 0.4);
            transform: translateY(-2px);
        }
        
        .btn-secondary {
            background: linear-gradient(135deg, #2d2d2d 0%, #1a1a1a 100%);
            color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
        }
        
        .btn-secondary:hover {
            background: linear-gradient(135deg, #1a1a1a 0%, #000000 100%);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
            transform: translateY(-2px);
        }
        
        .btn-success {
            background: linear-gradient(135deg, #00a86b 0%, #008556 100%);
            color: white;
            box-shadow: 0 4px 6px rgba(0, 168, 107, 0.3);
        }
        
        .btn-success:hover {
            background: linear-gradient(135deg, #008556 0%, #006644 100%);
            box-shadow: 0 6px 12px rgba(0, 168, 107, 0.4);
            transform: translateY(-2px);
        }
        
        .btn-danger {
            background: linear-gradient(135deg, #dc2626 0%, #b91c1c 100%);
            color: white;
            box-shadow: 0 4px 6px rgba(220, 38, 38, 0.3);
        }
        
        .btn-danger:hover {
            background: linear-gradient(135deg, #b91c1c 0%, #991b1b 100%);
            box-shadow: 0 6px 12px rgba(220, 38, 38, 0.4);
            transform: translateY(-2px);
        }
        
        .btn-info {
            background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
            color: white;
            box-shadow: 0 4px 6px rgba(37, 99, 235, 0.3);
        }
        
        .btn-info:hover {
            background: linear-gradient(135deg, #1d4ed8 0%, #1e40af 100%);
            box-shadow: 0 6px 12px rgba(37, 99, 235, 0.4);
            transform: translateY(-2px);
        }
        
        .btn-outline {
            background: transparent;
            color: var(--emirates-gold);
            border: 2px solid var(--emirates-gold);
            box-shadow: none;
        }
        
        .btn-outline:hover {
            background: var(--emirates-gold);
            color: white;
            border-color: var(--emirates-gold);
            box-shadow: 0 4px 6px rgba(212, 169, 68, 0.3);
        }
        
        .btn-sm {
            padding: 0.375rem 0.875rem;
            font-size: 0.8125rem;
        }
        
        .btn-lg {
            padding: 0.875rem 1.75rem;
            font-size: 1rem;
        }
        
        /* Card Styles */
        .card {
            background: white;
            border-radius: 1rem;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.07);
            overflow: hidden;
            transition: all 0.3s ease;
            border: 1px solid rgba(212, 169, 68, 0.1);
        }
        
        .card:hover {
            box-shadow: 0 12px 24px rgba(212, 169, 68, 0.15);
            transform: translateY(-4px);
        }
        
        .card-header {
            background: linear-gradient(135deg, #f9fafb 0%, #f3f4f6 100%);
            padding: 1.25rem 1.5rem;
            border-bottom: 2px solid var(--emirates-gold);
            font-weight: 600;
            color: var(--emirates-black);
            font-family: 'Poppins', sans-serif;
        }
        
        .card-body {
            padding: 1.5rem;
        }
        
        .card-footer {
            background: #f9fafb;
            padding: 1rem 1.5rem;
            border-top: 1px solid #e5e7eb;
        }
        
        /* Form Styles */
        .form-group {
            margin-bottom: 1.25rem;
        }
        
        .form-label {
            display: block;
            font-size: 0.875rem;
            font-weight: 500;
            color: var(--emirates-dark-gray);
            margin-bottom: 0.5rem;
            font-family: 'Inter', sans-serif;
        }
        
        .form-control {
            width: 100%;
            padding: 0.625rem 1rem;
            font-size: 0.875rem;
            border: 2px solid #e5e7eb;
            border-radius: 0.5rem;
            transition: all 0.3s ease;
            font-family: 'Inter', sans-serif;
            background: white;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--emirates-gold);
            box-shadow: 0 0 0 4px rgba(212, 169, 68, 0.1);
        }
        
        .form-control:hover {
            border-color: var(--emirates-gold);
        }
        
        .form-select {
            appearance: none;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 0.5rem center;
            background-repeat: no-repeat;
            background-size: 1.5em 1.5em;
            padding-right: 2.5rem;
        }
        
        /* Table Styles */
        .table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            font-size: 0.875rem;
        }
        
        .table thead {
            background: linear-gradient(135deg, var(--emirates-gold) 0%, var(--emirates-dark-gold) 100%);
            color: white;
        }
        
        .table thead th {
            padding: 1rem 1.25rem;
            text-align: left;
            font-weight: 600;
            font-family: 'Poppins', sans-serif;
            border-bottom: 2px solid var(--emirates-dark-gold);
        }
        
        .table thead th:first-child {
            border-top-left-radius: 0.5rem;
        }
        
        .table thead th:last-child {
            border-top-right-radius: 0.5rem;
        }
        
        .table tbody tr {
            background: white;
            transition: all 0.2s ease;
        }
        
        .table tbody tr:hover {
            background: linear-gradient(135deg, #fef9f3 0%, #fef3e6 100%);
            box-shadow: 0 2px 4px rgba(212, 169, 68, 0.1);
        }
        
        .table tbody td {
            padding: 1rem 1.25rem;
            border-bottom: 1px solid #e5e7eb;
        }
        
        .table tbody tr:last-child td:first-child {
            border-bottom-left-radius: 0.5rem;
        }
        
        .table tbody tr:last-child td:last-child {
            border-bottom-right-radius: 0.5rem;
        }
        
        /* Badge Styles */
        .badge {
            display: inline-flex;
            align-items: center;
            padding: 0.25rem 0.75rem;
            font-size: 0.75rem;
            font-weight: 600;
            border-radius: 9999px;
            font-family: 'Inter', sans-serif;
        }
        
        .badge-gold {
            background: linear-gradient(135deg, #fef3e6 0%, #fde8cc 100%);
            color: var(--emirates-dark-gold);
            border: 1px solid var(--emirates-gold);
        }
        
        .badge-success {
            background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);
            color: #065f46;
            border: 1px solid #10b981;
        }
        
        .badge-danger {
            background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
            color: #991b1b;
            border: 1px solid #ef4444;
        }
        
        .badge-info {
            background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%);
            color: #1e40af;
            border: 1px solid #3b82f6;
        }
        
        .badge-warning {
            background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
            color: #92400e;
            border: 1px solid #f59e0b;
        }
        
        /* Alert Styles */
        .alert {
            padding: 1rem 1.25rem;
            border-radius: 0.75rem;
            margin-bottom: 1rem;
            border-left: 4px solid;
            font-size: 0.875rem;
        }
        
        .alert-success {
            background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%);
            color: #065f46;
            border-left-color: #10b981;
        }
        
        .alert-danger {
            background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%);
            color: #991b1b;
            border-left-color: #ef4444;
        }
        
        .alert-info {
            background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%);
            color: #1e40af;
            border-left-color: #3b82f6;
        }
        
        .alert-warning {
            background: linear-gradient(135deg, #fef3c7 0%, #fde68a 100%);
            color: #92400e;
            border-left-color: #f59e0b;
        }
        
        /* Focus States */
        input:focus, textarea:focus, select:focus {
            outline: none;
            box-shadow: 0 0 0 4px rgba(212, 169, 68, 0.1);
            border-color: var(--emirates-gold);
        }
        
        /* Scrollbar Styling */
        ::-webkit-scrollbar {
            width: 10px;
            height: 10px;
        }
        
        ::-webkit-scrollbar-track {
            background: linear-gradient(135deg, #f5f5f5 0%, #e8e8e8 100%);
            border-radius: 5px;
        }
        
        ::-webkit-scrollbar-thumb {
            background: linear-gradient(135deg, var(--emirates-gold) 0%, var(--emirates-dark-gold) 100%);
            border-radius: 5px;
        }
        
        ::-webkit-scrollbar-thumb:hover {
            background: linear-gradient(135deg, var(--emirates-dark-gold) 0%, #6b4a04 100%);
        }
        
        /* Animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        .fade-in {
            animation: fadeIn 0.5s ease-out;
        }
        
        /* Layout without Sidebar */
        .main-layout {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            width: 100%;
        }
        
        .main-content-wrapper {
            flex: 1;
            width: 100%;
            overflow-x: hidden;
        }
        
        .main-content {
            width: 100%;
            max-width: 100%;
            padding: 1.5rem;
            margin: 0 auto;
        }
        
        @media (min-width: 640px) {
            .main-content {
                padding: 2rem;
            }
        }
        
        @media (min-width: 1024px) {
            .main-content {
                padding: 2.5rem;
                max-width: 1400px;
            }
        }
        
        @media (min-width: 1280px) {
            .main-content {
                max-width: 1536px;
            }
        }
    </style>
</head>
<body class="main-layout">
