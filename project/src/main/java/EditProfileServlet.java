

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/UpdateProfileServlet")
public class EditProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static class DBConnection {
        private static final String URL = "jdbc:mysql://localhost:3306/bookstore";
        private static final String USER = "root";
        private static final String PASSWORD = "";

        public static Connection getConnection() throws SQLException {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                return DriverManager.getConnection(URL, USER, PASSWORD);
            } catch (ClassNotFoundException e) {
                throw new SQLException("Driver not found", e);
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("userId"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE users SET first_name=?, last_name=?, email=? WHERE id=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, firstName);
            stmt.setString(2, lastName);
            stmt.setString(3, email);
            stmt.setInt(4, userId);

            int updated = stmt.executeUpdate();

            if (updated > 0) {
                // Update session attributes
                HttpSession session = request.getSession();
                session.setAttribute("firstName", firstName);
                session.setAttribute("lastName", lastName);
                session.setAttribute("userEmail", email);

                response.sendRedirect("index.jsp?update=success");
            } else {
                response.sendRedirect("edit-profile.jsp?error=notfound");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("edit-profile.jsp?error=db");
        }
    }
}
