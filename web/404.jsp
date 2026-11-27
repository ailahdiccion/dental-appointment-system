<%-- 
    Document   : 404
    Created on : 11 23, 25, 12:19:28 PM
    Author     : Keith
--%>

<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>404 - Page Not Found</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/styles.css">
</head>
<body class="general-bg">
    <jsp:include page="header.jsp" />

    <div class="content-container error-page">
        <h1 style="color: #c94747">404 - Page Not Found</h1>
        <p>Sorry, the page you are looking for does not exist.</p>

        <% if (exception != null) { %>
            <p class="error-details"><strong>Details:</strong> <%= exception.getMessage() %></p>
        <% } %>
        <br>
        <a href="dashboard.jsp" class="btn-arrow back">&larr; Back to Home</a>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>
