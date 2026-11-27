package CsdServlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;

public class LoginServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        ServletContext context = getServletContext();
        @SuppressWarnings("unchecked")
        Map<String, Map<String, String>> patients = (Map<String, Map<String, String>>) context.getAttribute("patients");
        if (patients == null) {
            patients = new HashMap<>();
            context.setAttribute("patients", patients);
        }

        // 1. Create Test User (Patient)
        if (!patients.containsKey("testuser")) {
            Map<String, String> details = new HashMap<>();
            details.put("password", System.getenv("DEMO_PATIENT_PASSWORD"));
            details.put("fullname", "Test User");
            details.put("age", "30");
            details.put("phone", "");
            patients.put("testuser", details);
        }

        // 2. Create DOCTOR User (Hardcoded)
        if (!patients.containsKey("doctor")) {
            Map<String, String> docDetails = new HashMap<>();
            docDetails.put("password", System.getenv("DEMO_DOCTOR_PASSWORD")); // <--- Doctor Password
            docDetails.put("fullname", "Dr. CSD Specialist");
            docDetails.put("role", "Doctor"); // Mark as doctor
            patients.put("doctor", docDetails);
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        ServletContext context = getServletContext();
        Map<String, Map<String, String>> patients = (Map<String, Map<String, String>>) context.getAttribute("patients");

        if (patients == null || !patients.containsKey(username)) {
            req.setAttribute("error", "User does not exist.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        Map<String, String> details = patients.get(username);
        if (!password.equals(details.get("password"))) {
            req.setAttribute("error", "Incorrect password.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        // Success: Create Session
        HttpSession session = req.getSession(true);
        session.setAttribute("user", username);
        session.setAttribute("fullname", details.get("fullname"));

        // Check Role
        String role = details.containsKey("role") ? details.get("role") : "Customer";
        session.setAttribute("role", role);

        // Redirect based on Role
        if ("Doctor".equals(role)) {
            resp.sendRedirect("doctorDashboard.jsp"); // Go to Doctor View
        } else {
            resp.sendRedirect("dashboard.jsp"); // Go to Patient View
        }
    }
}