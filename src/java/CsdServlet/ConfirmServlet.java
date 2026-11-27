package CsdServlet;

import CsdHome.Appointment;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;
import java.time.LocalDate;

public class ConfirmServlet extends HttpServlet {
    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect("index.jsp");
            return;
        }

        // Ensure all booking details are present
        if (session.getAttribute("appointmentDate") == null ||
            session.getAttribute("treatment") == null ||
            session.getAttribute("selectedTime") == null) {
            resp.sendRedirect("treatments.jsp");
            return;
        }

        ServletContext context = getServletContext();

        String user = (String) session.getAttribute("user");
        String treatment = (String) session.getAttribute("treatment");
        String dateString = (String) session.getAttribute("appointmentDate");
        String time = (String) session.getAttribute("selectedTime");

        Appointment finalAppointment = new Appointment();
        finalAppointment.setUserId(user);
        finalAppointment.setTreatment(treatment);
        finalAppointment.setTimeSlot(time);
        finalAppointment.setDate(LocalDate.parse(dateString));

        // BUG FIX: Check availability AND Save the booking at the same time (Atomic)
        synchronized (context) {
            Map<String, List<String>> bookedSlots = (Map<String, List<String>>) context.getAttribute("bookedSlots");
            if (bookedSlots == null) { 
                bookedSlots = new HashMap<>(); 
                context.setAttribute("bookedSlots", bookedSlots);
            }
            List<String> slotsForDate = bookedSlots.getOrDefault(dateString, new ArrayList<>());
            
            // 1. FINAL SAFETY CHECK: Did someone else book it while we were reading the confirm page?
            if (slotsForDate.contains(time)) {
                req.setAttribute("error", "Sorry! Someone just booked that slot. Please pick another.");
                req.getRequestDispatcher("schedule.jsp").forward(req, resp);
                return;
            }

            // 2. NOW we save it as booked.
            slotsForDate.add(time);
            bookedSlots.put(dateString, slotsForDate);
            context.setAttribute("bookedSlots", bookedSlots);

            // 3. Save the appointment to the user's history
            Map<String, List<Appointment>> bookings = (Map<String, List<Appointment>>) context.getAttribute("bookings");
            if (bookings == null) {
                bookings = new HashMap<>();
                context.setAttribute("bookings", bookings);
            }   
            List<Appointment> userBookings = bookings.getOrDefault(user, new ArrayList<>());
            userBookings.add(finalAppointment);
            bookings.put(user, userBookings);
            context.setAttribute("bookings", bookings);
        }

        // Clear the temporary session data
        session.removeAttribute("appointmentDate");
        session.removeAttribute("treatment");
        session.removeAttribute("selectedTime");

        // Send details to the success page
        req.setAttribute("date", dateString);
        req.setAttribute("treatment", treatment);
        req.setAttribute("time", time);
        req.setAttribute("message", "Your appointment is confirmed.");

        req.getRequestDispatcher("success.jsp").forward(req, resp);
    }
}