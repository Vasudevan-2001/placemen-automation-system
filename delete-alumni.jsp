<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.time.LocalDate"%>;

<%!
    
    String sessemail,sesstype,aid,dept,passed_out,delete;
    int count,res;
    int current_year,currentYear;
    Connection con;
    Statement stmt;
    ResultSet rs;

    %>
    
<%
  sesstype=session.getAttribute("sesstype").toString();
  sessemail=session.getAttribute("sessmail").toString();  
  if(!sessemail.equals(""))
  { 
        Class.forName("com.mysql.cj.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
        stmt=con.createStatement();
        aid=request.getParameter("aid1");
        dept=request.getParameter("dept");
        passed_out=request.getParameter("passed_out");
        delete=" delete from tbl_alumni where id='"+aid+"' ";
        res=stmt.executeUpdate(delete);
        if(res>0){%>
                <script>alert('Alumni details were deleted');location.href='alumnidetails.jsp?dept=<%=dept%>&yop=<%=passed_out%>';</script>
<%}
        else{%>
            <script>alert('Something went wrong!');location.href='alumnidetails.jsp?dept=<%=dept%>&yop=<%=passed_out%>';</script>
        <%}
        
  }
else
{
%>
            <script>alert('session destroyed');location.href='home.jsp';</script>
<%}

%>
