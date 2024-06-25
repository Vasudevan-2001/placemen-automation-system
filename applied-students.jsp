<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.util.Date" %>
<%@page import ="java.text.SimpleDateFormat" %>

<%!
    
    String select,id,name,dept,cid,cid1,dept1,regno,student_name,yop,resume,cname,app_status,drive_date;
    int current_year,cnt=0;
    Connection con;
    ResultSet rs;
    Statement stmt;
    String sessemail,sesstype,remotefilepath,remoteurl;
    
 %>   
 
<%
  sesstype=session.getAttribute("sesstype").toString();
  sessemail=session.getAttribute("sessmail").toString();  
  if(!sessemail.equals(""))
  {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
        stmt=con.createStatement();
        dept=request.getParameter("dept");
        cid=request.getParameter("cid");
//        cid1=request.getParameter("cid1");
//        dept1=request.getParameter("dept1");
//        out.print(cid);
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy"); /*yyyy-MM-dd HH:mm:ss */
        current_year=Integer.parseInt(sdf.format(new Date()));
  %>
  <!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Admin Manage Applied students </title>
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
<script type='text/javascript'>//<![CDATA[ 
$(window).load(function(){<!--   w  w  w . j  a v a2  s. co m-->
//save the selector so you don't have to do the lookup everytime
$dropdown = $('#contextMenu');
$('.actionButton').click(function() {
    //get row ID
    var id = $(this).closest('tr').children().first().html();
    //move dropdown menu
    $(this).after($dropdown);
    //update links
    
    //show dropdown
    $(this).dropdown();
});
});//]]>  
</script>

</head>
<body class='top-navbar-fixed'>
<div class='main-wrapper'>

<!-- ========== TOP NAVBAR ========== -->

<%@include file='topbar.jsp' %>
<!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
<div class='content-wrapper'>
<div class='content-container'>

<%@include file='leftbar.jsp' %>

<div class='main-page'>
<div class='container-fluid'>
<div class='row page-title-div'>
<div class='col-md-6'>
<h2 class='title'>Manage Applied students </h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard.jsp'><i class='fa fa-home'></i> Home</a></li>
<li> Applied students</li>
<li class='active'>Manage Applied students </li>
</ul>
</div>

</div>
<!-- /.row -->
</div>
<!-- /.container-fluid -->

<section class='section'>
<div class='container-fluid'>



<div class='row'>
<div class='col-md-12'>

<div class='panel'>
<div class='panel-heading'>
<div class='panel-title'>
<h5>View Applied students Info</h5>
</div>
</>
<%
select="select dept,id from tbl_drive where drive_date>=curdate() and (dept='"+dept+"' or dept='"+dept+"') and (id='"+cid+"' or id='"+cid+"') and yop='"+current_year+"'";

rs=stmt.executeQuery(select);
if(rs.next()){
    dept=rs.getString(1);
    id=rs.getString(2);
}
remoteurl="resume";
remotefilepath=request.getRealPath(remoteurl);
%>
<div class='panel-body p-20'>
<p align='center'><font color='red'><b><u>Click To Send Notification to all Accepted Students</u></b></font>&nbsp;
<a href='sendmail.jsp?dept1=<%=dept%>&cid1=<%=cid%>'><button name='Mail'><font color='darkgreen'><b>SEND MAIL</b></font></button></a></p>
<table id='example' class='display table table-striped table-bordered' cellspacing='0' width='100%'>
<thead>
<tr>
<th>#</th>
<th>Student Regno</th>
<th>Student Name</th>
<th>Year of passing</th>
<th>Department</th>
<th>Resume</th>
<th>Company Name</th>
<th>Drive Date</th>
<th>Academic details</th>
<th>Application status</th>
<th>Action</th>
</tr>
</thead>
<tbody>
<%
String select1="select regno,student_name,yop,dept,resume,id,cname,drive_date,application_status from tbl_drive where drive_date>=curdate()";
rs=stmt.executeQuery(select1);
while(rs.next()){
        regno=rs.getString(1);
        student_name=rs.getString(2);
        yop=rs.getString(3);
        dept=rs.getString(4);
        resume=rs.getString(5);
        cid=rs.getString(6);
        cname=rs.getString(7);
        drive_date=rs.getString(8);
        app_status=rs.getString(9);


%>
      <ul id='contextMenu' class='dropdown-menu' role='menu'>
        <li><a tabindex='-1' href='update_drive.jsp?regno1=<%=regno%>&cid1=<%=cid%>&app_status=ACCEPTED&dept1=<%=dept%>' class='editLink'><font colour="green">Accept</font></a></li>
        <li><a tabindex='-1' href='update_drive.jsp?regno1=<%=regno%>&cid1=<%=cid%>&app_status=REJECTED&dept1=<%=dept%>' class='editLink'><font colour="red">Reject</font></a></li>

        <li><a tabindex=-1' href='delete-student.jsp?regno1=<%=regno%>' class='delLink'>Delete</a></li>
        </ul>
        <tr>
        <td>.
            <% cnt=cnt+1; %>
        <%=cnt%>
        
        </td>
        <td>
        <%=regno%>
        </td>
        <td>
        <%=student_name%>
        </td>
        <td>
        <%=yop%>
        </td>
        <td>
        <%=dept%>
        </td>
        <td>
        <a href='<%=remoteurl+"/"+regno+"/"+ resume%>' target="_blank"><font color='red'><i><u>view/download</u></i></font></a>
        </td>
        <td>
        <%=cname%>
        </td>
        <td>
        <%=drive_date%>
        </td>
        <td>
        <a href='viewapplied-students.jsp?regno1=<%=regno%>&cid1=<%=cid%>'><i><u>view</u></i></a>
        </td>
        <td class='dropdown'>
        <%    
        if(app_status=="ACCEPTED"){%>
            <font color='darkgreen'><b>
            <%=app_status%>
            </b></font>
            </td>
         <%}
        else{%>
            <font color='darkred'><b>
            <%=app_status%>
            </b></font>
            </td>
          <%}%>
        <td>
        <a href='update_drive.jsp?regno1=<%=regno%>&cid1=<%=cid%>&app_status=ACCEPTED&dept1=<%=dept%>'>
        <i  title='ACCEPT Record'>ACCEPT</i> </a><br>
        <a href='update_drive.jsp?regno1=<%=regno%>&cid1=<%=cid%>&app_status=REJECTED&dept1=<%=dept%>'>
        <i  title='REJECT Record'>REJECT</i></a> 
        </td></tr>
        <%

 } %>
</tbody>
</table>
<p align='center'><font color='red'><b><u>Click To Print all Accepted Students List</u></b></font>&nbsp;
<a href='print.jsp?dept1=<%=dept%>&cid1=<%=cid%>' target='_blank'><button name='print'><font color='darkgreen'><b>PRINT</b></font></button></a></p>


<!-- /.col-md-12 -->
</div>
</div>
</div>
<!-- /.col-md-6 -->


</div>
<!-- /.col-md-12 -->
</div>
</div>
<!-- /.panel -->
</div>
<!-- /.col-md-6 -->

</div>
<!-- /.row -->

</div>
<!-- /.container-fluid -->
</section>
<!-- /.section -->

</div>
<!-- /.main-page -->



</div>
<!-- /.content-container -->
</div>
<!-- /.content-wrapper -->

</div>
<!-- /.main-wrapper -->

<!-- ========== COMMON JS FILES ========== -->
<script src='js/jquery/jquery-2.2.4.min.js'></script>
<script src='js/bootstrap/bootstrap.min.js'></script>
<script src='js/pace/pace.min.js'></script>
<script src='js/lobipanel/lobipanel.min.js'></script>
<script src='js/iscroll/iscroll.js'></script>

<!-- ========== PAGE JS FILES ========== -->
<script src='js/prism/prism.js'></script>
<script src='js/DataTables/datatables.min.js'></script>

<!-- ========== THEME JS ========== -->
<script src='js/main.js'></script>
<script>
$(function($) {
$('#example').DataTable();

$('#example2').DataTable( {
'scrollY':        '300px',
'scrollCollapse': true,
'paging':         false
} );

$('#example3').DataTable();
});
</script>
</body>
</html>
<% }
else
{
%>
            <script>alert('session destroyed');location.href='home.jsp';</script>
<%}

%>

