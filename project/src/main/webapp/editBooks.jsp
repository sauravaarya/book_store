<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Edit Book - Admin Panel</title>
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
                <h1 class="text-4xl font-bold">Edit Book</h1>
                <p class="mt-2 text-gray-100">Update book details in your inventory.</p>
            </div>

            <!-- Edit Book Form -->
            <div class="bg-white p-8 rounded-xl shadow-md card-hover mb-8">
                <h2 class="text-2xl font-bold text-pink-600 mb-6">Edit Book Details</h2>
                <%
                    String title = request.getParameter("id");
                    List<String[]> books = (List<String[]>) request.getSession().getAttribute("books");
                    String[] bookToEdit = null;
                    
                    if (books != null && title != null) {
                        for (String[] book : books) {
                            if (book[0].equals(title)) {
                                bookToEdit = book;
                                break;
                            }
                        }
                    }
                    
                    if (bookToEdit != null) {
                %>
                <form action="manageBook" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="edit">
                    <input type="hidden" name="oldTitle" value="<%= bookToEdit[0] %>">
                    
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <div>
                            <label class="block text-gray-700 mb-2">Title</label>
                            <input type="text" name="title" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-pink-500" 
                                   value="<%= bookToEdit[0] %>" placeholder="Enter book title"/>
                        </div>
                        <div>
                            <label class="block text-gray-700 mb-2">Author</label>
                            <input type="text" name="author" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-pink-500" 
                                   value="<%= bookToEdit[1] %>" placeholder="Enter author name"/>
                        </div>
                        <div>
                            <label class="block text-gray-700 mb-2">Price</label>
                            <input type="number" name="price" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-pink-500" 
                                   value="<%= bookToEdit[2] %>" placeholder="Enter book price"/>
                        </div>
                        <div>
                            <label class="block text-gray-700 mb-2">Category</label>
                            <input type="text" name="category" required class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-pink-500" 
                                   value="<%= bookToEdit[3] %>" placeholder="Enter book category"/>
                        </div>
                        <div class="col-span-2">
                            <label class="block text-gray-700 mb-2">Current Image</label>
                            <img src="<%= bookToEdit[4] %>" alt="<%= bookToEdit[0] %>" class="w-16 h-16 object-cover rounded-lg mb-2"/>
                            <label class="block text-gray-700 mb-2">Upload New Image (optional)</label>
                            <input type="file" name="image" accept="image/*" class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-pink-500"/>
                        </div>
                    </div>
                    <button type="submit" class="mt-6 bg-pink-500 text-white px-6 py-3 rounded-lg hover:bg-pink-600 transition duration-200">Update Book</button>
                    <a href="managebook.jsp" class="mt-6 bg-gray-500 text-white px-6 py-3 rounded-lg hover:bg-gray-600 transition duration-200 ml-4">Cancel</a>
                </form>
                <%
                    } else {
                %>
                <div class="text-red-500">Book not found or invalid request.</div>
                <a href="managebook.jsp" class="mt-4 inline-block bg-gray-500 text-white px-6 py-2 rounded-lg hover:bg-gray-600 transition duration-200">Back to Book List</a>
                <%
                    }
                %>
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