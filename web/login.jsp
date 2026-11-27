<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body class="general-bg">
    <jsp:include page="header.jsp" />

    <div class="content-container">
        <h2>Existing Patient Login</h2>

        <% String error = (String) request.getAttribute("error"); %>
        <% if(error != null){ %>
            <p class="error-msg" style="color:red;"><%= error %></p>
        <% } %>

        <form action="LoginServlet" method="post" class="login-form">
            <label>Username:</label>
            <input type="text" name="username" required><br>
            <label>Password:</label>
            <input type="password" name="password" required><br>
            
            <button type="submit" class="btn-arrow next">Login</button><br><br>
            
        </form>

        <hr> 
        <p>New patient? <a href="signup.jsp">Create an Account here</a></p>
        <div class="navigation-buttons">
                <a href="index.jsp" class="btn-arrow back">&larr; Back to Home</a>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>
