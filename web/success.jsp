<%@ page session="true" %>
<%
    // Ensure no caching for this confirmation page
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    String fullname = (String) session.getAttribute("fullname");
    
    // Appointment details come from Request object
    String date = (String) request.getAttribute("date");
    String treatment = (String) request.getAttribute("treatment");
    String time = (String) request.getAttribute("time");
    String message = (String) request.getAttribute("message");

    if(fullname == null){
        response.sendRedirect("dashboard.jsp");
        return;
    }
    
    // Auto-redirect to dashboard after 10 seconds
    response.setHeader("Refresh", "10; url=dashboard.jsp");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Successful</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body class="general-bg">
    <jsp:include page="header.jsp" />

    <div class="content-container">
        <h2>Booking Successful!</h2>
        <h3 class="success-msg"><%= message %></h3>
        
        <div class="booking-summary">
            <p>Patient: <%= fullname %></p>
            <% if(treatment != null){ %><p>Treatment: <%= treatment %></p><% } %>
            <% if(date != null){ %><p>Date: <%= date %></p><% } %>
            <% if(time != null){ %><p>Time: <%= time %></p><% } %>
        </div>

        <h4 class="redirect-notice" style="text-align: center; margin-top: 30px; color: #666; font-weight: normal;">
            Redirecting to dashboard in 10 seconds...
        </h4>
        <div class="navigation-buttons" style="justify-content: center; margin-top: -5px;">
            <a href="dashboard.jsp" class="btn-arrow next">Go to Home Now</a>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>