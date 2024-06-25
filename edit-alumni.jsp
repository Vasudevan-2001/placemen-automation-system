<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.time.LocalDate"%>;

<%!
    
    String sessemail,sesstype,yop,aid,dept,name,passed_out,status,company_name,regno,select,cname,update,msg,error,select1;
    int count,res;
    int current_year,currentYear;
    Connection con;
    Statement stmt;
    ResultSet rs,rs1;

    %>
    
<%
  sesstype=session.getAttribute("sesstype").toString();
  sessemail=session.getAttribute("sessmail").toString();  
  if(!sessemail.equals(""))
  { 
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
        stmt=con.createStatement();
        aid=request.getParameter("aid1");
        select1 = "select * from tbl_drive where regno='"+aid+"'";
        rs=stmt.executeQuery(select1);
        if(rs.next()){
            name=rs.getString(2);
            dept=rs.getString(3);
            passed_out=rs.getString(10);
            cname=rs.getString(12);
            status=rs.getString(18);
            
        }
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
<script>
function companyname()
{
status=document.getElementById('status').value;
if(status==='PLACED')
{
document.alumni.cname.disabled=false;
document.alumni.cname.value='<%=cname%>';
}
else
{
document.alumni.cname.value='-';
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
<h2 class='title'>View alumni Details</h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard.jsp'><i class='fa fa-home'></i> Home</a></li>
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
<input type='text' name='name' class='form-control' id='default' placeholder='student name' value='<%=name%>' required='required'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>passed out</label>
<div class='col-sm-10'>
<input type='text' name='passed_out' class='form-control' value='<%=passed_out%>' required='required'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Department</label>
<div class='col-sm-10'>
<select name='dept' class='form-control' id='default' required='required'>
<option value='<%=dept%>' selected><%=dept%>
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
 <%
if(status=="PLACED"){%>
           <option value='Placed' selected>Placed
           <option value='Not Placed'>Not placed
<%}
else if(status=="NOT PLACED"){%>
           <option value='PLACED'>Placed
           <option value='NOT PLACED' selected>Not placed
               <%}%>
</select>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company Name</label>
<div class='col-sm-10'>

<input type='text' name='cname' class='form-control' id='default' placeholder='' value='<%=cname%>' required='required'>

</div>
</div>


<div class='form-group'>
<div class='col-sm-offset-2 col-sm-10'>
<input type='submit' name='update' class='btn btn-primary' value='update'>
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