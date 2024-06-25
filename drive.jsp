<%@page import ="java.sql.*" %>
<%@page import ="java.util.Date" %>
<%@page import ="java.text.SimpleDateFormat" %>


<%!
    Connection con;
    ResultSet rs;
    Statement stmt;
    String sessregno,sessemail,select_student,sname,doj,current_arrear,history_arrear,insert;
    String dept,sslc,hsc,cgpa,ca,hoa,select,location,website,regno,email,cid,cname,drive_status,campus_status;
    String campus,eligibility_status,status,application_status,select_company,drive_date,error; 
    String remoteurl,remotefilepath,localdirectorypath,fileName,resume1;
    int yop,current_year,res;
    
  %>


<%
  sessregno=session.getAttribute("sessregno").toString();
  sessemail=session.getAttribute("sessemail").toString();  
if(!sessemail.equals(""))

  {
      cid=request.getParameter("cid1");
      regno=request.getParameter("regno1");
      Class.forName("com.mysql.cj.jdbc.Driver");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
      stmt=con.createStatement(); 
      select_student="select name,dept,doj,sslc,hsc,cgpa,current_arrear,history_of_arrear,yop from tbl_student where regno='"+sessregno+"' ";
      rs=stmt.executeQuery(select_student);
      if(rs.next()){
           sname=rs.getString(1);
           dept=rs.getString(2);
           doj=rs.getString(3);
           sslc=rs.getString(4);
           hsc=rs.getString(5);
           cgpa=rs.getString(6);
           current_arrear=rs.getString(7);
           history_arrear=rs.getString(8);
           yop=rs.getInt(9);
      }
       select_company="select name,drive_date from tbl_company where cmpid='"+cid+"'";
       rs=stmt.executeQuery(select_company);
       if(rs.next()){
        cname=rs.getString(1);
        drive_date=rs.getString(2);
       }
status="APPLIED";
application_status=null;
drive_status=null;
campus_status=null;
select="select * from tbl_drive where regno='"+sessregno+"' and id='"+cid+"'";
rs=stmt.executeQuery(select);
if(rs.next()){%>
        
            <script>alert('already applied');location.href='apply-company.jsp?regno1=<%=sessregno%>&cid1=<%=cid%>';</script>
 <%}
    
           insert="insert into tbl_drive(regno,student_name,dept,doj,sslc,hsc,cgpa,current_arrear,history_arrear,yop,id,cname,drive_date,status,application_status,drive_status,campus_status) values"
                   + "('"+regno+"','"+sname+"','"+dept+"','"+doj+"','"+sslc+"','"+hsc+"','"+cgpa+"','"+current_arrear+"','"+history_arrear+"','"+yop+"','"+cid+"','"+cname+"','"+drive_date+"','"+status+"','"+application_status+"','"+drive_status+"','"+campus_status+"')";
           res=stmt.executeUpdate(insert);
           if(res>0){%>
           
                        <script>alert('Inserted Successfully');location.href='upload_resume.jsp?cid=<%=cid%>';</script>
            <%}
           else{
           error="Something went wrong. Please try again";%>
           <script>location.href='apply-company.jsp?regno1=<%=sessregno%>&cid1=<%=cid%>&error=<%=error%>';</script>
<% }
  }

    
    
else
{
%>
<script>alert('session destroyed');location.href='home.jsp';</script>
<% }
%>  
  