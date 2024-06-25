
<%@page import ="java.sql.*" %>
<%@page import ="java.util.Date" %>
<%@page import ="java.text.SimpleDateFormat" %>


<%!
    Connection con;
    ResultSet rs;
    Statement stmt;
    String sessregno,sessemail;
    String   dept,sslc,hsc,cgpa,ca,hoa,select,location,website,regno,email;
    String cid,name,cprofile,drive_details,e_sslc,e_hsc,e_cgpa,e_ca,e_hoa,drive_date,campus,eligibility_status,status,application_status; 
    int yop,current_year;
    
  %>


<%
  sessregno=session.getAttribute("sessregno").toString();
  sessemail=session.getAttribute("sessemail").toString();  
if(!sessemail.equals(""))

  {
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
        stmt=con.createStatement(); 
        cid=request.getParameter("cid1");
        regno=request.getParameter("regno1");
        
        
       %>
    
<!DOCTYPE html>
<html lang='en'>

<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>PAS| Edit company </title>
<link rel='stylesheet' href='css/bootstrap.min.css' media='screen' >
<link rel='stylesheet' href='css/font-awesome.min.css' media='screen' >
<link rel='stylesheet' href='css/animate-css/animate.min.css' media='screen' >
<link rel='stylesheet' href='css/lobipanel/lobipanel.min.css' media='screen' >
<link rel='stylesheet' href='css/prism/prism.css' media='screen' >
<link rel='stylesheet' href='css/select2/select2.min.css' >
<link rel='stylesheet' href='css/main.css' media='screen' >
<script src='js/modernizr/modernizr.min.js'></script>

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
<a href='dashboard1.jsp?regno=<%=regno%>&smail=<%=email%>'><i class='fa fa-dashboard'></i> <span>Dashboard</span> </a>

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
<h2 class='title'>company details</h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard.jsp'><i class='fa fa-home'></i> Home</a></li>

<li class='active'>company details</li>
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
<h5>Fill the company info</h5>
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
<form class='form-horizontal' method='post' name='edit' action="drive.jsp">
<%
select="select * from tbl_company where cmpid='"+ cid+"'";
rs=stmt.executeQuery(select);
if(rs.next()){
            cid=rs.getString(2);
            session.setAttribute("CompanyId",cid);
            name=rs.getString(3);
            cprofile=rs.getString(4);
            drive_details=rs.getString(5);
            e_sslc=rs.getString(6);
            e_hsc=rs.getString(7);
            e_cgpa=rs.getString(8);
            e_ca=rs.getString(9);
            e_hoa=rs.getString(10);
            drive_date=rs.getString(11);
            location=rs.getString(12);
            website=rs.getString(13);
            campus=rs.getString(14);
            dept=rs.getString(15);
    }
%>
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company Id</label>
<div class='col-sm-10'>
<input type='text' name='cid' class='form-control' readonly  value='<%=cid%>' required='required' autocomplete='off'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company Name</label>
<div class='col-sm-10'>
<input type='text' name='name' class='form-control' id='name' value='<%=name%>' readonly required='required' autocomplete='off'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>drive details</label>
<div class='col-sm-10'>
<textarea name='drive_details' class='form-control' required='required' rows='10' readonly><%=drive_details%></textarea>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Eligibility Criteria</label>
<div class='col-sm-10'>
<table border='1'><tr><td>SSLC</td><td><select name='e_sslc' class='form-control' placeholder='' readonly required='required'>
<%

if(e_sslc=="0"){%>
    <option value='0' selected>No Criteria
        <%}
else{%>
    <option value='<%=e_sslc%>' selected><%=e_sslc%>
    <%="above"%>
    <%}%>
</select>
</td></tr>
<tr><td>HSC</td><td><select name='e_hsc' class='form-control' placeholder='' readonly required='required'>
<%
if(e_hsc=="0"){%>
    <option value='0' selected>No Criteria
        <%}
else{%>
    <option value='<%=e_hsc%>' selected><%=e_hsc%>
    <%="above"%>
    <%}%>
</select>
</td></tr>
<tr><td>CGPA</td><td><select name='e_cgpa' class='form-control' placeholder='' readonly required='required'>
<%
if(e_cgpa=="0"){%>
    <option value='0' selected>No Criteria
        <%}
else{%>
    <option value='<%=e_cgpa%>' selected><%=e_cgpa%>
    <%="above"%>
    <%}%>
</select>
</td></tr>
<tr><td>Current Arrears</td><td><input type='text' name='e_ca' class='form-control' value='<%=e_ca%>' readonly required='required'>
</td></tr>
<tr><td>History of Arrears</td><td><input type='text' name='e_hoa' class='form-control' value='<%=e_hoa%>' readonly required='required'>
</td></tr>
<tr><td>dept</td><td><select name='dept' class='form-control' placeholder='' readonly required='required'>
<%
if(dept=="0"){%>
    <option value='0' selected>No Criteria
        <%}
else{%>
    <option value='<%=dept%>' selected><%=dept%>
    <%}%>
</select>
</td></tr>


</table>

</div>
</div>

<div class='form-group'>
<label for='date' class='col-sm-2 control-label'>Drive Date</label>
<div class='col-sm-10'>
<input type='date' name='drive_date' readonly value='<%=drive_date%>' required='required'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Drive Location</label>
<div class='col-sm-10'>
<input type='text' name='location' readonly class='form-control' required='required' value='<%=location%>'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company website</label>
<div class='col-sm-10'>
<a href='<%=website%>' target='_blank'><%=website%><font color='blue'></font></a>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Campus</label>
<div class='col-sm-10'>
<select name='campus' class='form-control' readonly>
<%
if(campus=="on campus"){%>
    <option value='<%=campus%>' selected><%=campus%>
        <%}
else{%>
    <option value='off campus' selected>off campus
    <%}%>
</select>
</div>
</div>

<!--<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Upload Resume</label>
<div class='col-sm-10'>
<input type='file' name='resume' required>
</div>
</div>-->

<div class='form-group'>
<div class='col-sm-offset-2 col-sm-10'>
<input type='submit' name='submit' class='btn btn-primary' value='Next' formaction='drive.jsp?regno1=<%=regno%>&cid1=<%=cid%>'>
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
    