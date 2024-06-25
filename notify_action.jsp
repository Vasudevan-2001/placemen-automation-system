<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.time.LocalDate"%>;

<%!
    
    String sessemail,sesstype,query,nid, date, notification, notification1,nautoid;
    Connection con;
    Statement stmt;
    ResultSet rs;

    %>
    
 <%
  sesstype=session.getAttribute("sesstype").toString();
  sessemail=session.getAttribute("sessmail").toString();  
  if(!sessemail.equals(""))
  {  
     Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","root","vasudevan6385742738@");
     stmt=con.createStatement();
     nautoid=request.getParameter("nautoid");
     nid=request.getParameter("nid");
     date=request.getParameter("date");
     notification=request.getParameter("notify");
//     notification=notification.replace("'","");
    
     query="insert into tbl_notification values('"+Integer.parseInt(nautoid)+"','"+nid+"','"+date+"','"+notification+"')";
     
     int res=stmt.executeUpdate(query); 
     if(res>0){  %>
        <script>alert('added successfully');location.href='notify.jsp';</script>
        <%}
     else{%>
    
            <script>alert('Failed');location.href='notify.jsp';</script>
    <%}%>
    
<% }
else
{
%>
            <script>alert('session destroyed');location.href='home.jsp';</script>
<%}

%>