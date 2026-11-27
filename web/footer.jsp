 <%-- 
    Document   : footer
    Created on : Nov 27, 2025, 4:29:28 PM
    Author     : AJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
    // Get the date object from the Application Context (Listener)
    Object sysDateObj = application.getAttribute("sysDate");
    String formattedDate = "";

    if (sysDateObj != null && sysDateObj instanceof Date) {
        // Format: Nov 26, 2025 21:01
        SimpleDateFormat sdf = new SimpleDateFormat("MMM dd, yyyy HH:mm");
        formattedDate = sdf.format((Date) sysDateObj);
    } else {
        formattedDate = "Date not set";
    }
%>

<!DOCTYPE html>
<html>
    <div class="main-footer">
        <hr>
        <p>Date and Time: <%= formattedDate %> | MP4</p>
    </div>
</html>
