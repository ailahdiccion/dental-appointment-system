
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body class="general-bg">
    <jsp:include page="header.jsp" />

    <div class="content-container error-page">
        <h1 style="color: #c94747">An Error Occurred</h1>
        <p>Sorry, something went wrong while processing your request.</p>

        <% if (exception != null) { %>
            <p class="error-details"><strong>Exception:</strong> <%= exception.getMessage() %></p>
        <% } %>
        <br>
        <a href="dashboard.jsp" class="btn-arrow back">&larr; Back to Home</a>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>
