package CsdListener;

import CsdHome.Appointment;
import javax.servlet.*;
import javax.servlet.annotation.WebListener;
import java.util.*;

@WebListener
public class CsdAppContextListener implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext ctx = sce.getServletContext();

        // 1. Initialize Storage Maps
        Map<String, Map<String, String>> patients = new HashMap<>();
        ctx.setAttribute("patients", patients);
        ctx.setAttribute("bookings", new HashMap<String, List<Appointment>>());
        ctx.setAttribute("bookedSlots", new HashMap<String, List<String>>());
        ctx.setAttribute("sysDate", new java.util.Date()); 

        // 2. CREATE ACCOUNTS IMMEDIATELY (So they exist before Signup)
        
        // Create Doctor
        Map<String, String> docDetails = new HashMap<>();
        docDetails.put("password", System.getenv("DEMO_DOCTOR_PASSWORD"));
        docDetails.put("fullname", "Dr. CSD Specialist");
        docDetails.put("role", "Doctor"); // <--- Role is key
        patients.put("doctor", docDetails);

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {}
}