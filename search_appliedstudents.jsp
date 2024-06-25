<%@page import ="java.sql.*" %>
<%@page import ="java.time.YearMonth"%>
<%@page import ="java.time.format.DateTimeFormatter" %>

<%!
    
    String select,id,name,current_year,cid;
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
//        YearMonth ym=new YearMonth();
//        msg=request.getParameter("msg");
//        error=request.getParameter("error");
%>


<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>PAS| Edit Student </title>
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

<%@include file='leftbar.jsp' %>

<div class='main-page'>

<div class='container-fluid'>
<div class='row page-title-div'>
<div class='col-md-6'>
<h2 class='title'>Students</h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard1.jsp'><i class='fa fa-home'></i> Home</a></li>

<li class='active'>Search Applied Student Details</li>
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
<h5>Search by Department</h5>
</div>
</div>
<div class='panel-body'>
<form class='form-horizontal' method='post' action='applied-students.jsp'>
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company</label>
<div class='col-sm-10'>
<select  name='cid'  class=textfield  style=width:200px; required>
   <%
    select="select cmpid,name from tbl_company";
    rs=stmt.executeQuery(select);
        while(rs.next()){   
        
                      cid=rs.getString(1);
                      name=rs.getString(2);
                       %>
                    <option value='<%=cid%>'><%=name%>(<%=cid%>)</option>   
        <%}
                    
        %>
                      
</select>
</div>
</div>
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Department</label>
<div class='col-sm-10'>
<select readonly name='dept'  class=textfield  style=width:200px; required>
<option value='Civil'>Civil</option>
<option value='Computer science'>Computer science</option>
<option value='Electronics and communication'>Electronics and communication</option>
<option value='Electrical and electronics'>Electrical and electronics</option>
<option value='Information technology'>Information technology</option>
<option value='Mechanical'>Mechanical</option>
</select>
</div>
</div>


<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Year Of Passing</label>
<div class='col-sm-10'>
<input type='number' min='%s' max='2100'  name='yop' class='form-control' value='<%=current_year%>'>
</div>
</div>
                                    


<div class='form-group'>
<div class='col-sm-offset-2 col-sm-10'>
<input type='submit' name='search' class='btn btn-primary' value='search'>
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
