<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>About Us - Bookstore</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
</head>
<body class="bg-pink-100 font-roboto">
<header class="flex justify-between items-center p-4 bg-white shadow-md">
    <div class="text-2xl font-bold text-pink-600">
        Bookstore
    </div>
    <nav class="space-x-4">
        <a class="text-gray-700 hover:text-pink-600 transition" href="index.jsp">Home</a>
        <a class="text-gray-700 hover:text-pink-600 transition" href="category.jsp">Categories</a>
        <a class="text-gray-700 hover:text-pink-600 transition" href="contact.jsp">Contact</a>
        <a class="text-gray-700 hover:text-pink-600 transition" href="About.jsp">About</a>
    </nav>
    <div class="flex items-center space-x-2">
        <input class="border rounded px-2 py-1 focus:outline-none focus:ring-2 focus:ring-pink-600" placeholder="Search" type="text"/>
        <a class="bg-pink-600 text-white px-4 py-1 rounded hover:bg-pink-700 transition" href="Login.jsp">Login</a>
        <a class="relative" href="cart.jsp">
            <i class="fas fa-shopping-cart text-gray-700 text-xl"></i>
            <span class="absolute top-0 right-0 bg-red-500 text-white text-xs rounded-full px-1" id="cartCount">0</span>
        </a>
    </div>
