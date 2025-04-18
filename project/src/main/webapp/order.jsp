<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Summary - Bookstore</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-roboto">
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
    <h1 class="text-3xl font-bold mb-4">Order Summary</h1>
    <%
        // Retrieve order details from request attributes
        String customerName = (String) request.getAttribute("customerName");
        String bookTitle = (String) request.getAttribute("bookTitle");
        String bookPrice = (String) request.getAttribute("bookPrice");
        String address = (String) request.getAttribute("address");
        String city = (String) request.getAttribute("city");
        String state = (String) request.getAttribute("state");
        String country = (String) request.getAttribute("country");
        String phoneNumber = (String) request.getAttribute("phoneNumber");
        String email = (String) request.getAttribute("email");
        String paymentMethod = (String) request.getAttribute("paymentMethod");
    %>
    <div class="bg-white p-6 rounded shadow-md">
        <h2 class="text-2xl font-bold mb-2">Thank you, <%= customerName %>!</h2>
        <p class="text-lg mb-4">Your order for <span class="font-semibold"><%= bookTitle %></span> has been placed successfully.</p>
        <p class="text-lg mb-4">Total Price: <span class="font-semibold text-green-600">Rs <%= bookPrice %></span></p>

        <h2 class="text-xl font-bold mt-6 mb-2">Shipping Details</h2>
        <div class="space-y-2">
            <p><span class="font-semibold">Address:</span> <%= address %></p>
            <p><span class="font-semibold">City:</span> <%= city %></p>
            <p><span class="font-semibold">State:</span> <%= state %></p>
            <p><span class="font-semibold">Country:</span> <%= country %></p>
        </div>

        <h2 class="text-xl font-bold mt-6 mb-2">Contact Details</h2>
        <div class="space-y-2">
            <p><span class="font-semibold">Phone Number:</span> <%= phoneNumber %></p>
            <p><span class="font-semibold">Email:</span> <%= email %></p>
        </div>

        <h2 class="text-xl font-bold mt-6 mb-2">Payment Details</h2>
        <div class="space-y-2">
            <p><span class="font-semibold">Payment Method:</span> <%= paymentMethod %></p>
        </div>

        <div class="mt-6 text-center">
            <a href="index.jsp" class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700">Continue Shopping</a>
        </div>
    </div>
</main>
<footer class="bg-white py-6 mt-6">
    <div class="container mx-auto text-center space-y-4">
        <p class="text-gray-600">Copyright@2025-- All Right reserved by Rk University</p>
    </div>
</footer>
</body>
</html>