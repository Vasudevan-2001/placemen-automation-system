<%@page import ="java.sql.*" %>
<%@page import ="java.util.Date" %>
<%@page import ="java.text.SimpleDateFormat" %>

<%!
    
    String select,id,name,dept,cid,cid1,dept1,regno,student_name,yop,resume,cname,app_status,drive_date,select1,mob,sslc,mail,hsc,cgpa;
    int current_year,cnt=1;
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
      cid1=request.getParameter("cid1");
      dept1=request.getParameter("dept1");
   %>
 <!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Students Name List </title>
<link rel='stylesheet' href='css/bootstrap.min.css' media='screen' >
<link rel='stylesheet' href='css/font-awesome.min.css' media='screen' >
<link rel='stylesheet' href='css/animate-css/animate.min.css' media='screen' >
<link rel='stylesheet' href='css/lobipanel/lobipanel.min.css' media='screen' >
<link rel='stylesheet' href='css/prism/prism.css' media='screen' > <!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
<link rel='stylesheet' type='text/css' href='js/DataTables/datatables.min.css'/>
<link rel='stylesheet' href='css/main.css' media='screen' >
<script src='js/modernizr/modernizr.min.js'></script>
<style>

.errorWrap {
padding: 10px;
margin: 0 0 20px 0;
background: #fff;
border-left: 4px solid #dd3d36;
-webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
.succWrap{
padding: 10px;
margin: 0 0 20px 0;
background: #fff;
border-left: 4px solid #5cb85c;
-webkit-box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
box-shadow: 0 1px 1px 0 rgba(0,0,0,.1);
}
</style>

<script type='text/javascript'
  src='http://code.jquery.com/jquery-2.0.2.js'></script>
<link rel='stylesheet' type='text/css'
  href='http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css'>
<script type='text/javascript'
  src='http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js'></script>
<link rel='stylesheet' type='text/css'
  href='http://netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css'>
</head>
<body class='top-navbar-fixed' onload='window.print()'>

<%

        SimpleDateFormat sdf=new SimpleDateFormat("yyyy"); /*yyyy-MM-dd HH:mm:ss */
        current_year=Integer.parseInt(sdf.format(new Date()));
%>

<table id='example' class='display table table-striped table-bordered' cellspacing='5' align='center' width='100%'>
<caption><center><b><font color='red'>ELIGIBLE STUDENTS LIST</font></b></center></caption><thead>
<tr>
<th>S.No</th>
<th>Student Regno</th>
<th>Student Name</th>
<th>Department</th>
<th>Phone</th>
<th>Mailid</th>
<th>SSLC</th>
<th>HSC/DIPLOMA</th>
<th>CGPA</th>
</tr>
</thead>
<tbody>
<%
try{
select="select regno,student_name,dept from tbl_drive where drive_date>=curdate() and  yop='"+current_year+"' and  application_status='ACCEPTED'";
rs=stmt.executeQuery(select);
while(rs.next()){
        regno=rs.getString(1);
        student_name=rs.getString(2);
        dept=rs.getString(3);
        select1="select mobile,email,sslc,hsc,cgpa from tbl_student where regno='"+regno+"'";
        rs=stmt.executeQuery(select1);
        if(rs.next()){
                mob=rs.getString(1);
                mail=rs.getString(2);
                sslc=rs.getString(3);
                hsc=rs.getString(4);
                cgpa=rs.getString(5);%>
        
                
                              <tr>
                              <td>
                              <%=cnt%>
                              </td>
                              <td>
                               <%=regno%>
                              </td>
                              <td>
                               <%=student_name%>
                              </td>
                              <td>
                               <%=dept%>
                              </td>
                              <td>
                               <%=mob%>
                              </td>
                              <td>
                               <%=mail%>
                              </td>
                              <td>
                               <%=sslc%>
                              </td>
                              <td>
                               <%=hsc%>
                              </td>
                              <td>
                               <%=cgpa%>
                              </td>
                              </tr>
                              <%cnt=cnt+1;
}
}
}
catch(Exception e){

    out.print(e.getMessage());%>
     <script>location.href='applied-students.jsp?dept1=<%=dept1%>&cid1=<%=cid1%>';</script>
<%
}
%>
</tbody>
</table>
      
</body>
</html>


<% }
else
{
%>
            <script>alert('session destroyed');location.href="home.jsp";</script>
<%}

%>

