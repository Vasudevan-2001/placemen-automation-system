<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%!
String cname,msg,error,select,cid,drive_date,sessemail,sesstype,mobile,email,campus,name,cprofile,drive_details,e_sslc,e_hsc,e_cgpa,e_ca,e_hoa,location,website;
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
//    cname=request.getParameter("cname");

 %>
 <!DOCTYPE html>
<html lang='en'>
<head>
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
<h2 class='title'>Company details</h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard.jsp'><i class='fa fa-home'></i> Home</a></li>
<li class='active'>Drives</li>
<li class='active'>Manage Company</li>
<li class='active'>Edit</li>
<li class='active'>Company Profile</li>
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
    print "<div class='alert alert-success left-icon-alert' role='alert'>
    print "<strong>Well done!</strong>%s"%(msg)
    print "</div>"
elif(error!=None):
    print "<div class='alert alert-danger left-icon-alert' role='alert'>
    print "<strong>Oh snap!</strong>%s"%(error)
    print "</div>-->
<form class='form-horizontal' method='post' name='edit' action='company_update.jsp' >
<%
    
select="select * from tbl_company where cmpid='"+cid+"'";
rs=stmt.executeQuery(select);
if(rs.next()){        
            name=rs.getString(3);
            cprofile=rs.getString(4);
            drive_details=rs.getString(5);
            e_sslc=rs.getString(6);
//            out.print(e_sslc);
            if(e_sslc.equals("0")){
                e_sslc="No Criteria";
            }
            e_hsc=rs.getString(7);
            if(e_hsc.equals("0")){
                e_hsc="No Criteria";
            }
            e_cgpa=rs.getString(8);
            if(e_cgpa.equals("0")){
                e_cgpa="No Criteria";
            }
            e_ca=rs.getString(9);
            e_hoa=rs.getString(10);
            drive_date=rs.getString(11);
            location=rs.getString(12);
            website=rs.getString(13);
            campus=rs.getString(14);
    }
    
%>
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company Id</label>
<div class='col-sm-10'>
<input type='text' name='cid' class='form-control' readonly id='regNo' value='<%=cid%>' required='required' autocomplete='off'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company Name</label>
<div class='col-sm-10'>
<input type='text' name='name' class='form-control' id='name' value='<%=name%>' readonly required='required' autocomplete='off'>
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
<!--<label for='default' class='col-sm-2 control-label'> Eligibility Criteria</label>-->
<div class='col-sm-10'>
<table border='1'>
<tr>
    <td>SSLC</td>
<td>
<select name='e_sslc' class='form-control' placeholder='' required='required'>
    <%if(e_sslc=="0"){%>
    <option value='0' selected>No criteria
        <%}
    else{%>
    <option value='<%=e_sslc%>' selected>
    <%=e_sslc%>
        <%}%>
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
             <%if(e_hsc=="0"){%>
    <option value='0' selected>No criteria
        <%}
    else{%>
    <option value='<%=e_hsc%>' selected>
    <%=e_hsc%>
        <%}%>
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
            
 <%if(e_cgpa=="0"){%>
    <option value='0' selected>No criteria
        <%}
    else{%>
    <option value='<%=e_cgpa%>' selected>
    <%=e_cgpa%>
        <%}%>
<option value='6'> > 6.0 
<option value='7'> > 7.0 
<option value='8'> > 8.0 
<option value='9'> > 9.0 
</select>
</td></tr>

<tr><td>Current Arrears<td><select name='e_ca' class='form-control' placeholder='' required='required'>
    <option value='<%=e_ca%>'><%=e_ca%>
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
<option value='<%=e_hoa%>'><%=e_hoa%>
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
    <input type='text' name='location' class='form-control' required='required' value='<%=location%>' placeholder="Ex: Chennai">
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company website</label>
<div class='col-sm-10'>
<input type='text' name='website' class='form-control' required='required' value='<%=website%>'placeholder="www.tcs.com">
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
 
 
