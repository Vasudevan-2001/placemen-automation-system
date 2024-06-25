<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.time.LocalDate"%>;

<%!
    
    String sessemail,sesstype,nid,date,notification,select;
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
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","root","vasudevan6385742738@");
        stmt=con.createStatement();
 
   

 
    nid=request.getParameter("nid1");
    select="select * from tbl_notification where nid='"+nid+"'";
    rs=stmt.executeQuery(select);
    if(rs.next()){
        nid=rs.getString(2);
        date=rs.getString(3);
        notification=rs.getString(4);

 }

%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>PMS Admin Notifications </title>
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
<h2 class='title'>Add Notification Details</h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard.jsp'><i class='fa fa-home'></i> Home</a></li>
<li> Drives</li>
<li class='active'>Edit Notification</li>
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
<h5>Edit Notification Details</h5>
</div>
</div>
<div class='panel-body'>
<!--##<?php if($msg){?>
if(msg!=None):
    print "<div class='alert alert-success left-icon-alert' role='alert'>
    print "<strong>Well done!</strong>%s"%(msg)
    ##<?php echo htmlentities($msg); ?>
    print "</div>"
    ##<?php }
    ##else if($error){?>
elif(error!=None):
    print "<div class='alert alert-danger left-icon-alert' role='alert'>"
    print "<strong>Oh snap!</strong>%s"%(error)
    print "</div>"-->
<form class='form-horizontal' method='post' action='update_notify.jsp' >
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Notification Id</label>
<div class='col-sm-10'>

<input name='nid' class='form-control' id='default' readonly required='required' value='<%=nid%>' readonly>
</div>
</div>
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Date:</label>
<div class='col-sm-10'>
<input type='date' name='date' class='form-control' value='<%=date%>' id='default' placeholder='' required='required'>
</div>
</div>
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Notification:</label>
<div class='col-sm-10'>
<textarea name='notify' class='form-control' id='default' required='required'><%=notification%></textarea>
</div>
</div>




<div class='form-group'>
<div class='col-sm-offset-2 col-sm-10'>
<input type='submit' name='submit' class='btn btn-primary' value='Update'>
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
 

