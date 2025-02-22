import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;
 // Make sure to import your UserDAO class
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServelet")  // Servlet mapping
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetching the input values from the login form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // UserDAO for database validation
        UserDAO userDAO = new UserDAO();
        boolean isValidUser = userDAO.validateUser(username, password);

        if (isValidUser) {
            // If login is successful, create a session and redirect to the dashboard
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            response.sendRedirect("pages/dashboard.jsp");  // Redirect to dashboard
        } else {
            // If login fails, redirect back to login with an error message
            response.sendRedirect("pages/login.jsp?error=1");
        }
    }
}
