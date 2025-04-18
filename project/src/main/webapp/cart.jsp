<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Your Cart - Bookstore</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
</head>
<body class="bg-pink-100 font-roboto">
<header class="flex justify-between items-center p-4 bg-white shadow-md">
    <div class="text-2xl font-bold">
        Bookstore
    </div>
    <nav class="space-x-4">
        <a href="index.jsp" class="text-gray-700">Home</a>
        <a href="category.jsp" class="text-gray-700">Categories</a>
        <a class="text-gray-700" href="contact.jsp">Contact</a>
        <a class="text-gray-700" href="About.jsp">About</a>
    </nav>
    <div class="flex items-center space-x-2">
        <input class="border rounded px-2 py-1" placeholder="Search" type="text"/>
        <a href="Login.jsp" class="bg-black text-white px-4 py-1 rounded">
            Login
        </a>
        <a href="cart.jsp" class="relative">
            <i class="fas fa-shopping-cart text-gray-700 text-xl"></i>
            <span id="cart-count" class="absolute top-0 right-0 bg-red-500 text-white text-xs rounded-full px-1">0</span>
        </a>
    </div>
</header>
<main class="p-8">
    <h1 class="text-3xl font-bold mb-4">Your Cart</h1>
    
    <div id="cart-items" class="space-y-4">
        <!-- Cart items will be dynamically added here -->
    </div>
    
    <div class="mt-8 bg-white p-4 rounded shadow-md">
        <div class="flex justify-between items-center">
            <h2 class="text-2xl font-bold">Total: <span id="total-price">Rs 0</span></h2>
            <a href="Checkout.jsp" class="bg-pink-500 hover:bg-pink-600 text-white px-6 py-2 rounded transition duration-200">
                Proceed to Checkout
            </a>
        </div>
    </div>
    
    <div class="mt-4">
        <a href="category.jsp" class="text-pink-600 hover:text-pink-800">
            <i class="fas fa-arrow-left mr-2"></i> Continue Shopping
        </a>
    </div>
</main>

<footer class="bg-gray-800 text-white py-8">
    <!-- Footer content remains the same -->
</footer>

<script>
    // Load cart from sessionStorage
    const cart = JSON.parse(sessionStorage.getItem('cart')) || [];
    const cartItemsDiv = document.getElementById('cart-items');
    const totalPriceSpan = document.getElementById('total-price');
    const cartCountSpan = document.getElementById('cart-count');
    
    // Display cart items
    function displayCartItems() {
        cartItemsDiv.innerHTML = '';
        
        if (cart.length === 0) {
            cartItemsDiv.innerHTML = `
                <div class="text-center py-8">
                    <p class="text-gray-600 text-lg mb-4">Your cart is empty</p>
                    <a href="category.jsp" class="bg-pink-500 text-white px-4 py-2 rounded inline-block">
                        Browse Books
                    </a>
                </div>
            `;
            totalPriceSpan.textContent = 'Rs 0';
            cartCountSpan.textContent = '0';
            return;
        }
        
        let total = 0;
        
        cart.forEach((item, index) => {
            const itemTotal = item.price * item.quantity;
            total += itemTotal;
            
            const itemDiv = document.createElement('div');
            itemDiv.className = 'bg-white p-4 rounded shadow-md';
            itemDiv.innerHTML = `
                <div class="flex flex-col sm:flex-row gap-4">
                    <img src="${item.image}" alt="${item.title}" class="w-24 h-32 object-cover">
                    <div class="flex-1">
                        <h3 class="text-lg font-bold">${item.title}</h3>
                        <p class="text-gray-600">Author: ${item.author}</p>
                        <p class="text-gray-600">Category: ${item.category}</p>
                        <div class="flex items-center mt-2">
                            <button onclick="updateQuantity(${index}, -1)" class="bg-gray-200 px-3 py-1 rounded-l">
                                -
                            </button>
                            <span class="bg-gray-100 px-4 py-1">${item.quantity}</span>
                            <button onclick="updateQuantity(${index}, 1)" class="bg-gray-200 px-3 py-1 rounded-r">
                                +
                            </button>
                            <span class="ml-auto font-bold">Rs ${itemTotal}</span>
                        </div>
                    </div>
                    <button onclick="removeItem(${index})" class="text-red-500 hover:text-red-700 self-start sm:self-center">
                        <i class="fas fa-trash"></i>
                    </button>
                </div>
            `;
            cartItemsDiv.appendChild(itemDiv);
        });
        
        totalPriceSpan.textContent = `Rs ${total}`;
        cartCountSpan.textContent = cart.reduce((sum, item) => sum + item.quantity, 0);
    }
    
    // Update item quantity
    function updateQuantity(index, change) {
        const newQuantity = cart[index].quantity + change;
        
        if (newQuantity < 1) {
            removeItem(index);
            return;
        }
        
        cart[index].quantity = newQuantity;
        sessionStorage.setItem('cart', JSON.stringify(cart));
        displayCartItems();
    }
    
    // Remove item from cart
    function removeItem(index) {
        cart.splice(index, 1);
        sessionStorage.setItem('cart', JSON.stringify(cart));
        displayCartItems();
    }
    
    // Initialize the cart display
    displayCartItems();
</script>
</body>
</html>