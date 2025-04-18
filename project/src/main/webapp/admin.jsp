<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Admin Panel - Bookstore</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
        .gradient-bg {
            background: linear-gradient(135deg, #6EE7B7, #3B82F6);
        }
        .sidebar {
            background: linear-gradient(180deg, #1F2937, #111827);
        }
        .card-hover {
            transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out;
        }
        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
        }
        .notification-item {
            transition: background-color 0.2s;
        }
        .notification-item:hover {
            background-color: #f3f4f6;
        }
    </style>
</head>
<body class="bg-gray-50">
    <div class="flex">
        <!-- Sidebar -->
        <aside class="w-64 sidebar h-screen fixed shadow-xl">
            <div class="p-6">
                <h1 class="text-2xl font-bold text-white flex items-center">
                    <i class="fas fa-book-open mr-2"></i>Bookstore Admin
                </h1>
            </div>
            <nav class="mt-8">
                <a href="admin.jsp" class="block py-3 px-6 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition duration-200">
                    <i class="fas fa-tachometer-alt mr-2"></i>Dashboard
                </a>
                <a href="managebook.jsp" class="block py-3 px-6 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition duration-200">
                    <i class="fas fa-book mr-2"></i>Manage Books
                </a>
                <a href="managemessage.jsp" class="block py-3 px-6 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition duration-200">
                    <i class="fas fa-envelope mr-2"></i>Manage Messages
                </a>
                <a href="manageorder.jsp" class="block py-3 px-6 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition duration-200">
                    <i class="fas fa-shopping-cart mr-2"></i>Manage Orders
                </a>
                <a href="manageusers.jsp" class="block py-3 px-6 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition duration-200">
                    <i class="fas fa-users mr-2"></i>Manage Users
                </a>
                <a href="Login.jsp" class="block py-3 px-6 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition duration-200">
                    <i class="fas fa-sign-out-alt mr-2"></i>Logout
                </a>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="flex-1 ml-64 p-8">
            <!-- Header -->
            <div class="gradient-bg text-white p-8 rounded-xl mb-8">
                <h1 class="text-4xl font-bold">Welcome to the Admin Panel</h1>
                <p class="mt-2 text-gray-100">Manage your bookstore efficiently with the tools below.</p>
            </div>

            <!-- Success Message -->
            <c:if test="${not empty param.notification and param.notification == 'added'}">
                <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-6" role="alert">
                    <strong class="font-bold">Success!</strong>
                    <span class="block sm:inline">Notification has been sent successfully.</span>
                </div>
            </c:if>

            <!-- Cards Section -->
            <section class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="bg-white p-8 rounded-xl shadow-md card-hover">
                    <div class="text-pink-600 mb-4">
                        <i class="fas fa-book fa-3x"></i>
                    </div>
                    <h2 class="text-2xl font-bold text-gray-800 mb-4">Manage Books</h2>
                    <p class="text-gray-600 mb-6">Add, edit, or delete books from your inventory.</p>
                    <a href="managebook.jsp" class="bg-pink-500 text-white px-6 py-3 rounded-lg inline-block hover:bg-pink-600 transition duration-200">Go to Manage Books</a>
                </div>
                <div class="bg-white p-8 rounded-xl shadow-md card-hover">
                    <div class="text-blue-600 mb-4">
                        <i class="fas fa-envelope fa-3x"></i>
                    </div>
                    <h2 class="text-2xl font-bold text-gray-800 mb-4">Manage Messages</h2>
                    <p class="text-gray-600 mb-6">View and respond to messages from users.</p>
                    <a href="managemessage.jsp" class="bg-blue-500 text-white px-6 py-3 rounded-lg inline-block hover:bg-blue-600 transition duration-200">Go to Manage Messages</a>
                </div>
                <div class="bg-white p-8 rounded-xl shadow-md card-hover">
                    <div class="text-green-600 mb-4">
                        <i class="fas fa-shopping-cart fa-3x"></i>
                    </div>
                    <h2 class="text-2xl font-bold text-gray-800 mb-4">Manage Orders</h2>
                    <p class="text-gray-600 mb-6">View and manage customer orders.</p>
                    <a href="manageorder.jsp" class="bg-green-500 text-white px-6 py-3 rounded-lg inline-block hover:bg-green-600 transition duration-200">Go to Manage Orders</a>
                </div>
            </section>

            <!-- Notification Management Section -->
            <section class="mt-12">
                <h2 class="text-3xl font-bold text-gray-800 mb-6">Notification Management</h2>
                
                <!-- Add Notification Form -->
                <div class="bg-white p-8 rounded-xl shadow-md mb-8">
                    <h3 class="text-2xl font-bold text-gray-800 mb-4">Send New Notification</h3>
                    <form action="NotificationServlet" method="post">
                        <input type="hidden" name="action" value="add">
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="userId">
                                User ID (leave blank for all users)
                            </label>
                            <input class="border rounded w-full py-2 px-3 text-gray-700" 
                                   id="userId" name="userId" type="text" placeholder="Optional">
                        </div>
                        <div class="mb-4">
                            <label class="block text-gray-700 text-sm font-bold mb-2" for="message">
                                Notification Message
                            </label>
                            <textarea class="border rounded w-full py-2 px-3 text-gray-700" 
                                      id="message" name="message" rows="3" required></textarea>
                        </div>
                        <button type="submit" class="bg-indigo-500 text-white px-6 py-3 rounded-lg hover:bg-indigo-600 transition duration-200">
                            <i class="fas fa-paper-plane mr-2"></i>Send Notification
                        </button>
                    </form>
                </div>

                <!-- Recent Notifications -->
                <div class="bg-white p-8 rounded-xl shadow-md">
                    <h3 class="text-2xl font-bold text-gray-800 mb-4">Recent Notifications</h3>
                    <div class="overflow-x-auto">
                        <table class="min-w-full bg-white">
                            <thead>
                                <tr>
                                    <th class="py-2 px-4 border-b border-gray-200 bg-gray-50 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">ID</th>
                                    <th class="py-2 px-4 border-b border-gray-200 bg-gray-50 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">User ID</th>
                                    <th class="py-2 px-4 border-b border-gray-200 bg-gray-50 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Message</th>
                                    <th class="py-2 px-4 border-b border-gray-200 bg-gray-50 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Date</th>
                                    <th class="py-2 px-4 border-b border-gray-200 bg-gray-50 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="notification" items="${recentNotifications}">
                                    <tr class="notification-item">
                                        <td class="py-2 px-4 border-b border-gray-200">${notification.id}</td>
                                        <td class="py-2 px-4 border-b border-gray-200">
                                            <c:choose>
                                                <c:when test="${notification.userId == null}">All Users</c:when>
                                                <c:otherwise>${notification.userId}</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td class="py-2 px-4 border-b border-gray-200">${notification.message}</td>
                                        <td class="py-2 px-4 border-b border-gray-200">
                                            <fmt:formatDate value="${notification.createdAt}" pattern="MMM dd, yyyy HH:mm" />
                                        </td>
                                        <td class="py-2 px-4 border-b border-gray-200">
                                            <span class="px-2 py-1 text-xs rounded-full ${notification.read ? 'bg-green-100 text-green-800' : 'bg-yellow-100 text-yellow-800'}">
                                                ${notification.read ? 'Read' : 'Unread'}
                                            </span>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty recentNotifications}">
                                    <tr>
                                        <td colspan="5" class="py-4 text-center text-gray-500">No notifications found</td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                    <div class="mt-4 flex justify-between items-center">
                        <div class="text-sm text-gray-500">
                            Showing <span class="font-medium">1</span> to <span class="font-medium">10</span> of <span class="font-medium">${totalNotifications}</span> notifications
                        </div>
                        <div class="flex space-x-2">
                            <button class="bg-gray-200 text-gray-700 px-4 py-2 rounded-lg hover:bg-gray-300 transition duration-200">
                                Previous
                            </button>
                            <button class="bg-indigo-500 text-white px-4 py-2 rounded-lg hover:bg-indigo-600 transition duration-200">
                                Next
                            </button>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Statistics Section -->
            <section class="mt-12">
                <h2 class="text-3xl font-bold text-gray-800 mb-6">System Statistics</h2>
                <div class="grid grid-cols-1 md:grid-cols-4 gap-6">
                    <div class="bg-white p-6 rounded-xl shadow-md">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500">Total Books</p>
                                <h3 class="text-2xl font-bold">1,248</h3>
                            </div>
                            <div class="bg-blue-100 p-3 rounded-full">
                                <i class="fas fa-book text-blue-500 text-xl"></i>
                            </div>
                        </div>
                    </div>
                    <div class="bg-white p-6 rounded-xl shadow-md">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500">Total Orders</p>
                                <h3 class="text-2xl font-bold">568</h3>
                            </div>
                            <div class="bg-green-100 p-3 rounded-full">
                                <i class="fas fa-shopping-cart text-green-500 text-xl"></i>
                            </div>
                        </div>
                    </div>
                    <div class="bg-white p-6 rounded-xl shadow-md">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500">Total Users</p>
                                <h3 class="text-2xl font-bold">892</h3>
                            </div>
                            <div class="bg-purple-100 p-3 rounded-full">
                                <i class="fas fa-users text-purple-500 text-xl"></i>
                            </div>
                        </div>
                    </div>
                    <div class="bg-white p-6 rounded-xl shadow-md">
                        <div class="flex items-center justify-between">
                            <div>
                                <p class="text-gray-500">Unread Messages</p>
                                <h3 class="text-2xl font-bold">24</h3>
                            </div>
                            <div class="bg-yellow-100 p-3 rounded-full">
                                <i class="fas fa-envelope text-yellow-500 text-xl"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </div>

    <!-- Footer -->
    <footer class="bg-gray-800 text-white py-8 mt-12 ml-64">
        <div class="text-center">
            <p class="text-gray-500">Copyright © 2025 – All rights reserved by @k University</p>
        </div>
    </footer>

    <script>
        // Function to load recent notifications via AJAX
        function loadRecentNotifications() {
            fetch('NotificationServlet?action=recent')
                .then(response => response.text())
                .then(html => {
                    document.querySelector('tbody').innerHTML = html;
                })
                .catch(error => console.error('Error loading notifications:', error));
        }

        // Refresh notifications every 60 seconds
        setInterval(loadRecentNotifications, 60000);
    </script>
</body>
</html>