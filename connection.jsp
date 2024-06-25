<%-- 
    Document   : connection
    Created on : Mar 2, 2024, 3:59:55?PM
    Author     : VASUDEVAN
--%>

<%@page import ="java.sql.*" %>

<%!
    Connection con;
    Statement stmt;
    ResultSet rs;
    
    %>

<%
 try
 {
 Class.forName("com.mysql.jdbc.Driver");
 con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sonoo","root","vasudevan6385742738@");  
 stmt.createStatement();
}
%>