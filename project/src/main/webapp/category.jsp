<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bookstore - Categories</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-pink-100">

<header class="flex justify-between items-center p-4 bg-white shadow-md">
    <div class="text-2xl font-bold">Bookstore</div>
    <nav class="space-x-4">
        <a href="index.jsp" class="text-gray-700">Home</a>
        <a href="category.jsp" class="text-gray-700 font-bold">Categories</a>
        <a href="contact.jsp" class="text-gray-700">Contact</a>
        <a href="About.jsp" class="text-gray-700">About</a>
    </nav>
    <div class="flex items-center space-x-2">
        <input class="border rounded px-2 py-1" placeholder="Search" type="text"/>
        <a href="Login.jsp" class="bg-black text-white px-4 py-1 rounded">Login</a>
        <a href="cart.jsp" class="relative">
            <i class="fas fa-shopping-cart text-gray-700 text-xl"></i>
            <span id="cart-count" class="absolute top-0 right-0 bg-red-500 text-white text-xs rounded-full px-1">0</span>
        </a>
    </div>
</header>

<main class="container mx-auto px-4 py-8">
    <section class="text-center mb-8">
        <h2 class="text-2xl font-bold">Available Books</h2>
    </section>

    <section class="mb-8">
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
            <%
                List<String[]> books = (List<String[]>) application.getAttribute("allBooks");
                boolean hasAdminBooks = books != null && !books.isEmpty();

                // Static fallback books
                String[][] staticBooks = {
                    {"The Alchemist", "Paulo Coelho", "350", "Fiction", "https://m.media-amazon.com/images/I/51Z0nLAfLmL.jpg"},
                    {"To Kill a Mockingbird", "Harper Lee", "299", "Fiction", "https://m.media-amazon.com/images/I/51Ga5GuElyL.jpg"},
                    {"1984", "George Orwell", "275", "Fiction", "https://m.media-amazon.com/images/I/81StSOpmkjL.jpg"},
                    {"Atomic Habits", "James Clear", "450", "Self-Help", "https://m.media-amazon.com/images/I/91bYsX41DVL.jpg"},
                    {"The 7 Habits of Highly Effective People", "Stephen Covey", "399", "Self-Help", "https://m.media-amazon.com/images/I/91Yk7Lg-1BL.jpg"},
                    {"The Power of Now", "Eckhart Tolle", "320", "Self-Help", "https://m.media-amazon.com/images/I/71QeI8XQiZL.jpg"},
                    {"Ikigai", "Héctor García", "400", "Philosophy", "https://m.media-amazon.com/images/I/81p+xe8cbnL.jpg"},
                    {"Meditations", "Marcus Aurelius", "280", "Philosophy", "https://m.media-amazon.com/images/I/71hYa1gZB4L.jpg"},
                    {"The Art of War", "Sun Tzu", "199", "Philosophy", "https://m.media-amazon.com/images/I/71OZY035QVL.jpg"},
                    {"Rich Dad Poor Dad", "Robert Kiyosaki", "399", "Finance", "https://m.media-amazon.com/images/I/81bsw6fnUiL.jpg"},
                    {"The Intelligent Investor", "Benjamin Graham", "425", "Finance", "https://m.media-amazon.com/images/I/91+t0Di07FL.jpg"},
                    {"Your Money or Your Life", "Vicki Robin", "375", "Finance", "https://m.media-amazon.com/images/I/81G+Q+gk5FL.jpg"}
                };

                if (hasAdminBooks) {
                    for (String[] book : books) {
            %>
            <div class="bg-white p-4 rounded shadow-md hover:shadow-lg transition duration-200">
                <img src="<%= book[4] %>" alt="<%= book[0] %>" class="w-full h-48 object-cover mb-4">
                <h4 class="text-lg font-bold"><%= book[0] %></h4>
                <p class="text-gray-600">Author: <%= book[1] %></p>
                <p class="text-gray-600">Price: Rs <%= book[2] %></p>
                <div class="flex justify-between items-center mt-4">
                    <span class="text-gray-500">Category: <%= book[3] %></span>
                </div>
                <div class="flex justify-between mt-4 space-x-2">
                    <a href="Checkout.jsp?title=<%= book[0] %>&author=<%= book[1] %>&price=<%= book[2] %>&image=<%= book[4] %>&category=<%= book[3] %>" 
                       class="bg-pink-500 hover:bg-pink-600 text-white px-4 py-2 rounded transition duration-200 flex-1 text-center">
                        Buy Now
                    </a>
                    <button onclick="addToCart('<%= book[0] %>', '<%= book[1] %>', <%= book[2] %>, '<%= book[4] %>', '<%= book[3] %>')" 
                       class="bg-gray-200 hover:bg-gray-300 text-gray-800 px-4 py-2 rounded transition duration-200 flex-1">
                        Add to Cart
                    </button>
                </div>
            </div>
            <%
                    }
                }

                for (String[] book : staticBooks) {
                    if (!hasAdminBooks || (hasAdminBooks && staticBooks.length <= 4)) {
            %>
            <div class="bg-white p-4 rounded shadow-md hover:shadow-lg transition duration-200">
                <img src="<%= book[4] %>" alt="<%= book[0] %>" class="w-full h-48 object-cover mb-4">
                <h4 class="text-lg font-bold"><%= book[0] %></h4>
                <p class="text-gray-600">Author: <%= book[1] %></p>
                <p class="text-gray-600">Price: Rs <%= book[2] %></p>
                <div class="flex justify-between items-center mt-4">
                    <span class="text-gray-500">Category: <%= book[3] %></span>
                </div>
                <div class="flex justify-between mt-4 space-x-2">
                    <a href="Checkout.jsp?title=<%= book[0] %>&author=<%= book[1] %>&price=<%= book[2] %>&image=<%= book[4] %>&category=<%= book[3] %>" 
                       class="bg-pink-500 hover:bg-pink-600 text-white px-4 py-2 rounded transition duration-200 flex-1 text-center">
                        Buy Now
                    </a>
                    <button onclick="addToCart('<%= book[0] %>', '<%= book[1] %>', <%= book[2] %>, '<%= book[4] %>', '<%= book[3] %>')" 
                       class="bg-gray-200 hover:bg-gray-300 text-gray-800 px-4 py-2 rounded transition duration-200 flex-1">
                        Add to Cart
                    </button>
                </div>
            </div>
            <%
                    }
                }
            %>
        </div>
    </section>
</main>

<footer class="bg-gray-800 text-white py-8">
    <!-- Footer content remains the same -->
</footer>

<script>
    // Load cart from sessionStorage
    let cart = JSON.parse(sessionStorage.getItem('cart')) || [];
    updateCartCount();

    function addToCart(title, author, price, image, category) {
        // Create cart item
        const item = {
            title: title,
            author: author,
            price: price,
            image: image,
            category: category,
            quantity: 1
        };
        
        // Check if item already exists in cart
        const existingItem = cart.find(i => i.title === title);
        if (existingItem) {
            existingItem.quantity += 1;
        } else {
            cart.push(item);
        }
        
        // Save to sessionStorage
        sessionStorage.setItem('cart', JSON.stringify(cart));
        
        // Update UI
        updateCartCount();
        alert(`Added to cart: ${title} by ${author} (Rs ${price})`);
    }
    
    function updateCartCount() {
        const count = cart.reduce((total, item) => total + item.quantity, 0);
        document.getElementById('cart-count').textContent = count;
    }
</script>

</body>
</html>