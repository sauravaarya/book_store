<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <title>Manage Orders - Admin Panel</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-roboto">
<main class="flex-1 p-8">
    <h1 class="text-3xl font-bold mb-4 text-pink-600">Manage Orders</h1>
    <div class="bg-white p-6 rounded-lg shadow-lg">
        <h2 class="text-xl font-bold text-pink-600 mb-4">Order List</h2>
        <table class="min-w-full bg-white">
            <thead>
                <tr class="bg-gray-200 text-gray-600">
                    <th class="py-2 px-4 border">Customer Name</th>
                    <th class="py-2 px-4 border">Email</th>
                    <th class="py-2 px-4 border">Phone Number</th>
                    <th class="py-2 px-4 border">Book Title</th>
                    <th class="py-2 px-4 border">Total Price</th>
                    <th class="py-2 px-4 border">Address</th>
                    <th class="py-2 px-4 border">City</th>
                    <th class="py-2 px-4 border">State</th>
                    <th class="py-2 px-4 border">Country</th>
                    <th class="py-2 px-4 border">Payment Method</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Load the MySQL JDBC driver
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Establish a connection to the database
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "");

                        // Create a statement
                        stmt = conn.createStatement();

                        // Execute the query
                        String sql = "SELECT * FROM orders";
                        rs = stmt.executeQuery(sql);

                        // Display the results
                        while (rs.next()) {
                            String customerName = rs.getString("customer_name");
                            String email = rs.getString("email");
                            String phoneNumber = rs.getString("phone_number");
                            String bookTitle = rs.getString("book_title");
                            String bookPrice = rs.getString("book_price");
                            String address = rs.getString("address");
                            String address2 = rs.getString("address2");
                            String city = rs.getString("city");
                            String state = rs.getString("state");
                            String country = rs.getString("country");
                            String paymentMethod = rs.getString("payment_method");
                %>
                <tr class="hover:bg-gray-50">
                    <td class="py-2 px-4 border"><%= customerName %></td>
                    <td class="py-2 px-4 border"><%= email %></td>
                    <td class="py-2 px-4 border"><%= phoneNumber %></td>
                    <td class="py-2 px-4 border"><%= bookTitle %></td>
                    <td class="py-2 px-4 border">Rs <%= bookPrice %></td>
                    <td class="py-2 px-4 border"><%= address %><%= address2 != null ? ", " + address2 : "" %></td>
                    <td class="py-2 px-4 border"><%= city %></td>
                    <td class="py-2 px-4 border"><%= state %></td>
                    <td class="py-2 px-4 border"><%= country %></td>
                    <td class="py-2 px-4 border"><%= paymentMethod %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Close the resources
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    }
                %>
            </tbody>
        </table>
    </div>
</main>
</body>
</html>