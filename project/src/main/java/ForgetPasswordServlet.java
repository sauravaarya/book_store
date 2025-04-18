

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.Random;

import com.mysql.cj.Session;

/**
 * Servlet implementation class ForgetPasswordServlet
 */
@WebServlet("/ForgetPasswordServlet")
public class ForgetPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ForgetPasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

		PrintWriter out = response.getWriter();
		        String email = request.getParameter("email");

		        // Database Connection
		        String url = "jdbc:mysql://localhost:3306/bookstore";
		        String user = "root";
		        String password = "PASSWORD";

		        try {
		            Class.forName("com.mysql.cj.jdbc.Driver");
		            Connection con = DriverManager.getConnection(url, user, password);

		            // Check if email exists in DB
		            PreparedStatement ps = con.prepareStatement("SELECT * FROM users NAME WHERE email=?");
		            ps.setString(1, email);
		            ResultSet rs = ps.executeQuery();

		            if (rs.next()) {
		                // Generate OTP
		                Random rand = new Random();
		                int otp = 100000 + rand.nextInt(900000); // 6-digit OTP
		                
		                // Save OTP in session
		                HttpSession session = request.getSession();
		                session.setAttribute("otp", otp);
		                session.setAttribute("email", email);
		                
		                // Send OTP via email
		                final String senderEmail = "abcd@gmail.com";  // SMTP email
		                final String senderPassword = "yyee bbee ssdd";  // SMTP app password
		                
		                Properties props = new Properties();
		                props.put("mail.smtp.host", "smtp.gmail.com");
		                props.put("mail.smtp.port", "587");
		                props.put("mail.smtp.auth", "true");
		                props.put("mail.smtp.starttls.enable", "true");

		                Session mailSession = Session.getInstance(props, new Authenticator() {
		                    protected PasswordAuthentication getPasswordAuthentication() {
		                        return new PasswordAuthentication(senderEmail, senderPassword);
		                    }
		                });

		                try {
		                    Message message = new MimeMessage(mailSession);
		                    message.setFrom(new InternetAddress(senderEmail));
		                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
		                    message.setSubject("Password Reset OTP");
		                    message.setText("Your OTP for password reset is: " + otp);
		                    
		                    Transport.send(message);
		                    response.sendRedirect("VerifyOTP.jsp"); // Redirect to OTP verification page
		                } catch (MessagingException e) {
		                    out.println("Error sending email: " + e.getMessage());
		                }
		            } else {
		                out.println("Email not registered!");
		            }
		            con.close();
		        } catch (Exception e) {
		            out.println("Database Error: " + e.getMessage());
		        }
	}
}

