<%@ page session="true" %>
<%@ page import="java.util.*, CsdHome.Appointment, javax.servlet.http.HttpServletResponse" %>
<%
    // Security Headers
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    String user = (String) session.getAttribute("user");
    String role = (String) session.getAttribute("role");

    // Security Check: Must be logged in AND be a Doctor
    if (user == null || !"Doctor".equals(role)) {
        response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access to Dentist privileges is restricted.");
        return;
    }

    ServletContext context = getServletContext();
    
    // Get all bookings (Map<Username, List<Appointment>>)
    @SuppressWarnings("unchecked")
    Map<String, List<Appointment>> allBookings = (Map<String, List<Appointment>>) context.getAttribute("bookings");

    // Get all patient details (to look up names/age/phone)
    @SuppressWarnings("unchecked")
    Map<String, Map<String, String>> patients = (Map<String, Map<String, String>>) context.getAttribute("patients");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Doctor Dashboard | CSD Dental</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body class="general-bg">
    <jsp:include page="header.jsp" />

    <div class="content-container" style="max-width: 1000px;"> <h1>Welcome, Dr. CSD!</h1>
        
        <hr>
        <h2>Master Appointment List:</h2>
        

        <% if (allBookings == null || allBookings.isEmpty()) { %>
            <p>No appointments found in the system.</p>
        <% } else { %>
            <table class="schedule-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Treatment</th>
                        <th>Patient Name</th>
                        <th>Age</th>
                        <th>Contact #</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    // Iterate through every user in the booking system
                    for (String patientUsername : allBookings.keySet()) {
                        List<Appointment> userAppts = allBookings.get(patientUsername);
                        
                        // Get patient personal details
                        Map<String, String> pDetails = patients.get(patientUsername);
                        String pName = (pDetails != null) ? pDetails.get("fullname") : "Unknown";
                        String pAge = (pDetails != null) ? pDetails.get("age") : "N/A";
                        String pPhone = (pDetails != null) ? pDetails.get("phone") : "N/A";

                        for (Appointment appt : userAppts) {
                %>
                    <tr>
                        <td><%= appt.getDate() %></td>
                        <td><%= appt.getTimeSlot() %></td>
                        <td><%= appt.getTreatment() %></td>
                        <td style="font-weight:bold; color:#0056b3;"><%= pName %></td>
                        <td><%= pAge %></td>
                        <td><%= pPhone %></td>
                    </tr>
                <% 
                        } 
                    } 
                %>
                </tbody>
            </table>
        <% } %>
        <br>
        <form action="<%= request.getContextPath() %>/LogoutServlet" method="get" style="text-align: right;">
            <button type="submit" class="logout-button">Logout</button>
        </form>
    </div>
        
    <jsp:include page="footer.jsp" />
</body>
</html>
