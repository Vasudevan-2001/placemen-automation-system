<%-- 
    Document   : logout
    Created on : Mar 19, 2024, 1:45:03 PM
    Author     : VASUDEVAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
session.setAttribute("sessregno","");
         session.setAttribute("sessemail","");
         %>
         <script>alert("LoggedOut");location.href='home.jsp';</script>
