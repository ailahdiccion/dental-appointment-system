<%@ page session="true" %>
<%@ page import="java.util.*, CsdHome.Appointment" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    String user = (String) session.getAttribute("user");
    String fullname = (String) session.getAttribute("fullname");
    if (user == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    ServletContext context = getServletContext();
    @SuppressWarnings("unchecked")
    Map<String, List<Appointment>> allBookings = (Map<String, List<Appointment>>) context.getAttribute("bookings");
    
    List<Appointment> patientSchedule = Collections.emptyList();
    if (allBookings != null && allBookings.containsKey(user)) {
        @SuppressWarnings("unchecked")
        List<Appointment> rawList = (List<Appointment>) allBookings.get(user);
        if (rawList != null) {
             patientSchedule = rawList;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Patient Dashboard | CSD Dental</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body class="general-bg">
    <jsp:include page="header.jsp" />

    <div class="content-container">
        <h1>Welcome, <%= fullname %>!</h1>
        <hr><br>

        <div class="action-buttons">
            <form action="treatments.jsp" method="get" style="display: inline;">
                <button type="submit" class="cta-button">+ Book Next Appointment</button>
            </form>
        </div>

        <h2>Your Scheduled Appointments:</h2>
        <% if (patientSchedule == null || patientSchedule.isEmpty()) { %>
            <p>No scheduled appointments yet.</p>
        <% } else { %>
            <table class="schedule-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>Time</th>
                        <th>Treatment</th>
                    </tr>
                </thead>
                <tbody>
                <% for (Appointment appt : patientSchedule) { %>
                    <tr>
                        <td><%= appt.getDate() %></td>
                        <td><%= appt.getTimeSlot() %></td>
                        <td><%= appt.getTreatment() %></td>
                    </tr>
                <% } %>
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
