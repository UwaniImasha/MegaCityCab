<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%
    session.invalidate(); // Clear session
    response.sendRedirect("login.jsp"); // Redirect to login
%>
