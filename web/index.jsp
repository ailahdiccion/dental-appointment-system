<%@ page session="true" %>
<%! 
    private String getClinicTagline() {
        return "Your Smile, Our Priority. (App Version 1.0)";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSD Dental Clinic</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body class="hero-bg">
    <jsp:include page="header.jsp" />

    <div class="content-container home-page">
        <h1>Welcome to CSD Dental Clinic</h1>
        <p>Providing quality dental care for your smile! <%= getClinicTagline() %></p>
        
        <div class="info-block">
            <p>Address: 123 Main Street, City</p>
            <p>Contact: 0912-345-6789</p>
        </div>

        <% 
            // UPDATED REDIRECT LOGIC
            String user = (String) session.getAttribute("user");
            String role = (String) session.getAttribute("role");
            
            if (user != null) {
                if ("Doctor".equals(role)) {
                    response.sendRedirect("doctorDashboard.jsp");
                } else {
                    response.sendRedirect("dashboard.jsp");
                }
                return;
            }
        %>

        <div class="cta-wrapper">
            <p>To access booking and appointment management features:</p>
            <form action="${pageContext.request.contextPath}/login.jsp" method="get">
                <button type="submit" class="btn-main-cta">Log In / Sign Up to Book Appointment</button>
            </form>
        </div>

        <hr>

        <h3>Our Treatments</h3>
        
        <div class="treatment-gallery">
            
            <div class="treatment-item">
                <img src="images/canal.jpg" alt="Root Canal" class="gallery-img">
                <p>Root Canal</p>
            </div>

            <div class="treatment-item">
                <img src="images/cleaning.jpg" alt="Cleaning" class="gallery-img">
                <p>Cleaning</p>
            </div>

            <div class="treatment-item">
                <img src="images/pasta.jpg" alt="Pasta" class="gallery-img">
                <p>Pasta</p>
            </div>

            <div class="treatment-item">
                <img src="images/extract.jpg" alt="Tooth Extraction" class="gallery-img">
                <p>Tooth Extraction</p>
            </div>

        </div>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>