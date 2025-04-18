<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
        <div class="bg-pink-600 text-white p-8 md:w-1/2 flex flex-col items-center justify-center">
            <h1 class="text-4xl font-bold mb-4">Welcome Back!</h1>
            <p class="mb-6 text-lg">Log in to continue exploring your favorite books.</p>
            <img src="https://storage.googleapis.com/a1aa/image/HrPFnru2GcxJBy7slLjKYvZuP-iQ-NYTWP1ZAyc1Xwc.jpg" alt="Illustration" class="w-3/4 rounded-lg shadow-md" width="300" height="200">
        </div>
        <div class="p-8 md:w-1/2">
            <h2 class="text-3xl font-bold mb-6 text-gray-800">Login to Your Account</h2>

            <!-- Display error message if login fails -->
            <% if (request.getParameter("error") != null) { %>
                <p class="text-red-500 text-sm mb-4">Invalid email or password. Please try again.</p>
            <% } %>

            <form id="login-form" action="LoginServlet" method="POST" class="space-y-4">
                <div>
                    <label for="email" class="block text-sm font-semibold text-gray-700">Your email</label>
                    <input type="email" id="email" name="email" class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-pink-600" required>
                    <p id="email-error" class="text-red-500 text-sm hidden">Please enter a valid email address.</p>
                </div>
                <div>
                    <label for="password" class="block text-sm font-semibold text-gray-700">Password</label>
                    <input type="password" id="password" name="password" class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-pink-600" required>
                    <p id="password-error" class="text-red-500 text-sm hidden">Password is required.</p>
                </div>
                
                <div class="flex justify-between text-sm">
                    <a href="forgotpass.jsp" class="text-blue-500 hover:underline">Forgot Password?</a>
                    <span>Don't have an account? <a href="register.jsp" class="text-blue-500 hover:underline">Create one</a></span>
                </div>

                <button type="submit" class="w-full bg-pink-600 text-white py-2 rounded font-semibold hover:bg-pink-700 transition duration-200">Login</button>
            </form>
        </div>
    </div>

    <script>
        document.getElementById('login-form').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent form submission
            
            // Hide error messages
            document.getElementById('email-error').classList.add('hidden');
            document.getElementById('password-error').classList.add('hidden');
            
            let valid = true;

            // Email validation
            const email = document.getElementById('email').value.trim();
            const emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
            if (!email || !emailPattern.test(email)) {
                valid = false;
                document.getElementById('email-error').classList.remove('hidden');
            }

            // Password validation
            const password = document.getElementById('password').value.trim();
            if (!password) {
                valid = false;
                document.getElementById('password-error').classList.remove('hidden');
            }

            // Submit the form if valid
            if (valid) {
                this.submit(); // Submit the form if validation passes
            }
        });
    </script>
</body>
</html>
