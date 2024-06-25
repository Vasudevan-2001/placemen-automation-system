<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>

<%!
   String sessemail,sessregno,regno,newpass,conpass,update;
   int res;
   
    Connection con;
    Statement stmt;
    ResultSet rs;
   
%>

<%
 sessregno=session.getAttribute("sessregno").toString();
  sessemail=session.getAttribute("sessemail").toString();  
  if(!sessemail.equals(""))
  { 
        try{
        Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
        stmt=con.createStatement();
        newpass=request.getParameter("newpassword");
        conpass=request.getParameter("confirmpassword");
        if(newpass.equals(conpass)){
            update="update tbl_student set password='"+conpass+"' , confirm_password='"+conpass+"' where regno='"+sessregno+"'";
            res=stmt.executeUpdate(update);
            if(res>0){%>
            <script>alert("Password changed successfully");location.href='home.jsp';</script>
            <%}
            else{%>
                    <script>alert("Password changed unsuccessfully");location.href='changepassword_action1.jsp';</script>
                    <%}
        }
        else{%>
            <script>alert('Password is mismatched ');location.href='changepassword_action1.jsp';</script>
        <%}
        }
        catch(Exception e){
                out.print(e.getMessage());
        }
          
  }
else
{
%>
<script>alert('session destroyed');location.href='home.jsp';</script>
<%}
%>