</header>
<main class="p-8">
    <h1 class="text-4xl font-bold mb-4 text-center text-pink-600">About Us</h1>
    <p class="text-gray-700 mb-8 text-center">Learn more about our bookstore, our mission, and our team.</p>
    <div class="bg-white p-6 rounded-lg shadow-md mb-8">
        <h2 class="text-2xl font-bold mb-4 text-pink-600">Our Mission</h2>
        <p class="text-gray-700 mb-4">At Bookstore, our mission is to provide a wide range of books to readers of all ages and interests. We believe in the power of reading to transform lives and aim to make books accessible to everyone.</p>
        <img alt="A cozy bookstore with shelves filled with books and a reading area with comfortable chairs" class="w-full rounded-lg shadow-md" height="400" src="https://storage.googleapis.com/a1aa/image/sEp_bYI0xDysn3LkkEPDbQy77xlADT8OSOhhqwlELRk.jpg" width="600"/>
    </div>
    <div class="bg-white p-6 rounded-lg shadow-md mb-8">
        <h2 class="text-2xl font-bold mb-4 text-pink-600">Our Team</h2>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4">
            <div class="text-center">
                <img alt="Portrait of John Doe, CEO of Bookstore" class="w-32 h-32 rounded-full mx-auto mb-4" height="150" src="https://storage.googleapis.com/a1aa/image/v-wliqNpnrhqR0p6SCYIomelY-584Kelsf6eKKjpnHo.jpg" width="150"/>
                <h3 class="text-xl font-bold text-pink-600">John Doe</h3>
                <p class="text-gray-700">CEO</p>
            </div>
            <div class="text-center">
                <img alt="Portrait of Jane Smith, Head of Marketing at Bookstore" class="w-32 h-32 rounded-full mx-auto mb-4" height="150" src="https://storage.googleapis.com/a1aa/image/OHW7b7LB3mEjDKExnFrnbJjlVRYJjOzQ0RMwZxB6weQ.jpg" width="150"/>
                <h3 class="text-xl font-bold text-pink-600">Jane Smith</h3>
                <p class="text-gray-700">Head of Marketing</p>
            </div>
            <div class="text-center">
                <img alt="Portrait of Emily Johnson, Chief Librarian at Bookstore" class="w-32 h-32 rounded-full mx-auto mb-4" height="150" src="https://storage.googleapis.com/a1aa/image/UpMJDxg-tVu4HNuQCD2hNh1bQ4mBAnMfinSkzS3jBVs.jpg" width="150"/>
                <h3 class="text-xl font-bold text-pink-600">Emily Johnson</h3>
                <p class="text-gray-700">Chief Librarian</p>
            </div>
        </div>
    </div>
    <div class="bg-white p-6 rounded-lg shadow-md mb-8">
        <h2 class="text-2xl font-bold mb-4 text-pink-600">Our History</h2>
        <p class="text-gray-700 mb-4">Bookstore was founded in 2000 with the goal of creating a community space for book lovers. Over the years, we have grown from a small local shop to a well-known bookstore with a wide selection of books and a loyal customer base.</p>
        <img alt="Historical photo of the original Bookstore location with a small storefront and a welcoming sign" class="w-full rounded-lg shadow-md" height="400" src="https://storage.googleapis.com/a1aa/image/AE7I43Dd8haLkHFaErW6eUba1XJSBLGzMxrTOu8JkvM.jpg" width="600"/>
    </div>
    <div class="bg-white p-6 rounded-lg shadow-md mb-8">
        <h2 class="text-2xl font-bold mb-4 text-pink-600">Customer Testimonials</h2>
        <div class="space-y-4">
            <div class="bg-gray-100 p-4 rounded-lg shadow-md">
                <p class="text-gray-700">"Bookstore has an amazing selection of books and the staff is always so helpful. I love spending my weekends here!"</p>
                <p class="text-gray-700 font-bold mt-2">- Sarah Williams</p>
            </div>
            <div class="bg-gray-100 p-4 rounded-lg shadow-md">
                <p class="text-gray-700">"I found a rare book here that I had been searching for years. The atmosphere is cozy and welcoming."</p>
                <p class="text-gray-700 font-bold mt-2">- Michael Brown</p>
            </div>
            <div class="bg-gray-100 p-4 rounded-lg shadow-md">
                <p class="text-gray-700">"The events and book signings they host are fantastic. It's a great place to meet fellow book lovers."</p>
                <p class="text-gray-700 font-bold mt-2">- Emily Davis</p>
            </div>
        </div>
    </div>
    <div class="bg-white p-6 rounded-lg shadow-md mb-8">
        <h2 class="text-2xl font-bold mb-4 text-pink-600">Join Our Newsletter</h2>
        <p class="text-gray-700 mb-4">Stay updated with the latest news, events, and special offers from Bookstore. Subscribe to our newsletter!</p>
        <form class="flex flex-col md:flex-row items-center">
            <input class="border rounded w-full md:w-2/3 py-2 px-3 text-gray-700 focus:outline-none focus:ring-2 focus:ring-pink-600 mb-4 md:mb-0 md:mr-4" placeholder="Your Email" required type="email"/>
            <button class="bg-pink-600 text-white px-4 py-2 rounded hover:bg-pink-700 transition duration-200" type="submit">Subscribe</button>
        </form>
    </div>
    <div class="bg-white p-6 rounded-lg shadow-md">
        <h2 class="text-2xl font-bold mb-4 text-pink-600">Our Partners</h2>
        <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
            <img alt="Logo of Partner 1" class="w-full h-24 object-contain" height="100" src="https://storage.googleapis.com/a1aa/image/AsP_Q6dmRsBYvLOFftheb-HeFOiHoi7DSJgB0AskP7Y.jpg" width="150"/>
            <img alt="Logo of Partner 2" class="w-full h-24 object-contain" height="100" src="https://storage.googleapis.com/a1aa/image/ltEkHH5tuZNeNhY1Lb-Z_GCEpNM7oslM1HVfICdhZAU.jpg" width="150"/>
            <img alt="Logo of Partner 3" class="w-full h-24 object-contain" height="100" src="https://storage.googleapis.com/a1aa/image/BLfbW1ig2RGm4iGUlcEOwbDiO3KI2oa6-BJQ4PANoRc.jpg" width="150"/>
            <img alt="Logo of Partner 4" class="w-full h-24 object-contain" height="100" src="https://storage.googleapis.com/a1aa/image/XOtrosKkSCRbbd2jPUjHN0GRDE3ltsf-im0Mi0CKTa8.jpg" width="150"/>
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