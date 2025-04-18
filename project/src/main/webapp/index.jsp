<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Bookstore</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet"/>
    <style>
        .font-roboto {
            font-family: 'Roboto', sans-serif;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            min-width: 280px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1000;
        }
        .show-dropdown {
            display: block;
        }
        .notification-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background-color: #ef4444;
            color: white;
            border-radius: 9999px;
            width: 18px;
            height: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 10px;
        }
        .notification-item.unread {
            background-color: #f0f9ff;
        }
    </style>
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
    <div class="flex items-center space-x-4">
        <input class="border rounded px-2 py-1" placeholder="Search" type="text"/>
        
        <!-- Cart Icon -->
        <a href="cart.jsp" class="relative">
            <i class="fas fa-shopping-cart text-gray-700 text-xl"></i>
            <span class="notification-badge">0</span>
        </a>
        
        <!-- Notification Icon -->
        <a href="notifications.jsp" class="relative" id="notificationLink">
            <i class="fas fa-bell text-gray-700 text-xl"></i>
            <span id="notificationBadge" class="notification-badge" style="display: none;">0</span>
        </a>
        
        <c:choose>
            <c:when test="${not empty sessionScope.userId}">
                <!-- Profile Icon with Dropdown -->
                <div class="relative">
                    <button id="profileDropdownButton" class="focus:outline-none">
                        <i class="fas fa-user-circle text-gray-700 text-2xl"></i>
                    </button>
                    <div id="profileDropdown" class="dropdown-content bg-white rounded-md mt-2">
                        <div class="px-4 py-2 border-b border-gray-200">
                            <p class="text-sm font-semibold">${sessionScope.firstName} ${sessionScope.lastName}</p>
                            <p class="text-xs text-gray-500 truncate">${sessionScope.userEmail}</p>
                        </div>
                        <div class="py-1">
                            <a href="edit-profile.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">
                                <i class="fas fa-edit mr-2"></i>Edit Profile
                            </a>
                            <a href="LogoutServlet" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">
                                <i class="fas fa-sign-out-alt mr-2"></i>Logout
                            </a>
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <!-- Login Button -->
                <a href="Login.jsp" class="bg-black text-white px-4 py-1 rounded hover:bg-gray-800 transition duration-200">
                    Login
                </a>
            </c:otherwise>
        </c:choose>
    </div>
</header>

<!-- JavaScript for Notifications -->
<script>
    // Load notification count on page load
    document.addEventListener('DOMContentLoaded', function() {
        loadNotificationCount();
        
        // Check for new notifications every 30 seconds
        setInterval(loadNotificationCount, 30000);
    });

    // Function to load notification count
    function loadNotificationCount() {
        fetch('NotificationServlet?action=user&count=true')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                const badge = document.getElementById('notificationBadge');
                if (badge) {
                    badge.textContent = data.count;
                    badge.style.display = data.count > 0 ? 'flex' : 'none';
                    
                    // Show notification alert if count increased
                    const currentCount = parseInt(badge.textContent || '0');
                    const previousCount = parseInt(badge.dataset.prevCount || '0');
                    
                    if (currentCount > previousCount) {
                        showNewNotificationAlert(currentCount - previousCount);
                    }
                    
                    badge.dataset.prevCount = currentCount;
                }
            })
            .catch(error => {
                console.error('Error loading notification count:', error);
            });
    }

    // Show alert for new notifications
    function showNewNotificationAlert(count) {
        Swal.fire({
            title: 'New Notification' + (count > 1 ? 's' : ''),
            text: 'You have ' + count + ' new notification' + (count > 1 ? 's' : ''),
            icon: 'info',
            confirmButtonText: 'View',
            showCancelButton: true,
            cancelButtonText: 'Dismiss'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = 'notifications.jsp';
            }
        });
    }

    // Toggle profile dropdown
    document.getElementById('profileDropdownButton')?.addEventListener('click', function(e) {
        e.stopPropagation();
        const dropdown = document.getElementById('profileDropdown');
        dropdown.classList.toggle('show-dropdown');
    });

    // Close dropdown when clicking outside
    window.addEventListener('click', function() {
        const dropdown = document.getElementById('profileDropdown');
        if (dropdown && dropdown.classList.contains('show-dropdown')) {
            dropdown.classList.remove('show-dropdown');
        }
    });
</script>

