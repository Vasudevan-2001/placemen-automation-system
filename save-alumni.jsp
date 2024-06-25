<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.time.LocalDate"%>;

<%!
    
    String sessemail,sesstype,insert,aid,aname,passout,dept,status,cname;
    Connection con;
    Statement stmt;
    ResultSet rs;
    int res;

    %>
    
 <%
  sesstype=session.getAttribute("sesstype").toString();
  sessemail=session.getAttribute("sessmail").toString();  
  if(!sessemail.equals(""))
  {  
     Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
     stmt=con.createStatement();
     aid=request.getParameter("aid");
     aname=request.getParameter("name");
     passout=request.getParameter("passed_out");
     dept=request.getParameter("dept");
     status=request.getParameter("status");
     cname=request.getParameter("cname");
     insert="insert into tbl_alumni values('"+aid+"','"+aname+"','"+dept+"','"+passout+"','"+status+"','"+cname+"')";
     res=stmt.executeUpdate(insert);
     if(res>0){%>
          <script>alert('Alumni details were saved successfully');location.href='add-alumni.jsp';</script>
          <%   }
   }
else
{
%>
            <script>alert('session destroyed');location.href='home.jsp';</script>
<%}

%>
    