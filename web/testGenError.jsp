<%@ page language="java" %>
<%-- This page tests the web.xml exception-type java.lang.Exception mapping --%>

<!DOCTYPE html>
<html>
<head>
    <title>General Exception Test</title>
</head>
<body>
    <h1>Testing General Exception Mapping</h1>
    
    <%
        throw new Exception("Simulated fatal configuration error during processing.");
    %>
    
    <p>If you see this text, the crash failed!</p>
</body>
</html>
