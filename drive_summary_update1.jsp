<%@page import ="java.sql.*" %>
<%@page import ="java.util.Date" %>
<%@page import ="java.text.SimpleDateFormat" %>

<%!
    
    String select,id,name,dept,cid,cid1,dept1,regno,student_name,yop;
    int current_year,cnt=1,res,ras;
    Connection con;
    ResultSet rs,rs1;
    Statement stmt,stmt1;
    String sessemail,sesstype,drive_stat,campus_stat,update,update1;
    
 %>   
 
<%
  sesstype=session.getAttribute("sesstype").toString();
  sessemail=session.getAttribute("sessmail").toString();  
  if(!sessemail.equals(""))
  {
    
      Class.forName("com.mysql.jdbc.Driver");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
      stmt=con.createStatement();
      stmt1=con.createStatement();
      regno=request.getParameter("regno1");
      cid=request.getParameter("cid1");
      yop=request.getParameter("yop1");
      dept=request.getParameter("dept1");
      campus_stat=request.getParameter("campus_stat");
      
      if(campus_stat.equals("PLACED")){
          update1="update tbl_drive set campus_status='"+campus_stat+"' where id='"+cid+"' and regno='"+regno+"' and dept='"+dept+"' and yop='"+yop+"'";
          ras=stmt1.executeUpdate(update1);
          if(ras>0){%>
                 <script>alert('campus_status updated Successfully');location.href='drive_summary.jsp?cid=<%=cid%>&dept=<%=dept%>&yop=<%=yop%>';</script>
            <%     }
        }
      else{
          update1="update tbl_drive set campus_status='"+campus_stat+"' where id='"+cid+"' and regno='"+regno+"' and dept='"+dept+"' and yop='"+yop+"'";
          ras=stmt1.executeUpdate(update1);
          if(ras>0){%>
                 <script>alert('campus_status updated');location.href='drive_summary.jsp?cid=<%=cid%>&dept=<%=dept%>&yop=<%=yop%>';</script>
            <%     }
      }

  %> 
      
<% }
else
{
%>
            <script>alert('session destroyed');location.href="home.jsp";</script>
<%}

%>


   