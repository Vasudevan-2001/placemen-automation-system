<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.util.ArrayList" %>
<%@page import ="javax.servlet.*" %>

<%!
String msg,error,select,cid,name,drive_date,drive_details,sessemail,sesstype,mobile,email,campus,e_sslc,e_hsc,e_cgpa;
String e_ca,e_hoa,location,website,insert;
int res;
String[] dept;
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
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
        stmt=con.createStatement();
  
        cid=request.getParameter("cid1");
     
   %>

<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>PAS Admin Add Company Profile </title>
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
<%@include file='topbar.jsp' %>

<!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
<div class='content-wrapper'>
<div class='content-container'>

<!-- ========== LEFT SIDEBAR ========== -->

<%@include file='leftbar.jsp' %>
<!-- /.left-sidebar -->

<div class='main-page'>

<div class='container-fluid'>
<div class='row page-title-div'>
<div class='col-md-6'>
<h2 class='title'>Add Company Details</h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard.jsp'><i class='fa fa-home'></i> Home</a></li>
<li> Drives</li>
<li class='active'>Add Company</li>
<li class='active'>Add Company Profile</li>
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
<h5>Add Company Profile</h5>
</div>
</div>
<div class='panel-body'>


<form class='form-horizontal' method='post' action='company_profile.jsp' enctype='multipart/form-data'>
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company Id</label>
<div class='col-sm-10'>

<input type="text" name='cid' class='form-control' id='default' readonly required='required' value='<%=cid%>'>
</div>
</div>


<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company profile</label>
<div class='col-sm-10'>
<input type='file' name='cprofile' class='form-control' required='required'>
</div>
</div>




<div class='form-group'>
<div class='col-sm-offset-2 col-sm-10'>
<input type='submit' name='submit' class='btn btn-primary' value='save'>
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


<%}
        
else
{
%>
            <script>alert('session destroyed');location.href='home.jsp';</script>
<%}


%>