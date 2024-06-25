
<%@page import ="java.sql.*" %>
<%@page import ="java.util.Date" %>
<%@page import ="java.text.SimpleDateFormat" %>

<%!
String sessemail,sessregno,regno,name,mob,mail,sslc,hsc,cgpa,insert,dept1,dept,yop,yop1,select;
int res,cnt,current_year;

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
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
        stmt=con.createStatement();
        dept=request.getParameter("dept");
        yop=request.getParameter("yop");
        dept1=request.getParameter("dept1");
        yop1=request.getParameter("yop1");
     
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
<body class='top-navbar-fixed' onload='window.<%=%>()'>


    <%
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy"); /*yyyy-MM-dd HH:mm:ss */
        current_year=Integer.parseInt(sdf.format(new Date()));
%>
<table id='example' class='display table table-striped table-bordered' cellspacing='5' align='center' width='100%'>
<caption><center><b><font color='darkgreen'>STUDENTS DETAILS</font></b></center></caption><thead>
<tr>
<th>#</th>
<th>Student Regno</th>
<th>Student Name</th>
<th>Department</th>
<th>phone</th>
<th>Mailid</th>
<th>SSLC</th>
<th>HSC/DIPLOMA</th>
<th>CGPA</th>
</tr>
</thead>
<tbody>
 <%
select="select regno,name,dept,mobile,email,sslc,hsc,cgpa from tbl_student where dept='"+dept1+"' and yop='"+yop1+"'";
rs=stmt.executeQuery(select);
if(rs.next()){
        regno=rs.getString(1);
        name=rs.getString(2);
        dept=rs.getString(3);
        mob=rs.getString(4);
        mail=rs.getString(5);
        sslc=rs.getString(6);
        hsc=rs.getString(7);
        cgpa=rs.getString(8);

%>

        <tr>
        <td>
        <%=cnt%>
        </td>
        <td>
        <%=regno%> 
        </td>
        <td>
        <%=name%> 
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

}%>
</tbody>
</table>
    <script>location.href='studentsdetails.jsp?dept1=<%=dept1%>&yop1=<%=yop1%>';</script>
</body>
</html>

