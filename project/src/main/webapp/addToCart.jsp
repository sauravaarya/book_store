<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background: linear-gradient(to right, #f8cdda, #1d2b64);
        }
    </style>
</head>
<body class="flex flex-col items-center justify-center min-h-screen">

    <div class="bg-white shadow-lg rounded-lg w-full max-w-4xl p-8">
        <h1 class="text-3xl font-bold mb-6 text-gray-800">Manage Users</h1>
        <div class="mb-4">
            <a href="createAccount.jsp" class="bg-pink-600 text-white py-2 px-4 rounded hover:bg-pink-700 transition duration-200">Add New User</a>
        </div>
        <table class="min-w-full bg-white border border-gray-300">
            <thead>
                <tr class="bg-pink-600 text-white">
                    <th class="py-2 px-4 border-b">First Name</th>
                    <th class="py-2 px-4 border-b">Last Name</th>
                    <th class="py-2 px-4 border-b">Email</th>
                    <th class="py-2 px-4 border-b">Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Sample User Data (Replace with dynamic data from your database) -->
                <tr>
                    <td class="py-2 px-4 border-b">John</td>
                    <td class="py-2 px-4 border-b">Doe</td>
                    <td class="py-2 px-4 border-b">john.doe@example.com</td>
                    <td class="py-2 px-4 border-b">
                        <a href="editUser .jsp?id=1" class="text-blue-500 hover:underline">Edit</a>
                        <a href="deleteUser ?id=1" class="text-red-500 hover:underline ml-4">Delete</a>
                    </td>
                </tr>
                <tr>
                    <td class="py-2 px-4 border-b">Jane</td>
                    <td class="py-2 px-4 border-b">Smith</td>
                    <td class="py-2 px-4 border-b">jane.smith@example.com</td>
                    <td class="py-2 px-4 border-b">
                        <a href="editUser .jsp?id=2" class="text-blue-500 hover:underline">Edit</a>
                        <a href="deleteUser ?id=2" class="text-red-500 hover:underline ml-4">Delete</a>
                    </td>
                </tr>
                <!-- Add more user rows as needed -->
            </tbody>
        </table>
    </div>

</body>
</html>