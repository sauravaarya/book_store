import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Hardcoded admin credentials
    private static final String ADMIN_EMAIL = "admin@example.com";
    private static final String ADMIN_PASSWORD = "admin123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        HttpSession session = request.getSession();

        System.out.println("Login attempt with Email: " + email + " | Password: " + password);

        // Admin login
        if (ADMIN_EMAIL.equals(email) && ADMIN_PASSWORD.equals(password)) {
            session.setAttribute("userEmail", email);
            session.setAttribute("isAdmin", true);
            session.setMaxInactiveInterval(30 * 60);
            response.sendRedirect("admin.jsp");
            return;
        }

        // Database connection
        String dbURL = "jdbc:mysql://localhost:3306/bookstore";
        String dbUser = "root";
        String dbPass = "";

        try (Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass)) {

            String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, email);
                stmt.setString(2, password); // Note: for plaintext only

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        session.setAttribute("firstName", rs.getString("first_name"));
                        session.setAttribute("lastName", rs.getString("last_name"));
                        session.setAttribute("userEmail", email);
                        session.setAttribute("isAdmin", false);
                        session.setMaxInactiveInterval(30 * 60); // 30 minutes

                        String redirectURL = "index.jsp";
                        if ("success".equals(request.getParameter("registration"))) {
                            redirectURL = "index.jsp?welcome=new";
                        }

                        System.out.println("Login successful for user: " + email);
                        response.sendRedirect(redirectURL);
                    } else {
                        System.out.println("Login failed for email: " + email);
                        response.sendRedirect("Login.jsp?error=invalid");
                    }
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
