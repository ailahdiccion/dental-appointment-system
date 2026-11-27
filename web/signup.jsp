<!-- File: WebContent/signup.jsp -->
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Signup</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body class="general-bg">
    <jsp:include page="header.jsp" />

    <div class="content-container">
        <h2>New Patient Signup</h2>

        <% String error = (String) request.getAttribute("error"); %>
        <% if(error != null){ %>
            <p class="error-msg" style="color:red;"><%= error %></p>
        <% } %>

        <form action="SignupServlet" method="post" class="signup-form">
            <label>Username:</label>
            <input type="text" name="username" required>
            
            <label>Password:</label>
            <input type="password" name="password" required>
            
            <label>Full Name:</label>
            <input type="text" name="fullname" required>
            
            <label>Age:</label>
            <input type="number" name="age" required>
            
            <label>Phone Number:</label>
            <input type="text" name="phone" required>

            <br>

            <div class="navigation-buttons">
                <a href="login.jsp" class="btn-arrow back">&larr; Back to Login</a>
                <button type="submit" class="btn-arrow next">Sign Up</button>
            </div>
        </form>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>
