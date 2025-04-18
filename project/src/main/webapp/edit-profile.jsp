<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Profile</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body class="bg-pink-100 min-h-screen font-sans">

<!-- Header -->
<header class="bg-white shadow p-4 flex justify-between items-center">
    <div class="text-2xl font-bold">Bookstore</div>
    <div>
        <a href="index.jsp" class="text-gray-700 hover:text-pink-500">Home</a>
    </div>
</header>

<!-- Main Content -->
<main class="max-w-xl mx-auto bg-white mt-10 p-6 rounded shadow">
    <h1 class="text-2xl font-bold text-center mb-6">Edit Your Profile</h1>

    <form action="UpdateProfileServlet" method="post" class="space-y-4">
        <input type="hidden" name="userId" value="${sessionScope.userId}"/>

        <div>
            <label for="firstName" class="block text-gray-700 font-semibold">First Name</label>
            <input type="text" id="firstName" name="firstName" value="${sessionScope.firstName}"
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-pink-500" required>
        </div>

        <div>
            <label for="lastName" class="block text-gray-700 font-semibold">Last Name</label>
            <input type="text" id="lastName" name="lastName" value="${sessionScope.lastName}"
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-pink-500" required>
        </div>

        <div>
            <label for="email" class="block text-gray-700 font-semibold">Email</label>
            <input type="email" id="email" name="email" value="${sessionScope.userEmail}"
                   class="w-full px-4 py-2 border rounded focus:outline-none focus:ring-2 focus:ring-pink-500" required>
        </div>

        <div class="flex justify-end space-x-4">
            <a href="index.jsp" class="px-4 py-2 bg-gray-200 text-gray-800 rounded hover:bg-gray-300">Cancel</a>
            <button type="submit" class="px-6 py-2 bg-pink-500 text-white rounded hover:bg-pink-600">Save Changes</button>
        </div>
    </form>
</main>

</body>
</html>
