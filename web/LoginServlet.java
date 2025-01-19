import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // In-memory user database (username-password map)
    private static Map<String, String> userDatabase = new HashMap<>();

    @Override
    public void init() throws ServletException {
        super.init();
        // Prepopulate the user database with a test user
        userDatabase.put("testuser", "password123");
    }
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Determine the action type: register or login
        String action = request.getParameter("action");

        if ("register".equalsIgnoreCase(action)) {
            handleRegistration(request, response); // Handle user registration
        } else if ("login".equalsIgnoreCase(action)) {
            handleLogin(request, response); // Handle user login
        } else {
            // Invalid action type
            response.getWriter().println("<h1>Invalid action! Please try again.</h1>");
        }
    }

    // Handle user registration
    private void handleRegistration(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username").trim(); // Get and trim username
        String password = request.getParameter("password").trim(); // Get and trim password

        // Check if the username is already registered
        if (userDatabase.containsKey(username)) {
            response.getWriter().println("<h1>Username already exists. Please choose another.</h1>");
        } else {
            // Add the new user to the database
            userDatabase.put(username, password);
            response.getWriter().println("<h1>CAREER PATHWAY SYSTEM</h1>");
            response.getWriter().println("<p>Registration successful! Please log in to explore more.</p>");
        }
    }

    // Handle user login
    private void handleLogin(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username").trim(); // Get and trim username
        String password = request.getParameter("password").trim(); // Get and trim password

        // Check if the username exists and the password matches
        if (userDatabase.containsKey(username) && userDatabase.get(username).equals(password)) {
            // Create an HTTP session to store user details
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            session.setAttribute("email", username + "@example.com"); // Simulating an email for the user
            session.setAttribute("memberSince", "January 2024"); // Example membership date

            // Redirect to the dashboard
            response.sendRedirect("dashboard.html");
        } else {
            response.getWriter().println("<h1>Invalid username or password.</h1>");
        }
        
    }
}
