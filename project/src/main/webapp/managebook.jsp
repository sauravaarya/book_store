<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Manage Books - Admin Panel</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; }
        .gradient-bg { background: linear-gradient(135deg, #6EE7B7, #3B82F6); }
        .sidebar { background: linear-gradient(180deg, #1F2937, #111827); }
        .card-hover { transition: transform 0.2s ease-in-out, box-shadow 0.2s ease-in-out; }
        .card-hover:hover { transform: translateY(-5px); box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05); }
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
                <a href="managebook.jsp" class="block py-3 px-6 bg-gray-700 text-white rounded-lg">
                    <i class="fas fa-book mr-2"></i>Manage Books
                </a>
                <a href="managemessage.jsp" class="block py-3 px-6 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition duration-200">
                    <i class="fas fa-list-alt mr-2"></i>Manage Message
                </a>
                <a href="manageorder.jsp" class="block py-3 px-6 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition duration-200">
                    <i class="fas fa-shopping-cart mr-2"></i>Manage Orders
                </a>
                <a href="logout.jsp" class="block py-3 px-6 text-gray-300 hover:bg-gray-700 hover:text-white rounded-lg transition duration-200">
                    <i class="fas fa-sign-out-alt mr-2"></i>Logout
                </a>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="flex-1 ml-64 p-8">
            <!-- Header -->
            <div class="gradient-bg text-white p-8 rounded-xl mb-8">
                <h1 class="text-4xl font-bold">Manage Books</h1>
                <p class="mt-2 text-gray-100">Add, edit, or delete books from your inventory.</p>
            </div>

            <!-- Add Book Form -->
            <div class="bg-white p-8 rounded-xl shadow-md card-hover mb-8">
                <h2 class="text-2xl font-bold text-pink-600 mb-6">Add New Book</h2>
                <form action="manageBook" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="add">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-gray-700 mb-2">Title</label>
                            <input type="text" name="title" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-pink-500" placeholder="Enter book title"/>
                        </div>
                        <div>
                            <label class="block text-gray-700 mb-2">Author</label>
                            <input type="text" name="author" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-pink-500" placeholder="Enter author name"/>
                        </div>
                        <div>
                            <label class="block text-gray-700 mb-2">Price</label>
                            <input type="number" name="price" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-pink-500" placeholder="Enter book price"/>
                        </div>
                        <div>
                            <label class="block text-gray-700 mb-2">Category</label>
                            <input type="text" name="category" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-pink-500" placeholder="Enter book category"/>
                        </div>
                        <div class="col-span-2">
                            <label class="block text-gray-700 mb-2">Upload Image</label>
                            <input type="file" name="image" accept="image/*" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-pink-500"/>
                        </div>
                    </div>
                    <button type="submit" class="mt-6 bg-pink-500 text-white px-6 py-3 rounded-lg hover:bg-pink-600 transition duration-200">Add Book</button>
                </form>
            </div>

            <!-- Book List -->
            <div class="bg-white p-8 rounded-xl shadow-md">
                <h2 class="text-2xl font-bold text-pink-600 mb-6">Book List</h2>
                <table class="min-w-full bg-white">
                    <thead>
                        <tr class="bg-gray-200 text-gray-600">
                            <th class="py-3 px-6 border">Title</th>
                            <th class="py-3 px-6 border">Author</th>
                            <th class="py-3 px-6 border">Price</th>
                            <th class="py-3 px-6 border">Category</th>
                            <th class="py-3 px-6 border">Image</th>
                            <th class="py-3 px-6 border">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<String[]> books = (List<String[]>) application.getAttribute("allBooks");
                            if (books != null && !books.isEmpty()) {
                                for (String[] book : books) {
                        %>
                        <tr class="hover:bg-gray-50 transition duration-200">
                            <td class="py-4 px-6 border"><%= book[0] %></td>
                            <td class="py-4 px-6 border"><%= book[1] %></td>
                            <td class="py-4 px-6 border">Rs <%= book[2] %></td>
                            <td class="py-4 px-6 border"><%= book[3] %></td>
                            <td class="py-4 px-6 border"><img src="<%= book[4] %>" alt="<%= book[0] %>" class="w-16 h-16 object-cover rounded-lg"/></td>
                            <td class="py-4 px-6 border">
                                <a href="editBook.jsp?id=<%= book[0] %>" class="text-blue-500 hover:text-blue-700 transition duration-200">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <form action="manageBook" method="post" style="display: inline;">
                                    <input type="hidden" name="action" value="delete">
                                    <input type="hidden" name="title" value="<%= book[0] %>">
                                    <button type="submit" class="text-red-500 hover:text-red-700 transition duration-200 ml-4" 
                                            onclick="return confirm('Are you sure you want to delete this book?')">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </form>
                            </td>
                        </tr>
                        <%
                                }
                            } else {
                        %>
                        <tr>
                            <td colspan="6" class="py-4 px-6 border text-center text-gray-600">No books available.</td>
                        </tr>
                        <%
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