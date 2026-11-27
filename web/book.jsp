<%@ page session="true" %>
<%@ page import="java.time.LocalDate" %> 
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Book Appointment</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body class="general-bg">
    <jsp:include page="header.jsp" />

    <% 
        if (session.getAttribute("user") == null) {
            response.sendRedirect("index.jsp");
            return; 
        }
    %>
    
    <div class="content-container">
        <h2>Select a Date</h2>

        <% String error = (String) request.getAttribute("error"); %>
        <% if(error != null){ %>
            <p class="error-msg"><%= error %></p>
        <% } %>

        <form action="BookServlet" method="post" class="booking-form">
            <h3>Appointment Dates:</h3>
            <input type="date" name="date" min="<%= LocalDate.now() %>" required > <!-- Do not allow selection of any date before today -->
            
            <div class="navigation-buttons">
                <a href="treatments.jsp" class="btn-arrow back">&larr; Back</a>
                <button type="submit" name="submit" class="btn-arrow next">Next &rarr;</button>
            </div>
        </form>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>
