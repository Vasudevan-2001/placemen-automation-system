<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.time.LocalDate"%>;

<%!
    
    String sessemail,sesstype,nid,date,notification,update;
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
        
        nid=request.getParameter("nid");
        date=request.getParameter("date");
        notification=request.getParameter("notify");
//notification=notification.replace("'","")

        update="update tbl_notification set date='"+date+"',notification='"+notification+"' where nid='"+nid+"'";
        int res=stmt.executeUpdate(update);
        if(res>0){%>
                <script>alert('Updated successfully');location.href='view_notify.jsp';</script>
        <%}
        else{%>
        <script>alert('Something went wrong. Please try again');location.href='view_notify.jsp';</script>
        <%}
        





 }
else
{
%>
            <script>alert('session destroyed');location.href='home.jsp';</script>
<%}

%>
 
