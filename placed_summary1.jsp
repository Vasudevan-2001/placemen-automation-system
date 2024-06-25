<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>

<%!
   String sessemail,sessregno,select,select1,msg, error;
   int count=0,count1=0;
   String regno, student_name,yop,dept,resume,cid,cname,drive_date,app_status,drive_status,campus_status;
   
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
        msg=request.getParameter("msg");
        error=request.getParameter("errors");
        cid=request.getParameter("cid");
        yop=request.getParameter("yop");
        dept=request.getParameter("dept");
        

  %>
  <!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Admin Drive Summary </title>
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
<div class='content-wrapper'>
<div class='content-container'>
<div class='left-sidebar bg-black-300 box-shadow '>
<div class='sidebar-content'>
<div class='user-info closed'>
<img src='http://placehold.it/90/c2c2c2?text=User' alt='Student' class='img-circle profile-img'>
<h6 class='title'>User</h6>
<small class='info'>Student</small>
</div>
<!-- /.user-info -->

<div class='sidebar-nav'>
<ul class='side-nav color-gray'>
<li class='nav-header'>
<span class=''>Main Category</span>
</li>
<li>
    <a href='dashboard1.jsp?regno=<%=regno%>&smail=<%=sessemail%>'><i class='fa fa-dashboard'></i> <span>Dashboard</span> </a>

</li>

<li class='nav-header'>
<span class=''>Appearance</span>
</li>

<li class='has-children'>
<a href='#'><i class='fa fa-info-circle'></i> <span>Profile</span> <i class='fa fa-angle-right arrow'></i></a>
<ul class='child-nav'>
<li><a href='viewprofile.jsp'><i class='fa fa fa-server'></i> <span>Manage Profile</span></a></li>
</ul></li>

<li class='has-children'>
<a href='#'><i class='fa fa-info-circle'></i> <span>Drives</span> <i class='fa fa-angle-right arrow'></i></a>
<ul class='child-nav'>
<li><a href='viewcompany.jsp'><i class='fa fa fa-server'></i> <span>View Companies</span></a></li>
</ul>
</li>

<li class='has-children'>
<a href='#'><i class='fa fa-info-circle'></i> <span>Alumni</span> <i class='fa fa-angle-right arrow'></i></a>
<ul class='child-nav'>
<li><a href='viewalumni.jsp'><i class='fa fa fa-server'></i> <span>View Alumni students</span></a></li>
</ul>
<li><a href='change-password.jsp'><i class='fa fa fa-server'></i> <span> Student Change Password</span></a></li>
</li>
</div>
<!-- /.sidebar-nav -->
</div>
<!-- /.sidebar-content -->
</div>
<div class='main-page'>
<div class='container-fluid'>
<div class='row page-title-div'>
<div class='col-md-6'>
<h2 class='title'>Placed Students Summary </h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard.jsp'><i class='fa fa-home'></i> Home</a></li>
<li> Applied students</li>
<li class='active'>Drive Summary </li>
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
</div>
<!--if(msg!=None):
    print "<div class='alert alert-success left-icon-alert' role='alert'>"
    print "<strong>Well done!</strong>%s"%(msg)
    print "</div>"
elif(error!=None):
    print "<div class='alert alert-danger left-icon-alert' role='alert'>"
    print "<strong>Oh snap!</strong>%s"%(error)
    print "</div>"-->
<div class='panel-body p-20'>

<table id='example' class='display table table-striped table-bordered' cellspacing='0' width='100%'>
<thead>
<tr>
<th>#</th>
<th>Student Regno</th>
<th>Student Name</th>
<th>Year of passing</th>
<th>Department</th>
<th>Company Name</th>
<th>Drive Date</th>
<th>Campus Status</th>
</tr>
</thead>
<tbody>
    <%
//from datetime import datetime
//current_year=datetime.now().strftime('%Y')
select="select dept from tbl_student where regno='"+sessregno+"'";
rs=stmt.executeQuery(select);
if(rs.next()){
            dept=rs.getString(1);
            
        }

int cnt=0;
String select1="select regno,student_name,yop,dept,resume,id,cname,drive_date,application_status,drive_status,campus_status from tbl_drive where dept='"+dept+"' and campus_status='PLACED'";
rs=stmt.executeQuery(select1);
if(rs.next()){
        while(rs.next()){
        regno=rs.getString(1);
        student_name=rs.getString(1);
        yop=rs.getString(1);
        dept=rs.getString(1);
        resume=rs.getString(1);
        cid=rs.getString(1);
        cname=rs.getString(1);
        drive_date=rs.getString(1);
        app_status=rs.getString(1);
        drive_status=rs.getString(1);
        campus_status=rs.getString(1); %>
        <ul id='contextMenu' class='dropdown-menu' role='menu'>"
        <li><a tabindex='-1' href='update_drive.jsp?regno1=<%=regno%> cid1=<%=cid%>&app_status=ACCEPTED&dept1=<%=dept%>' class='editLink'>Accept</a></li>
        <li><a tabindex='-1' href='update_drive.jsp?regno1=<%=regno%>&cid1=<%=cid%>&app_status=REJECTED&dept1=<%=dept%>' class='editLink'>Reject</a></li>

        <li><a tabindex=-1' href='delete-student.jsp?regno1=<%=regno%>' class='delLink'>Delete</a></li>
        </ul>
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
        <%=yop%>
        </td>
        <td>
        <%=dept%>
        </td>
        <td>
        <%=cname%>
        </td>
        <td>
        <%=drive_date%>
        </td>
        <td>
        <font color='darkgreen'><b>
        <%=campus_status%>
        </b></font>
        </td>
        </tr>
        <%cnt=cnt+1;
            
        
        }
        }
        
String select2="select cname from tbl_drive where id='"+cid+"'";
rs=stmt.executeQuery(select2);
if(rs.next()){
         cname=rs.getString(1);
}
           
String select3="select id,name,passed_out,dept,company_name,status from tbl_alumni where dept='"+dept+"' and status='Placed'";
//##print <select
rs=stmt.executeQuery(select3);
if(rs.next()){
        while(rs.next()){
                
        regno=rs.getString(1);
        student_name=rs.getString(2);
        yop=rs.getString(3);
        dept=rs.getString(4);
        cname=rs.getString(5);
        campus_status=rs.getString(6);
                
}

}
 %>
        <ul id='contextMenu' class='dropdown-menu' role='menu'>
        <li><a tabindex='-1' href='update_drive.jsp?regno1=<%=regno%>&cid1=<%=cid%>app_status=ACCEPTED&dept1=<%=dept%>' class='editLink'>Accept</a></li>
        <li><a tabindex='-1' href='update_drive.jsp?regno1=<%=regno%>&cid1=<%=cid%>&app_status=REJECTED&dept1=<%=dept%>' class='editLink'>Reject</a></li>

        <li><a tabindex=-1' href='delete-student.jsp?regno1=<%=regno%>' class='delLink'>Delete</a></li>
        </ul>
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
        <%=yop%>
        </td>
        <td>
        <%=dept%> 
        </td>
        <td>
        <%=cname%>
        </td>
        <td>
        <%=drive_date%> 
        </td>
        <td>
        <font color='darkgreen'><b>
        <%=campus_status%>
        </b></font>
        </td>
        </tr>
        <%cnt=cnt+1;%>

</tbody>
</table>


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

<%  
  }
else
{
%>
<script>alert('session destroyed');location.href='home.jsp';</script>
<%}
%>



