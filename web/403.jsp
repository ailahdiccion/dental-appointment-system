<%-- 
    Document   : 403
    Created on : 11 23, 25, 12:19:43 PM
    Author     : Keith
--%>

<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>403 - Forbidden</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body class="general-bg">
    <jsp:include page="header.jsp" />

    <div class="content-container error-page">
        <h1 style="color: #c94747">403 - Forbidden</h1>
        <p>You do not have permission to access this page.</p>

        <% if (exception != null) { %>
            <p class="error-details"><strong>Details:</strong> <%= exception.getMessage() %></p>
        <% } %>
        <br>
        <a href="dashboard.jsp" class="btn-arrow back">&larr; Back to Home</a>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>
