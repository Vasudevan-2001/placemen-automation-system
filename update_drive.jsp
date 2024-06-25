<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.util.Date" %>
<%@page import ="java.text.SimpleDateFormat" %>

<%!
    
    String dept,cid,regno,msg,error,update,application_status;
    int current_year,cnt=1,res;
    Connection con;
    ResultSet rs;
    Statement stmt;
    String sessemail,sesstype;
    
 %>   
 
 <%
  sesstype=session.getAttribute("sesstype").toString();
  sessemail=session.getAttribute("sessmail").toString();  
  if(!sessemail.equals(""))
  {
      
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
    stmt=con.createStatement();
    regno=request.getParameter("regno1");
    cid=request.getParameter("cid1");
    dept=request.getParameter("dept1");  
    application_status=request.getParameter("app_status");
    try{
           update="update tbl_drive set application_status='"+ application_status+"' where regno='"+regno+"' and id='"+cid+"'";           
           res=stmt.executeUpdate(update);
           if(res>0){%>
                           <script>alert('Application <%=application_status%> Successfully');location.href='applied-students.jsp?msg=<%=msg%>&dept1=<%=dept%>&cid1=<%=cid%>';</script>
            
        <%} 
    }
    catch(Exception e){
        error="Something went wrong. Please try again";%>
        <script>location.href='applied-students.jsp?error=<%=error%>&dept1=<%=dept%>';</script>
    <%}
           
           
  }
else
{
%>
            <script>alert('session destroyed');location.href='home.jsp';</script>
<%}

%>
