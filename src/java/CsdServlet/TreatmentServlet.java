package CsdServlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class TreatmentServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String treatment = req.getParameter("treatment");

        if (treatment == null || treatment.trim().isEmpty()) {
            req.setAttribute("error", "Please select a treatment.");
            req.getRequestDispatcher("treatments.jsp").forward(req, resp);
            return;
        }

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        session.setAttribute("treatment", treatment);
        resp.sendRedirect("book.jsp");
    }
}
