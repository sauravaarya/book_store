

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/NotificationServlet")
public class NotificationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Embedded Notification class
    public class Notification {
        private int id;
        private Integer userId;
        private String message;
        private Timestamp createdAt;
        private boolean isRead;

        public Notification() {}

        public Notification(int id, Integer userId, String message, Timestamp createdAt, boolean isRead) {
            this.id = id;
            this.userId = userId;
            this.message = message;
            this.createdAt = createdAt;
            this.isRead = isRead;
        }

        // Getters and Setters
        public int getId() { return id; }
        public void setId(int id) { this.id = id; }
        public Integer getUserId() { return userId; }
        public void setUserId(Integer userId) { this.userId = userId; }
        public String getMessage() { return message; }
        public void setMessage(String message) { this.message = message; }
        public Timestamp getCreatedAt() { return createdAt; }
        public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }
        public boolean isRead() { return isRead; }
        public void setRead(boolean isRead) { this.isRead = isRead; }
    }

    // Database configuration
    private String jdbcURL = "jdbc:mysql://localhost:3306/bookstore";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");
        
        try {
            if ("get".equals(action)) {
                List<Notification> notifications = getUnreadNotifications(userId);
                request.setAttribute("notifications", notifications);
                
                if (userId != null) {
                    markAsRead(userId);
                }
                
                request.getRequestDispatcher("notifications.jsp").forward(request, response);
            } else if ("count".equals(action)) {
                int count = getUnreadNotificationCount(userId);
                
                response.setContentType("application/json");
                PrintWriter out = response.getWriter();
                out.print("{\"count\": " + count + "}");
                out.flush();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        try {
            if ("add".equals(action)) {
                String message = request.getParameter("message");
                String userIdParam = request.getParameter("userId");
                Integer userId = userIdParam == null || userIdParam.isEmpty() ? null : Integer.parseInt(userIdParam);
                
                Notification notification = new Notification();
                notification.setUserId(userId);
                notification.setMessage(message);
                
                addNotification(notification);
                
                response.sendRedirect("admin.jsp?notification=added");
            }
        } catch (SQLException | NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    // DAO methods embedded in the servlet
    private void addNotification(Notification notification) throws SQLException {
        String sql = "INSERT INTO notifications (user_id, message) VALUES (?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            if (notification.getUserId() != null) {
                statement.setInt(1, notification.getUserId());
            } else {
                statement.setNull(1, Types.INTEGER);
            }
            statement.setString(2, notification.getMessage());
            statement.executeUpdate();
        }
    }

    private List<Notification> getUnreadNotifications(Integer userId) throws SQLException {
        List<Notification> notifications = new ArrayList<>();
        String sql = "SELECT * FROM notifications WHERE (user_id = ? OR user_id IS NULL) AND is_read = FALSE ORDER BY created_at DESC";
        
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            if (userId != null) {
                statement.setInt(1, userId);
            } else {
                statement.setNull(1, Types.INTEGER);
            }
            
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
                Notification notification = new Notification(
                    rs.getInt("id"),
                    rs.getObject("user_id", Integer.class),
                    rs.getString("message"),
                    rs.getTimestamp("created_at"),
                    rs.getBoolean("is_read")
                );
                notifications.add(notification);
            }
        }
        return notifications;
    }

    private void markAsRead(Integer userId) throws SQLException {
        String sql = "UPDATE notifications SET is_read = TRUE WHERE user_id = ? AND is_read = FALSE";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, userId);
            statement.executeUpdate();
        }
    }

    private int getUnreadNotificationCount(Integer userId) throws SQLException {
        String sql = "SELECT COUNT(*) FROM notifications WHERE (user_id = ? OR user_id IS NULL) AND is_read = FALSE";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {
            if (userId != null) {
                statement.setInt(1, userId);
            } else {
                statement.setNull(1, Types.INTEGER);
            }
            
            ResultSet rs = statement.executeQuery();
            return rs.next() ? rs.getInt(1) : 0;
        }
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}