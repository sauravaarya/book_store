<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Contact Us - Bookstore</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
</head>
<body class="bg-pink-100 font-roboto">
<header class="flex justify-between items-center p-4 bg-white shadow-md">
    <div class="text-2xl font-bold">Bookstore</div>
    <nav class="space-x-4">
        <a href="index.jsp" class="text-gray-700">Home</a>
        <a href="categories.jsp" class="text-gray-700">Categories</a>
        <a class="text-gray-700" href="contact.jsp">Contact</a>
        <a href="About.jsp" class="text-gray-700">About</a>
    </nav>
    <div class="flex items-center space-x-2">
        <input class="border rounded px-2 py-1" placeholder="Search" type="text"/>
        <a href="Login.jsp" class="bg-black text-white px-4 py-1 rounded">Login</a>
        <a href="cart.jsp" class="relative">
            <i class="fas fa-shopping-cart text-gray-700 text-xl"></i>
            <span id="cartCount" class="absolute top-0 right-0 bg-red-500 text-white text-xs rounded-full px-1">0</span>
        </a>
    </div>
</header>
<main class="p-8">
    <h1 class="text-4xl font-bold mb-4 text-center">Get in Touch with Us</h1>
    <p class="text-gray-700 mb-8 text-center">We would love to hear from you! Please fill out the form below to reach out.</p>

    <!-- Feedback Messages -->
    <%
        String status = request.getParameter("status");
        if (status != null) {
            if (status.equals("success")) {
    %>
                <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
                    <strong>Success!</strong> Your message has been sent.
                </div>
    <%
            } else if (status.equals("failed")) {
    %>
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
                    <strong>Error!</strong> Failed to send your message. Please try again.
                </div>
    <%
            } else if (status.equals("error")) {
    %>
                <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4" role="alert">
                    <strong>Error!</strong> An unexpected error occurred. Please try again later.
                </div>
    <%
            }
        }
    %>

    <!-- Contact Form -->
    <div class="bg-white p-6 rounded-lg shadow-md">
        <form action="ContactServlet" method="post">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                <div>
                    <label class="block text-gray-700 font-bold mb-2" for="name">Name</label>
                    <input class="border rounded w-full py-2 px-3 text-gray-700" id="name" name="name" type="text" placeholder="Your Name" required>
                </div>
                <div>
                    <label class="block text-gray-700 font-bold mb-2" for="email">Email</label>
                    <input class="border rounded w-full py-2 px-3 text-gray-700" id="email" name="email" type="email" placeholder="Your Email" required>
                </div>
            </div>
            <div class="mt-4">
                <label class="block text-gray-700 font-bold mb-2" for="message">Message</label>
                <textarea class="border rounded w-full py-2 px-3 text-gray-700" id="message" name="message" rows="5" placeholder="Your Message" required></textarea>
            </div>
            <div class="mt-4">
                <button class="bg-pink-500 text-white px-4 py-2 rounded hover:bg-pink-600 transition duration-200" type="submit">Send Message</button>
            </div>
        </form>
    </div>

    <div class="mt-8">
        <h2 class="text-2xl font-bold mb-4">Our Location</h2>
        <div class="bg-white p-4 rounded-lg shadow-md">
            <p class="text-gray-700">123 Bookstore Lane, Booktown, BK 12345</p>
            <p class="text-gray-700">Phone: (123) 456-7890</p>
            <p class="text-gray-700">Email: support@bookstore.com</p>
        </div>
    </div>

    <div class="mt-8">
        <h2 class="text-2xl font-bold mb-4">Follow Us</h2>
        <div class="flex space-x-4">
            <a href="#" class="text-gray-700 hover:text-pink-500">
                <i class="fab fa-facebook fa-2x"></i>
            </a>
            <a href="#" class="text-gray-700 hover:text-pink-500">
                <i class="fab fa-twitter fa-2x"></i>
            </a>
            <a href="#" class="text-gray-700 hover:text-pink-500">
                <i class="fab fa-instagram fa-2x"></i>
            </a>
            <a href="#" class="text-gray-700 hover:text-pink-500">
                <i class="fab fa-linkedin fa-2x"></i>
            </a>
        </div>
    </div>
</main>
<footer class="bg-gray-800 text-white py-8">
    <div class="container mx-auto px-4 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <div>
            <h4 class="font-bold mb-4">About</h4>
            <ul>
                <li><a href="#" class="text-gray-400">Contact</a></li>
                <li><a href="#" class="text-gray-400">Careers</a></li>
                <li><a href="#" class="text-gray-400">Press</a></li>
                <li><a href="#" class="text-gray-400">Corporate Company</a></li>
            </ul>
        </div>
        <div>
            <h4 class="font-bold mb-4">Group companies</h4>
            <ul>
                <li><a href="#" class="text-gray-400">Myntra</a></li>
                <li><a href="#" class="text-gray-400">Cleartrip</a></li>
                <li><a href="#" class="text-gray-400">Shopsy</a></li>
            </ul>
        </div>
        <div>
            <h4 class="font-bold mb-4">Help</h4>
            <ul>
                <li><a href="#" class="text-gray-400">Payments</a></li>
                <li><a href="#" class="text-gray-400">Shipping</a></li>
                <li><a href="#" class="text-gray-400">Cancellation &amp; Return</a></li>
                <li><a href="#" class="text-gray-400">FAQ</a></li>
            </ul>
        </div>
        <div>
            <h4 class="font-bold mb-4">Others</h4>
            <ul>
                <li><a href="#" class="text-gray-400">Become a seller</a></li>
                <li><a href="#" class="text-gray-400">Advertise</a></li>
                <li><a href="#" class="text-gray-400">Gift Cards</a></li>
            </ul>
        </div>
    </div>
    <div class="text-center mt-8">
        <p class="text-gray-500">Copyright © 2025 – All rights reserved by @k University</p>
    </div>
</footer>
</body>
</html>