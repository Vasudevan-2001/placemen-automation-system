<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import ="java.sql.*" %>
<%@page import ="java.time.LocalDate"%>;

<%!
    
    String sessemail,sesstype,delete,nid,date,notification;
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
        
        nid=request.getParameter("nid1");
        date=request.getParameter("date");
        notification=request.getParameter("notification");
        delete="delete from tbl_notification where nid='"+nid+"'";
        int res=stmt.executeUpdate(delete);
        if(res>0){  %>
                <script>location.href='view_notify.jsp';</script>
         <%}
     }
else
{
%>
            <script>alert('session destroyed');location.href='home.jsp';</script>
<%}

%>
 

