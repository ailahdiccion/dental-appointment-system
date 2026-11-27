
<%@ page session="true" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
    
    String fullname = (String) session.getAttribute("fullname");
    String date = (String) session.getAttribute("appointmentDate");
    String treatment = (String) session.getAttribute("treatment");
    String time = (String) session.getAttribute("selectedTime");
    
    if(fullname==null || date==null || treatment==null || time==null){
        response.sendRedirect("dashboard.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Confirm Booking</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body class="general-bg">
    <jsp:include page="header.jsp" />

    <div class="content-container">
        <h2>Confirm Your Appointment</h2>
        
        <div class="confirmation-details">
            <p><strong>Patient:</strong> <%= fullname %></p>
            <p><strong>Treatment:</strong> <%= treatment %></p>
            <p><strong>Date:</strong> <%= date %></p>
            <p><strong>Time:</strong> <%= time %></p>
        </div>

        <form action="ConfirmServlet" method="post">
            <div class="navigation-buttons">
                <a href="schedule.jsp" class="btn-arrow back">&larr; Back</a>
                <button type="submit" class="btn-arrow next">Confirm Booking</button>
            </div>
        </form>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>
