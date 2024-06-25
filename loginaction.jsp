<%@page import ="java.sql.*" %>

<%!
    String mail,pwd,utype;
   %> 
   
   
<%
    utype=request.getParameter("usertype");
    mail=request.getParameter("username");
    pwd=request.getParameter("password");
    
if(mail.equals("admin@gmail.com") && pwd.equals("admin"))
        {

        session.setAttribute("sessmail",mail);
        session.setAttribute("sesstype",utype);
%>
           <script>alert('LoggedIn Successfully');location.href='dashboard.jsp';</script>
        <%}
else
{ %>
           <script>alert('login failed');location.href='home.jsp';</script>

           <%}%>