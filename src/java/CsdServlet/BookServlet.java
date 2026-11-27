package CsdServlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class BookServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String date = req.getParameter("date");

        if (date == null || date.trim().isEmpty()) {
            req.setAttribute("error", "Please select a date.");
            req.getRequestDispatcher("book.jsp").forward(req, resp);
            return;
        }

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        session.setAttribute("appointmentDate", date);
        resp.sendRedirect("schedule.jsp");
    }
}
