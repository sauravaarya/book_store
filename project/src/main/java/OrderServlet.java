 import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/bookstore";
    private static final String DB_USER = "root"; // Default XAMPP MySQL username
    private static final String DB_PASSWORD = ""; // Default XAMPP MySQL password

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String customerName = request.getParameter("customerName");
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String paymentMethod = request.getParameter("paymentMethod");
        String address = request.getParameter("address");
        String address2 = request.getParameter("address2");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String country = request.getParameter("country");
        String bookTitle = request.getParameter("title");
        String bookPrice = request.getParameter("price");

        // Save order to the database
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare the SQL query
            String sql = "INSERT INTO orders (customer_name, phone_number, email, payment_method, address, address2, city, state, country, book_title, book_price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);

            // Set the parameters
            pstmt.setString(1, customerName);
            pstmt.setString(2, phoneNumber);
            pstmt.setString(3, email);
            pstmt.setString(4, paymentMethod);
            pstmt.setString(5, address);
            pstmt.setString(6, address2);
            pstmt.setString(7, city);
            pstmt.setString(8, state);
            pstmt.setString(9, country);
            pstmt.setString(10, bookTitle);
            pstmt.setString(11, bookPrice);

            // Execute the query
            pstmt.executeUpdate();

            // Close the connection
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Forward to order.jsp to display the order summary
        request.setAttribute("customerName", customerName);
        request.setAttribute("bookTitle", bookTitle);
        request.setAttribute("bookPrice", bookPrice);
        request.setAttribute("address", address);
        request.setAttribute("city", city);
        request.setAttribute("state", state);
        request.setAttribute("country", country);
        request.setAttribute("phoneNumber", phoneNumber);
        request.setAttribute("email", email);
        request.getRequestDispatcher("order.jsp").forward(request, response);
    }
}