<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.time.LocalDate"%>;

<%!
    
    String sessemail,sessregno,nid,date,notification,select,ques,answer,regno,email,insert;
    Connection con;
    Statement stmt;
    ResultSet rs;

    %>
    
 <%
  sessregno=session.getAttribute("sessregno").toString();
  sessemail=session.getAttribute("sessemail").toString();
  if(!sessemail.equals(""))
  {  
     Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","root","vasudevan6385742738@");
        stmt=con.createStatement();
        ques=request.getParameter("question");
        out.print(ques);
        insert="insert into tbl_forum(question) values('"+ques+"')";
        int res=stmt.executeUpdate(insert);
        if(res>0){ %>
        <script>alert('Question Posted SuccessFully');Location.href('students_post.jsp');</script>
            
 <% }
        
  }
else
{
%>
<script>alert('session destroyed');location.href='home.jsp';</script>
<%}
%>