<main class="p-8">
    <%-- Display success message if profile was updated --%>
    <c:if test="${not empty param.update and param.update == 'success'}">
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4" role="alert">
            <strong class="font-bold">Success!</strong>
            <span class="block sm:inline">Your profile has been updated successfully.</span>
        </div>
    </c:if>
    
    <section class="flex flex-col md:flex-row items-center space-y-4 md:space-y-0 md:space-x-8">
        <div class="md:w-1/2 space-y-4">
            <h1 class="text-4xl font-bold">
                Hello, welcome here to learn
            </h1>
            <h2 class="text-5xl font-bold text-pink-500">
                Something new every day!!!
            </h2>
            <p class="text-gray-700">
                Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley
            </p>
            <div class="flex space-x-2">
                <input class="border rounded px-2 py-1 flex-grow" placeholder="Email" type="email"/>
                <button class="bg-pink-500 text-white px-4 py-1 rounded hover:bg-pink-600 transition duration-200">
                    Get started
                </button>
            </div>
        </div>
        <div class="md:w-1/2">
            <img alt="Stack of books with glasses and a cup of coffee" class="w-full" height="400" src="https://storage.googleapis.com/a1aa/image/h0Ci9Qrx2LTrOLzp8xqtQ3xThPJfJJbilAoOOcemtek.jpg" width="400"/>
        </div>
    </section>
    <section class="mt-8">
        <h3 class="text-2xl font-bold">
            Free offered Course
        </h3>
        <p class="text-gray-700">
            It is a long established fact that a reader will be distracted by the readable content.
        </p>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mt-4">
            <div class="bg-white p-4 rounded shadow-md hover:shadow-lg transition duration-200">
                <img alt="Gaming Book" class="w-full" height="200" src="https://storage.googleapis.com/a1aa/image/bANFCq3mQF1Q9yCEBcznDa9YMDKUISqAjlVOFqe5lRg.jpg" width="200"/>
                <div class="mt-4">
                    <h4 class="text-xl font-bold">
                        Gaming Book
                        <span class="bg-red-500 text-white text-xs px-2 py-1 rounded">
                            Free
                        </span>
                    </h4>
                    <p class="text-gray-700">
                        Lorem Ipsum is simple dummy
                    </p>
                    <div class="flex justify-between items-center mt-2">
                        <span class="text-gray-700">
                            Rs 200
                        </span>
                        <button class="bg-pink-500 text-white px-4 py-1 rounded hover:bg-pink-600 transition duration-200" onclick="addToCart('Gaming Book', 200)">
                            Buy now
                        </button>
                    </div>
                </div>
            </div>
            <div class="bg-white p-4 rounded shadow-md hover:shadow-lg transition duration-200">
                <img alt="Gaming Book" class="w-full" height="200" src="https://storage.googleapis.com/a1aa/image/bANFCq3mQF1Q9yCEBcznDa9YMDKUISqAjlVOFqe5lRg.jpg" width="200"/>
                <div class="mt-4">
                    <h4 class="text-xl font-bold">
                        Science 
                        <span class="bg-red-500 text-white text-xs px-2 py-1 rounded">
                            Free
                        </span>
                    </h4>
                    <p class="text-gray-700">
                        Lorem Ipsum is simple dummy
                    </p>
                    <div class="flex justify-between items-center mt-2">
                        <span class="text-gray-700">
                            Rs 200
                        </span>
                        <button class="bg-pink-500 text-white px-4 py-1 rounded hover:bg-pink-600 transition duration-200" onclick="addToCart('Gaming Book', 200)">
                            Buy now
                        </button>
                    </div>
                </div>
            </div>
            <div class="bg-white p-4 rounded shadow-md hover:shadow-lg transition duration-200">
                <img alt="Gaming Book" class="w-full" height="200" src="https://storage.googleapis.com/a1aa/image/bANFCq3mQF1Q9yCEBcznDa9YMDKUISqAjlVOFqe5lRg.jpg" width="200"/>
                <div class="mt-4">
                    <h4 class="text-xl font-bold">
                        Programming Book
                        <span class="bg-red-500 text-white text-xs px-2 py-1 rounded">
                            Free
                        </span>
                    </h4>
                    <p class="text-gray-700">
                        Lorem Ipsum is simple dummy
                    </p>
                    <div class="flex justify-between items-center mt-2">
                        <span class="text-gray-700">
                            Rs 200
                        </span>
                        <button class="bg-pink-500 text-white px-4 py-1 rounded hover:bg-pink-600 transition duration-200" onclick="addToCart('Gaming Book', 200)">
                            Buy now
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>
</main>
<footer class="bg-gray-800 text-white py-8">
    <div class="container mx-auto px-4 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        <div>
            <h4 class="font-bold mb-4">About</h4>
            <ul>
                <li><a href="#" class="text-gray-400 hover:text-white transition duration-200">Contact</a></li>
                <li><a href="#" class="text-gray-400 hover:text-white transition duration-200">Careers</a></li>
                <li><a href="#" class="text-gray-400 hover:text-white transition duration-200">Press</a></li>
                <li><a href="#" class="text-gray-400 hover:text-white transition duration-200">Corporate Company</a></li>
            </ul>
        </div>
        <div>
            <h4 class="font-bold mb-4">Group companies</h4>
            <ul>
                <li><a href="#" class="text-gray-400 hover:text-white transition duration-200">Myntra</a></li>
                <li><a href="#" class="text-gray-400 hover:text-white transition duration-200">Cleartrip</a></li>
                <li><a href="#" class="text-gray-400 hover:text-white transition duration-200">Shopsy</a></li>
            </ul>
        </div>
        <div>
            <h4 class="font-bold mb-4">Help</h4>
            <ul>
                <li><a href="#" class="text-gray-400 hover:text-white transition duration-200">Payments</a></li>
                <li><a href="#" class="text-gray-400 hover:text-white transition duration-200">Shipping</a></li>
                <li><a href="#" class="text-gray-400 hover:text-white transition duration-200">Cancellation &amp; Return</a></li>
                <li><a href="#" class="text-gray-400 hover:text-white transition duration-200">FAQ</a></li>
            </ul>
        </div>
        <div>
            <h4 class="font-bold mb-4">Others</h4>
            <ul>
                <li><a href="#" class="text-gray-400 hover:text-white transition duration-200">Become a seller</a></li>
                <li><a href="#" class="text-gray-400 hover:text-white transition duration-200">Advertise</a></li>
                <li><a href="#" class="text-gray-400 hover:text-white transition duration-200">Gift Cards</a></li>
            </ul>
        </div>
    </div>
    <div class="text-center mt-8">
        <p class="text-gray-500">Copyright © 2025 – All rights reserved by @k University</p>
    </div>
</footer>
<script>
    function addToCart(productName, price) {
        alert(productName + ' has been added to your cart for Rs ' + price);
    }
</script>
</body>
</html>