import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.http.HttpSession;

@WebServlet("/manageBook")
@MultipartConfig
public class BookManagementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("delete".equals(action)) {
            deleteBook(request, response);
        } else if ("edit".equals(action)) {
            editBook(request, response);
        } else {
            addBook(request, response);
        }
    }

    private void addBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve book details
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String price = request.getParameter("price");
        String category = request.getParameter("category");
        Part imagePart = request.getPart("image");
        
        // Generate unique filename for the image
        String fileName = System.currentTimeMillis() + "_" + imagePart.getSubmittedFileName();
        String imagePath = "images/" + fileName;

        // Save image to server
        String appPath = request.getServletContext().getRealPath("");
        File fileSaveDir = new File(appPath + "images");
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        
        try (InputStream inputStream = imagePart.getInputStream();
             FileOutputStream outputStream = new FileOutputStream(new File(fileSaveDir, fileName))) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }

        // Add to application context (shared across all users)
        ServletContext context = getServletContext();
        List<String[]> books = (List<String[]>) context.getAttribute("allBooks");
        if (books == null) {
            books = new ArrayList<>();
        }
        books.add(new String[]{title, author, price, category, imagePath});
        context.setAttribute("allBooks", books);

        // Also keep in session for admin
        HttpSession session = request.getSession();
        session.setAttribute("books", books);

        response.sendRedirect("managebook.jsp");
    }

    private void deleteBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        
        // Remove from application context
        ServletContext context = getServletContext();
        List<String[]> books = (List<String[]>) context.getAttribute("allBooks");
        if (books != null) {
            books.removeIf(book -> book[0].equals(title));
            context.setAttribute("allBooks", books);
        }
        
        // Also update session
        HttpSession session = request.getSession();
        session.setAttribute("books", books);
        
        response.sendRedirect("managebook.jsp");
    }

    private void editBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oldTitle = request.getParameter("oldTitle");
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String price = request.getParameter("price");
        String category = request.getParameter("category");
        Part imagePart = request.getPart("image");
        
        // Update in application context
        ServletContext context = getServletContext();
        List<String[]> books = (List<String[]>) context.getAttribute("allBooks");
        
        if (books != null) {
            for (String[] book : books) {
                if (book[0].equals(oldTitle)) {
                    book[0] = title;
                    book[1] = author;
                    book[2] = price;
                    book[3] = category;
                    
                    if (imagePart != null && imagePart.getSize() > 0) {
                        // Generate unique filename for the new image
                        String fileName = System.currentTimeMillis() + "_" + imagePart.getSubmittedFileName();
                        String imagePath = "images/" + fileName;
                        book[4] = imagePath;
                        
                        // Save new image
                        String appPath = request.getServletContext().getRealPath("");
                        File fileSaveDir = new File(appPath + "images");
                        if (!fileSaveDir.exists()) {
                            fileSaveDir.mkdir();
                        }
                        try (InputStream inputStream = imagePart.getInputStream();
                             FileOutputStream outputStream = new FileOutputStream(new File(fileSaveDir, fileName))) {
                            byte[] buffer = new byte[1024];
                            int bytesRead;
                            while ((bytesRead = inputStream.read(buffer)) != -1) {
                                outputStream.write(buffer, 0, bytesRead);
                            }
                        }
                    }
                    break;
                }
            }
            context.setAttribute("allBooks", books);
        }
        
        // Also update session
        HttpSession session = request.getSession();
        session.setAttribute("books", books);
        
        response.sendRedirect("managebook.jsp");
    }
}