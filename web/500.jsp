<%-- 
    Document   : 500
    Created on : 11 23, 25, 12:19:56 PM
    Author     : Keith
--%>

<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>500 - Internal Server Error</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body class="general-bg">
    <jsp:include page="header.jsp" />

    <div class="content-container error-page">
        <h1 style="color: #c94747">500 - Internal Server Error</h1>
        <p>Something went wrong on the server.</p>

        <% if (exception != null) { %>
            <p class="error-details"><strong>Error:</strong> <%= exception.getMessage() %></p>
            <pre class="error-trace"><%= exception %></pre>
        <% } %>
        <br>
        <a href="dashboard.jsp" class="btn-arrow back">&larr; Back to Home</a>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>
