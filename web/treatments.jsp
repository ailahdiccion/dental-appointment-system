<%@ page session="true" %>
<%@ page import="java.util.*" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Select Treatment</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body class="general-bg">
    <jsp:include page="header.jsp" />

    <%
        String user = (String) session.getAttribute("user");
        String fullname = (String) session.getAttribute("fullname");
        if(user == null){
            response.sendRedirect("login.jsp");
            return;
        }

        String error = (String) request.getAttribute("error");
    %>
    
    <div class="content-container">
        <h2>Select a Treatment</h2>
        <h3>Treatments:</h3>

        <% if(error != null){ %>
            <p class="error-msg" style="color:red;"><%= error %></p>
        <% } %>

        <form action="TreatmentServlet" method="post" class="treatment-form">
            <div class="radio-group">
                <label>
                    <input type="radio" name="treatment" value="Root Canal" required> 
                    Root Canal
                </label>
                <label>
                    <input type="radio" name="treatment" value="Cleaning" required> 
                    Cleaning
                </label>
                <label>
                    <input type="radio" name="treatment" value="Pasta" required> 
                    Pasta
                </label>
                <label>
                    <input type="radio" name="treatment" value="Tooth Extraction" required> 
                    Tooth Extraction
                </label>
            </div>

            <div class="navigation-buttons">
                <a href="dashboard.jsp" class="btn-arrow back">&larr; Back</a>

                <button type="submit" class="btn-arrow next">Next &rarr;</button>
            </div>
        </form>

        <!-- <a href="dashboard.jsp" class="link-back">Back</a> -->
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>
