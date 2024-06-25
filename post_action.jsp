<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.time.YearMonth"%>
<%@page import ="java.time.format.DateTimeFormatter" %>
<%!
   String sessemail,sesstype,cid,ques,select,fid,insert;
   int id;
   Connection con;
    ResultSet rs;
    Statement stmt;

    String nid;
%>
<%
  sesstype=session.getAttribute("sesstype").toString();
  sessemail=session.getAttribute("sessmail").toString();  
  if(!sessemail.equals(""))
  {
  
        try{
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","root","vasudevan6385742738@");
        stmt=con.createStatement();
        ques=request.getParameter("question");
        
        select="select ifnull(max(id),0) from tbl_forum";
        rs=stmt.executeQuery(select);
        if(rs.next()){
                fid=rs.getString(1);
                
                id=Integer.parseInt(fid)+1;
                nid="QTN"+Integer.toString(id);
                
           }

insert="insert into tbl_forum values('"+id+"','"+nid+"','"+ques+"','None')";
int res=stmt.executeUpdate(insert);
if(res>0){

%>
           
           <script>alert('sent successfully');location.href='viewpost.jsp';</script>
           <%}
else{%>

    <script>alert('sent  unsuccessfully');location.href='viewpost.jsp';</script>

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

