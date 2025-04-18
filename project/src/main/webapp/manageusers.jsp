<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<%@ page import="java.sql.*" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            background: linear-gradient(to right, #0f0c29, #302b63, #24243e);
            color: #e2e8f0;
        }
        .glassmorphism {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border-radius: 12px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        .table-row:hover {
            background: rgba(255, 255, 255, 0.05);
            transform: scale(1.02);
            transition: all 0.3s ease;
        }
        .fab {
            position: fixed;
            bottom: 2rem;
            right: 2rem;
            background: #4f46e5;
            color: white;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 12px rgba(79, 70, 229, 0.3);
            transition: all 0.3s ease;
        }
        .fab:hover {
            background: #4338ca;
            transform: scale(1.1);
        }
    </style>
</head>
<body class="flex flex-col items-center justify-center min-h-screen p-4">
    <div class="glassmorphism w-full max-w-6xl p-8">
        <h1 class="text-4xl font-bold mb-8 text-center text-white">Manage Users</h1>
        <div class="overflow-x-auto rounded-lg">
            <table class="min-w-full table-auto border-collapse">
                <thead>
                    <tr class="bg-gray-800">
                        <th class="py-4 px-6 border-b text-left">First Name</th>
                        <th class="py-4 px-6 border-b text-left">Last Name</th>
                        <th class="py-4 px-6 border-b text-left">Email</th>
                        <th class="py-4 px-6 border-b text-left">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        // Database connection settings
                        String dbURL = "jdbc:mysql://localhost:3306/bookstore";
                        String dbUser = "root";
                        String dbPass = "";

                        Connection conn = null;
                        PreparedStatement stmt = null;
                        ResultSet rs = null;

                        try {
                            // Load MySQL JDBC driver
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            // Establish a connection to the database
                            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

                            // Fetch all users
                            String sql = "SELECT * FROM users";
                            stmt = conn.prepareStatement(sql);
                            rs = stmt.executeQuery();

                            while (rs.next()) {
                                String firstName = rs.getString("first_name");
                                String lastName = rs.getString("last_name");
                                String email = rs.getString("email");
                    %>
                    <tr class="table-row">
                        <td class="py-4 px-6 border-b"><%= firstName %></td>
                        <td class="py-4 px-6 border-b"><%= lastName %></td>
                        <td class="py-4 px-6 border-b"><%= email %></td>
                        <td class="py-4 px-6 border-b">
                            <div class="flex space-x-4">
                                <a href="#" class="text-blue-400 hover:text-blue-600 transition duration-300">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <a href="#" class="text-red-400 hover:text-red-600 transition duration-300">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </div>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (SQLException | ClassNotFoundException ex) {
                            ex.printStackTrace();
                        } finally {
                            // Close resources
                            try {
                                if (rs != null) rs.close();
                                if (stmt != null) stmt.close();
                                if (conn != null) conn.close();
                            } catch (SQLException e) {
                                e.printStackTrace();
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Floating Action Button (FAB) -->
    <a href="register.jsp" class="fab">
        <i class="fas fa-plus text-2xl"></i>
    </a>
</body>
</html>