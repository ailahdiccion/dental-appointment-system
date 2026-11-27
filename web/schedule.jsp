<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    String date = (String) session.getAttribute("appointmentDate");
    String treatment = (String) session.getAttribute("treatment");
    if (date == null || treatment == null) {
        response.sendRedirect("book.jsp");
        return;
    }

    List<String> slots = new ArrayList<String>();
    for (int hour = 10; hour < 18; hour++) {
        if (hour != 12) {
            slots.add(String.format("%02d:00-%02d:00", hour, hour + 1));
        }
    }

    ServletContext context = getServletContext();
    @SuppressWarnings("unchecked")
    Map<String, List<String>> bookedSlots =
            (Map<String, List<String>>) context.getAttribute("bookedSlots");
    if (bookedSlots == null) {
        bookedSlots = new HashMap<String, List<String>>();
    }

    List<String> slotsForDate = bookedSlots.get(date);
    if (slotsForDate == null) {
        slotsForDate = new ArrayList<String>();
    }

    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Select Time Slot</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body class="general-bg">
    <jsp:include page="header.jsp" />

    <div class="content-container">
        <h2>Select a Time</h2>
        <h3>Schedule on <%= date %>:</h3>

        <% if (error != null) { %>
            <p class="error-msg"><%= error %></p>
        <% } %>

        <form action="ScheduleServlet" method="post" class="schedule-form">
            <div class="slots-container radio-group">
            <%
                for (int i = 0; i < slots.size(); i++) {
                    String s = slots.get(i);
                    boolean disabled = slotsForDate.contains(s);
            %>
                <label class="slot-option">
                    <input type="radio" name="time" value="<%= s %>" <%= disabled ? "disabled" : "" %> required>
                    <%= s %> <%= disabled ? "(Booked)" : "" %>
                </label>
            <% } %>
            </div>

            <div class="navigation-buttons">
                <a href="book.jsp" class="btn-arrow back">&larr; Back</a>
                <button type="submit" class="btn-arrow next">Confirm &rarr;</button>
            </div>
        </form>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>