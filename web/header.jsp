<%-- 
    Document   : header
    Created on : Nov 27, 2025, 4:22:17 PM
    Author     : AJ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@ page session="true" %>
    <div class="main-header">
        <h1>CSD Dental Clinic</h1>

        <div class="team-info">
            <p>ICS2608 / 2CSD / CABRERA, Keith Loise, DICCION, Ma. Ailah Jolie, SANTIAGO, Faith Oliver</p>
        </div>

        <nav>
            <a href="${pageContext.request.contextPath}/index.jsp" style="display: inline-flex; align-items: center; gap: 5px;">
                <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor">
                    <path d="M10 20v-6h4v6h5v-8h3L12 3 2 12h3v8z"/>
                </svg>
                Home
            </a>
        </nav>
    </div>
</html>
