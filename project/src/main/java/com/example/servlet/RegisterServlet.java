package com.example.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database Connection Class
    private static class DBConnection {
        private static final String URL = "jdbc:mysql://localhost:3306/bookstore";
        private static final String USER = "root";  
        private static final String PASSWORD = "";  

        public static Connection getConnection() throws SQLException {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL Driver
                return DriverManager.getConnection(URL, USER, PASSWORD);
            } catch (ClassNotFoundException e) {
                throw new SQLException("MySQL Driver not found", e);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate input
        if (firstName == null || firstName.isEmpty() ||
            lastName == null || lastName.isEmpty() ||
            email == null || email.isEmpty() ||
            password == null || password.length() < 6) {
            
            out.println("<h3 style='color:red;'>All fields are required, and password must be at least 6 characters.</h3>");
            request.getRequestDispatcher("CreateAccount.jsp").include(request, response);
            return;
        }

        try (Connection conn = DBConnection.getConnection()) {
            // Check if email already exists
            String checkEmailSQL = "SELECT email FROM users WHERE email = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkEmailSQL);
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                // Email already exists, show message
                out.println("<h3 style='color:red;'>Email already registered. Please use a different email.</h3>");
                request.getRequestDispatcher("CreateAccount.jsp").include(request, response);
                return;
            }

            // Insert into database
            String sql = "INSERT INTO users (first_name, last_name, email, password) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setString(4, password); // TODO: Encrypt password before storing

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("Login.jsp"); // Redirect to login page
            } else {
                out.println("<h3 style='color:red;'>Registration failed. Try again.</h3>");
                request.getRequestDispatcher("CreateAccount.jsp").include(request, response);
            }
        } catch (SQLException e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        }
    }
}
