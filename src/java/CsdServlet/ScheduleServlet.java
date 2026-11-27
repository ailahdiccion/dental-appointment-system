package CsdServlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class ScheduleServlet extends HttpServlet {
    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("index.jsp");
            return;
        }

        String selectedTime = req.getParameter("time");
        String date = (String) session.getAttribute("appointmentDate");
        String treatment = (String) session.getAttribute("treatment");

        if (selectedTime == null || selectedTime.isEmpty() || date == null || treatment == null) {
            resp.sendRedirect("treatments.jsp");
            return;
        }

        ServletContext context = getServletContext();
        
        // BUG FIX: Just check availability. DO NOT save it to the database yet.
        synchronized (context) {
            Map<String, List<String>> bookedSlots = (Map<String, List<String>>) context.getAttribute("bookedSlots");
            if (bookedSlots == null) {
                bookedSlots = new HashMap<>();
                context.setAttribute("bookedSlots", bookedSlots);
            }
            
            List<String> slotsForDate = bookedSlots.getOrDefault(date, new ArrayList<>());

            if (slotsForDate.contains(selectedTime)) {
                req.setAttribute("error", "This time slot is already booked! Please select another.");
                req.getRequestDispatcher("schedule.jsp").forward(req, resp);
                return;
            }
        }

        // Store the user's choice temporarily in the session
        session.setAttribute("selectedTime", selectedTime);
        
        // Go to the confirmation page
        resp.sendRedirect("confirm.jsp");
    }
}