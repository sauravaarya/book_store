<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - Bookstore</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-pink-100 text-gray-800">
<header class="bg-white shadow-md">
    <div class="container mx-auto flex justify-between items-center py-4 px-6">
        <h1 class="text-2xl font-bold">Bookstore</h1>
        <nav class="space-x-4">
            <a href="index.jsp" class="text-gray-600 hover:text-gray-800">Home</a>
            <a href="category.jsp" class="text-gray-600 hover:text-gray-800">Categories</a>
            <a href="contact.jsp" class="text-gray-600 hover:text-gray-800">Contact</a>
            <a href="About.jsp" class="text-gray-600 hover:text-gray-800">About</a>
        </nav>
    </div>
</header>
<main class="container mx-auto py-6 px-6">
    <h2 class="text-2xl font-bold mb-4">Checkout</h2>
    <div class="bg-white p-4 rounded shadow-md flex items-start space-x-4">
        <%
            // Retrieve the selected book details from the request
            String bookTitle = request.getParameter("title");
            String bookAuthor = request.getParameter("author");
            String bookPrice = request.getParameter("price");
            String bookImage = request.getParameter("image");
            String bookCategory = request.getParameter("category");
        %>
        <img src="<%= bookImage %>" alt="<%= bookTitle %>" class="w-24 h-36 object-cover" width="100" height="150">
        <div class="flex-1">
            <h2 class="text-lg font-bold"><%= bookTitle %></h2>
            <p>Author: <%= bookAuthor %></p>
            <p>Category: <%= bookCategory %></p>
            <p class="text-xl font-bold text-green-600">Rs <%= bookPrice %></p>
        </div>
    </div>
    <div class="mt-6 bg-white p-6 rounded shadow-md">
        <h2 class="text-xl font-bold mb-4 text-center">Place your order</h2>
        <form action="OrderServlet" method="post" class="grid grid-cols-1 md:grid-cols-2 gap-4">
            <input type="hidden" name="title" value="<%= bookTitle %>">
            <input type="hidden" name="price" value="<%= bookPrice %>">
            <input type="text" name="customerName" placeholder="Your Name" class="border rounded px-4 py-2" required>
            <input type="text" name="phoneNumber" placeholder="Phone number" class="border rounded px-4 py-2" required>
            <input type="email" name="email" placeholder="Your Email" class="border rounded px-4 py-2" required>
            <input type="text" name="paymentMethod" placeholder="Payment method" class="border rounded px-4 py-2" required>
            <input type="text" name="address" placeholder="Your Address" class="border rounded px-4 py-2" required>
            <input type="text" name="address2" placeholder="Address 2" class="border rounded px-4 py-2">
            <input type="text" name="city" placeholder="City" class="border rounded px-4 py-2" required>
            <input type="text" name="state" placeholder="State" class="border rounded px-4 py-2" required>
            <input type="text" name="country" placeholder="Country" class="border rounded px-4 py-2" required>
            <div class="text-center mt-4">
                <button type="submit" class="bg-blue-600 text-white px-6 py-2 rounded">Order now</button>
            </div>
        </form>
    </div>
</main>
<footer class="bg-white py-6 mt-6">
    <div class="container mx-auto text-center space-y-4">
        <p class="text-gray-600">Copyright@2025-- All Right reserved by Rk University</p>
    </div>
</footer>
</body>
</html>