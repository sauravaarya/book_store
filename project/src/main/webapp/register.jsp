<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Account</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background: linear-gradient(to right, #f8cdda, #1d2b64);
        }
    </style>
</head>
<body class="flex items-center justify-center min-h-screen">
    <div class="bg-white shadow-lg rounded-lg flex flex-col md:flex-row w-full max-w-4xl overflow-hidden">
        <!-- Left Section -->
        <div class="bg-pink-600 text-white p-8 md:w-1/2 flex flex-col items-center justify-center">
            <h1 class="text-4xl font-bold mb-4">Welcome to Book Store</h1>
            <p class="mb-6 text-lg">Join us and explore a world of books!</p>
            <img src="https://storage.googleapis.com/a1aa/image/HrPFnru2GcxJBy7slLjKYvZuP-iQ-NYTWP1ZAyc1Xwc.jpg" 
                 alt="Illustration" 
                 class="w-3/4 rounded-lg shadow-md" 
                 width="300" height="200">
        </div>
        <!-- Right Section -->
        <div class="p-8 md:w-1/2">
            <h2 class="text-3xl font-bold mb-6 text-gray-800">Create Your Account</h2>
            <form id="signup-form" action="RegisterServlet" method="POST" class="space-y-4">
                <!-- First Name and Last Name -->
                <div class="flex space-x-4">
                    <div class="flex-1">
                        <label for="first-name" class="block text-sm font-semibold text-gray-700">First name</label>
                        <input type="text" id="first-name" name="firstName" 
                               class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-pink-600" required>
                        <p id="first-name-error" class="text-red-500 text-sm hidden">First name is required.</p>
                    </div>
                    <div class="flex-1">
                        <label for="last-name" class="block text-sm font-semibold text-gray-700">Last name</label>
                        <input type="text" id="last-name" name="lastName" 
                               class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-pink-600" required>
                        <p id="last-name-error" class="text-red-500 text-sm hidden">Last name is required.</p>
                    </div>
                </div>
                <!-- Email -->
                <div>
                    <label for="email" class="block text-sm font-semibold text-gray-700">Your email</label>
                    <input type="email" id="email" name="email" 
                           class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-pink-600" required>
                    <p id="email-error" class="text-red-500 text-sm hidden">Please enter a valid email address.</p>
                </div>
                <!-- Password -->
                <div>
                    <label for="password" class="block text-sm font-semibold text-gray-700">Password</label>
                    <input type="password" id="password" name="password" 
                           class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-pink-600" required>
                    <p id="password-error" class="text-red-500 text-sm hidden">Password is required and should be at least 6 characters long.</p>
                </div>
                <!-- Login Link -->
                <div class="text-right text-sm">
                    <span>Already have an account?</span>
                    <a href="Login.jsp" class="text-blue-500 hover:underline">Login</a>
                </div>
                <!-- Submit Button -->
                <button type="submit" class="w-full bg-pink-600 text-white py-2 rounded font-semibold hover:bg-pink-700 transition duration-200">
                    Sign Up
                </button>
            </form>
        </div>
    </div>

    <!-- JavaScript for Form Validation -->
    <script>
        document.getElementById('signup-form').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent form submission

            // Hide all error messages
            document.getElementById('first-name-error').classList.add('hidden');
            document.getElementById('last-name-error').classList.add('hidden');
            document.getElementById('email-error').classList.add('hidden');
            document.getElementById('password-error').classList.add('hidden');

            let valid = true;

            // First Name validation
            const firstName = document.getElementById('first-name').value.trim();
            if (!firstName) {
                valid = false;
                document.getElementById('first-name-error').classList.remove('hidden');
            }

            // Last Name validation
            const lastName = document.getElementById('last-name').value.trim();
            if (!lastName) {
                valid = false;
                document.getElementById('last-name-error').classList.remove('hidden');
            }

            // Email validation
            const email = document.getElementById('email').value.trim();
            const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!email || !emailPattern.test(email)) {
                valid = false;
                document.getElementById('email-error').classList.remove('hidden');
            }

            // Password validation
            const password = document.getElementById('password').value.trim();
            if (!password || password.length < 6) {
                valid = false;
                document.getElementById('password-error').classList.remove('hidden');
            }

            // If all validations pass, submit the form
            if (valid) {
                this.submit();
            }
        });
    </script>
</body>
</html>