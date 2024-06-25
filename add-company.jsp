<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.time.YearMonth"%>
<%@page import ="java.time.format.DateTimeFormatter" %>
<%!
   String sessemail,sesstype,cid;
   Connection con;
    ResultSet rs;
    Statement stmt;
   
    int sid,id;
   
%>
<%
  sesstype=session.getAttribute("sesstype").toString();
  sessemail=session.getAttribute("sessmail").toString();  
  if(!sessemail.equals(""))
  {
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
        stmt=con.createStatement();
       %>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>PMS Admin Add Company </title>
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
<h5>Add Company Details</h5>
</div>
</div>
<div class='panel-body'>
<form class='form-horizontal' method='post' action='company_action.jsp' >
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company Id</label>
<div class='col-sm-10'>
<%
String selectQuery="select ifnull(max(id),0) from tbl_company";
rs=stmt.executeQuery(selectQuery);
if(rs.next())
{
sid=rs.getInt(1);
id=sid+1;
cid="CID"+Integer.toString(id);

}


%>
<input type='hidden' name='autoid' value='<%=id%>'>
<input name='cid' class='form-control' id='default' readonly required='required' value='<%=cid%>'>
</div>
</div>
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company Name</label>
<div class='col-sm-10'>
<input type='text' name='cname' class='form-control' id='default' placeholder='Company Name' required='required'>
</div>
</div>
<!--
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company profile</label>
<div class='col-sm-10'>
<input type='file' name='cprofile' class='form-control' >
</div>
</div>-->

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Drive Details</label>
<div class='col-sm-10'>
<textarea type='text' name='drive_details' class='form-control' id='default' rows='10' placeholder='' required='required'></textarea>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Eligibility Criteria</label>
<div class='col-sm-10'>
<table border='1'><tr><td>DEPARTMENTS <td>
<input type='checkbox' name='dept' value='Computer Science' > CSE
<input type='checkbox' name='dept' value='Information technology' >IT
<input type='checkbox' name='dept' value='Electrical and communication' >ECE
<input type='checkbox' name='dept' value='Electrical and electronics' >EEE
<input type='checkbox' name='dept' value='Civil' >CIVIL
<input type='checkbox' name='dept' value='Mechanical' >MECH
</td></tr>

<div class='col-sm-10'>
<table border='1'><tr><td>SSLC<td><select name='e_sslc' class='form-control' placeholder='' required='required'>
<option value='0'>No Criteria
<option value='45'>45 % above
<option value='50'>50 % above
<option value='60'>60 % above
<option value='70'>70 % above
<option value='80'>80 % above
<option value='90'>90 % above
</select>
</td></tr>
<tr><td>HSC<td><select name='e_hsc' class='form-control' placeholder='' required='required'>
<option value='0'>No Criteria
<option value='45'>45 % above
<option value='50'>50 % above
<option value='60'>60 % above
<option value='70'>70 % above
<option value='80'>80 % above
<option value='90'>90 % above
</select>
</td></tr>
<tr><td>CGPA<td><select name='e_cgpa' class='form-control' placeholder='' required='required'>
<option value='0'>No Criteria
<option value='6'> > 6.0 
<option value='7'> > 7.0 
<option value='8'> > 8.0 
<option value='9'> > 9.0 
</select>
</td></tr>
<tr><td>Current Arrears<td><select name='e_ca' class='form-control' placeholder='' required='required'>
<option value='No Criteria'>No Criteria
<option value='0'>0
<option value='1'>1
<option value='2'>2
<option value='3'>3
<option value='4'>4
<option value='5'>5
<option value='6'>6
<option value='7'>7
<option value='8'>8
<option value='9'>9
<option value='10'>10
</select>

</td></tr>
<tr><td>History Of Arrears<td><select name='e_hoa' class='form-control' placeholder='' required='required'>
<option value='No Criteria'>No Criteria
<option value='0'>0
<option value='1'>1
<option value='2'>2
<option value='3'>3
<option value='4'>4
<option value='5'>5
<option value='6'>6
<option value='7'>7
<option value='8'>8
<option value='9'>9
<option value='10'>10
</select>
</td></tr>
</table>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Drive Date</label>
<div class='col-sm-10'>
<input type='date' name='drive_date' class='form-control' id='default' placeholder='' required='required'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Drive Location</label>
<div class='col-sm-10'>
<input type='text' name='location' class='form-control' id='default' placeholder='Ex:Chennai' required='required'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company website</label>
<div class='col-sm-10'>
<input type='text' name='website' class='form-control' id='default' placeholder='www.tcs.com' required='required'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Campus</label>
<div class='col-sm-10'>
<select name='campus' class='form-control' id='default' placeholder='' required='required'>
<option value='on campus'>on campus
<option value='off campus'>off campus</select>
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

