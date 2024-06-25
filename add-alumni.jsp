<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import ="java.sql.*" %>
<%@page import ="java.time.LocalDate"%>;

<%!
    
    String sessemail,sesstype,select,id,name,msg,error,nid,aid,passed_out,cname,regno,dept,status,insert;
    
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
 
     msg=request.getParameter("msg");
     error=request.getParameter("error");
    %>
                      

<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>PMS Admin Add alumni </title>
<link rel='stylesheet' href='css/bootstrap.min.css' media='screen' >
<link rel='stylesheet' href='css/font-awesome.min.css' media='screen' >
<link rel='stylesheet' href='css/animate-css/animate.min.css' media='screen' >
<link rel='stylesheet' href='css/lobipanel/lobipanel.min.css' media='screen' >
<link rel='stylesheet' href='css/prism/prism.css' media='screen' >
<link rel='stylesheet' href='css/select2/select2.min.css' >
<link rel='stylesheet' href='css/main.css' media='screen' >
<script>
function companyname()
{
status=document.getElementById('status').value
if(status=='Placed')
{
document.alumni.cname.disabled=false;
}
else
{
document.alumni.cname.disabled=true;
}
}
</script>
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
<h2 class='title'>Add alumni Details</h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard.jsp'><i class='fa fa-home'></i> Home</a></li>
<li> Alumni</li>
<li class='active'>Add alumni</li>
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
<h5>Add Alumni Details</h5>
</div>
</div>
<div class='panel-body'>
<!--if(msg!=None):
    print "<div class='alert alert-success left-icon-alert' role='alert'>"
    print "<strong>Well done!</strong>%s"%(msg)
    print "</div>"
elif(error!=None):
    print "<div class='alert alert-danger left-icon-alert' role='alert'>"
    print "<strong>Oh snap!</strong>%s"%(error)
    print "</div>"-->
<form class='form-horizontal' name='alumni' method='post' action="save-alumni.jsp">
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Student Id</label>
<div class='col-sm-10'>
<input name='aid' class='form-control' id='default' placeholder='Student Id'required='required'>
</div>
</div>
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Student Name</label>
<div class='col-sm-10'>
<input type='text' name='name' class='form-control' id='default' placeholder='Student name' required='required'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>passed out</label>
<div class='col-sm-10'>
<input type='text' name='passed_out' class='form-control' required='required'placeholder="Ex:2024">
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Department</label>
<div class='col-sm-10'>
<select name='dept' class='form-control' id='default' required='required'placeholder="Select">

<option value='B.E-Civil'>B.E-Civil</option>
<option value='Computer science'>Computer science</option>
<option value='Electronics and communication'>Electronics and communication</option>
<option value='Electrical and electronics'>Electrical and electronics</option>
<option value='Information technology'>Information technology</option>
<option value='Mechanical'>Mechanical</option>
</select>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Campus Status</label>
<div class='col-sm-10'>
<select name='status' class='form-control' id='status' required='required' onchange='return companyname();'>
<option value='0'>--select--
<option value='Placed'>Placed
<option value='Not placed'>Not placed
</select>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company Name</label>
<div class='col-sm-10'>
<input type='text' name='cname' class='form-control' id='default' placeholder='company ' required='required'>
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


<% }
else
{
%>
            <script>alert('session destroyed');location.href='home.jsp';</script>
<%}

%>
    