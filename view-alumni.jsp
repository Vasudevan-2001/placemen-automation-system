<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>

<%!
   String sessemail,sessregno,dept,select,regno,aid,name,passed_out,status,company_name;
 
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
        aid=request.getParameter("aid");
  %>
        <!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>PMS Admin View alumni </title>
<link rel='stylesheet' href='css/bootstrap.min.css' media='screen' >
<link rel='stylesheet' href='css/font-awesome.min.css' media='screen' >
<link rel='stylesheet' href='css/animate-css/animate.min.css' media='screen' >
<link rel='stylesheet' href='css/lobipanel/lobipanel.min.css' media='screen' >
<link rel='stylesheet' href='css/prism/prism.css' media='screen' >
<link rel='stylesheet' href='css/select2/select2.min.css' >
<link rel='stylesheet' href='css/main.css' media='screen' >

<script src='js/modernizr/modernizr.min.js'></script>
</head>
<body class='top-navbar-fixed'>
<div class='main-wrapper'>

<!-- ========== TOP NAVBAR ========== -->
<%@include file="topbar.jsp" %>
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
<a href='dashboard1.jsp'><i class='fa fa-dashboard'></i> <span>Dashboard</span> </a>

</li>

<li class='nav-header'>
<span class=''>Appearance</span>
</li>

<li class='has-children'>
<a href='#'><i class='fa fa-info-circle'></i> <span>Company</span> <i class='fa fa-angle-right arrow'></i></a>
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
<h2 class='title'>View alumni Details</h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard1.jsp'><i class='fa fa-home'></i> Home</a></li>
<li> Alumni</li>
<li class='active'>View alumni</li>
</ul>
</div>

</div>
<!-- /.row -->
</div>
<div class='container-fluid'>

<div class='row'>
<div class='col-md-12'>
<div class='panel'>
<div class='panel-heading'>
<div class='panel-title'>
<h5>View alumni Details</h5>
</div>
</div>
<div class='panel-body'>
<!--if(msg!=None):
    <div class='alert alert-success left-icon-alert' role='alert'>"
    <strong>Well done!</strong>%s"%(msg)
    </div>"
elif(error!=None):
    <div class='alert alert-danger left-icon-alert' role='alert'>"
    <strong>Oh snap!</strong>%s"%(error)
    </div>-->

<%
 select="select * from tbl_alumni where id='"+aid+"' and status='placed'";
 rs=stmt.executeQuery(select);
    if(rs.next()){
      
           aid=rs.getString(1);
           name=rs.getString(2);
           dept=rs.getString(3);
           passed_out=rs.getString(4);
           status=rs.getString(5);
           company_name=rs.getString(6);
    
    }
  %>
<form class='form-horizontal' name='alumni' method='post' ENCTYPE='multipart/form-data'>
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Student Id</label>
<div class='col-sm-10'>
<input name='aid' class='form-control' id='default' value='<%=aid%>' readonly required='required'>
</div>
</div>
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Student Name</label>
<div class='col-sm-10'>
<input type='text' name='name' class='form-control' id='default' value='<%=name%>' readonly placeholder='student name' required='required'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>passed out</label>
<div class='col-sm-10'>
<input type='text' name='passed_out' class='form-control'  value='<%=passed_out%>' readonly required='required'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Department</label>
<div class='col-sm-10'>
<input type='text' name='dept' class='form-control' id='default'  value='<%=dept%>' readonly required='required'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Campus Status</label>
<div class='col-sm-10'>
<input type='text' name='status' class='form-control' id='status' readonly required='required' value='<%=status%>'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company Name</label>
<div class='col-sm-10'>
    <input type='text' name='cname' class='form-control' id='default' placeholder=''  readonly value='<%=company_name%>' required='required'>
</div>
</div>


<div class='form-group'>
<div class='col-sm-offset-2 col-sm-10'>
<input type='submit' name='back' class='btn btn-primary' value='back' formaction='viewalumni.jsp'>
</div>
</div>
</form>

</div>
</div>
</div>
<!-- /.col-md-12 -->
</div>
</div>
</div>
<!-- /.content-container -->
</div>
<!-- /.content-wrapper -->
</div>
<!-- /.main-wrapper -->
<script src='js/jquery/jquery-2.2.4.min.js'></script>
<script src='js/bootstrap/bootstrap.min.js'></script>
<script src='js/pace/pace.min.js'></script>
<script src='js/lobipanel/lobipanel.min.js'></script>
<script src='js/iscroll/iscroll.js'></script>
<script src='js/prism/prism.js'></script>
<script src='js/select2/select2.min.js'></script>
<script src='js/main.js'></script>
<script>
$(function($) {
$('.js-states').select2();
$('.js-states-limit').select2({
maximumSelectionLength: 2
});
$('.js-states-hide').select2({
minimumResultsForSearch: Infinity
});
});
</script>
</body>
</html>

<% }
    else
{
%>
<script>alert('session destroyed');location.href='home.jsp';</script>
<% }
%>  
    
  