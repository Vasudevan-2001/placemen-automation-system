<%@page import ="java.sql.*" %>
<%@page import ="java.time.YearMonth"%>
<%@page import ="java.time.format.DateTimeFormatter" %>

<%!
    Connection con;
    ResultSet rs;
    Statement stmt;
    String password,email,select,insert;
    String regno;
    int yop,current_year;
  %>


<%
regno=request.getParameter("regno");
password=request.getParameter("password");
email=request.getParameter("email");



 try{
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
        stmt=con.createStatement();
        select="select * from tbl_student where regno='"+regno+"'and email='"+email+"'and password='"+password+"'";
        rs=stmt.executeQuery(select);
        if(rs.next())
         {
         session.setAttribute("sessregno",regno);
         session.setAttribute("sessemail",email);
         
           %>
         
                    <script>alert("Login Success");location.href='dashboard1.jsp';</script>
               <%}     
            else
                {   %>
                     
                      <script>alert('invalid user');location.href='home.jsp';</script>
                      
                <% }
     }

catch(Exception e)
{
    %>
    <script>alert('invalid user');location.href='home.jsp';</script>
<%}


%>

