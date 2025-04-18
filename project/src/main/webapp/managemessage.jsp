<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Manage Messages - Admin Panel</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
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
                <a href="#" class="block py-3 px-6 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition duration-200">
                    <i class="fas fa-sign-out-alt mr-2"></i>Logout
                </a>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="flex-1 ml-64 p-8">
            <!-- Header -->
            <div class="gradient-bg text-white p-8 rounded-xl mb-8">
                <h1 class="text-4xl font-bold">Manage Messages</h1>
                <p class="mt-2 text-gray-100">Review and respond to messages from users.</p>
            </div>

            <!-- Message Table -->
            <div class="bg-white p-8 rounded-xl shadow-md card-hover">
                <h2 class="text-2xl font-bold text-pink-600 mb-6">User Messages</h2>
                <table class="min-w-full bg-white border border-gray-300">
                    <thead>
                        <tr class="text-left border-b bg-gray-200">
                            <th class="py-3 px-6 text-pink-600 font-semibold">Name</th>
                            <th class="py-3 px-6 text-pink-600 font-semibold">Email</th>
                            <th class="py-3 px-6 text-pink-600 font-semibold">Message</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String jdbcURL = "jdbc:mysql://localhost:3306/bookstore";
                            String dbUser  = "root";
                            String dbPassword = "";

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection connection = DriverManager.getConnection(jdbcURL, dbUser , dbPassword);
                                String sql = "SELECT * FROM messages";
                                Statement statement = connection.createStatement();
                                ResultSet resultSet = statement.executeQuery(sql);

                                while (resultSet.next()) {
                                    String name = resultSet.getString("name");
                                    String email = resultSet.getString("email");
                                    String message = resultSet.getString("message");
                        %>
                                    <tr class="border-b hover:bg-gray-50 transition duration-200">
                                        <td class="py-4 px-6"><%= name %></td>
                                        <td class="py-4 px-6"><%= email %></td>
                                        <td class="py-4 px-6"><%= message %></td>
                                    </tr>
                        <%
                                }
                                connection.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </main>
    </div>

    <!-- Footer -->
    <footer class="bg-gray-800 text-white py-8 mt-12">
        <div class="text-center">
            <p class="text-gray-500">Copyright © 2025 – All rights reserved by @k University</p>
        </div>
    </footer>
</body>
</html>