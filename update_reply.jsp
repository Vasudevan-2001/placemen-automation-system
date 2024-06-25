<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import ="java.sql.*" %>
<%@page import ="java.time.LocalDate"%>

<%!
    
    String sessemail,sesstype;
    String qid,update,ques,ans; 
    
   
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
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","root", "vasudevan6385742738@");
        stmt=con.createStatement();

        qid=request.getParameter("qid");
        ques=request.getParameter("question");
//        ques=ques.replace("'","");
        ans=request.getParameter("answer");
//        ans=ans.replace("'","");

    update="update tbl_forum set answer='"+ans+"' where qid='"+qid+"' and question='"+ques+"'";
    int res=stmt.executeUpdate(update);
    if(res>0){%>
           <script>alert('sent successfully');location.href='send_reply.jsp';</script>
    <%}
  
  }
else
{
%>
<script>alert('session destroyed');location.href='home.jsp';</script>
<%}
%>




