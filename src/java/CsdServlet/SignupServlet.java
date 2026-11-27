package CsdServlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;

public class SignupServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        // Initialization is handled by CsdAppContextListener
    }

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String fullname = req.getParameter("fullname");
        String age = req.getParameter("age");
        String phone = req.getParameter("phone");

        // Basic validation
        if (username == null || password == null || fullname == null || age == null || phone == null ||
            username.isEmpty() || password.isEmpty() || fullname.isEmpty() || age.isEmpty() || phone.isEmpty()) {

            req.setAttribute("error", "All fields are required.");
            req.getRequestDispatcher("signup.jsp").forward(req, resp);
            return;
        }

        ServletContext context = getServletContext();

        // BUG FIX: Synchronize to prevent data corruption
        synchronized (context) {
            Map<String, Map<String, String>> patients = (Map<String, Map<String, String>>) context.getAttribute("patients");
            
            if (patients == null) {
                patients = new HashMap<>();
                context.setAttribute("patients", patients);
            }

            if (patients.containsKey(username)) {
                req.setAttribute("error", "Username already exists.");
                req.getRequestDispatcher("signup.jsp").forward(req, resp);
                return;
            }

            Map<String, String> details = new HashMap<>();
            details.put("password", password);
            details.put("fullname", fullname);
            details.put("age", age);
            details.put("phone", phone);
            patients.put(username, details);
        }

        // Auto-login after signup
        HttpSession session = req.getSession(true);
        session.setAttribute("user", username);
        session.setAttribute("fullname", fullname);
        session.setAttribute("age", age);
        session.setAttribute("phone", phone);
        session.setAttribute("role", "Customer");

        resp.sendRedirect("dashboard.jsp");
    }
}