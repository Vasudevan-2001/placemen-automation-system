<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.time.*" %>



<%!
    Connection con;
    ResultSet rs;
    Statement stmt;
    String regno,name,password,dept,dob,gender,mobile,email,doj,sslc,hsc,cgpa,c_arrear,h_arrear,syop,update,msg,error,confirm_password;
    String current_arrear,history_of_arrear,sessregno,sessemail;
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
       // int current_year=localate.getYear();
  
    %>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>view profile </title>
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
    <a href='dashboard1.jsp'> <i class='fa fa-dashboard'></i> <span>Dashboard</span> </a>

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
<li><a href='change-password.jsp'> <span> Change password</span></a></li>
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
<h2 class='title'>Student Profile</h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard1.jsp'><i class='fa fa-home'></i> Home</a></li>

<li class='active'>Student Profile</li>
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
<h4><b>Fill the Student info</b></h4>
</div>
</div>

   


<form class='form-horizontal' method='post' action="updateProfile.jsp">
    
    <% 
        String select="select * from tbl_student where regno='"+sessregno+"'";
    rs=stmt.executeQuery(select);
    if(rs.next()){
         
            regno=rs.getString(1);
            name=rs.getString(2);
            password=rs.getString(3);
            dob=rs.getString(5);
            gender=rs.getString(6);
            mobile=rs.getString(7);
            email=rs.getString(8);
            doj=rs.getString(9);
            dept=rs.getString(10);
            
            
            
            sslc=rs.getString(11);
    
            hsc=rs.getString(12);
            cgpa=rs.getString(13);
            c_arrear=rs.getString(14);
            h_arrear=rs.getString(15);
            yop=rs.getInt(16);

        }
         
        
        
     %>
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Register Number</label>
<div class='col-sm-10'>
<input type='text' name='regno' class='form-control' readonly id='regno' value='<%=regno%>' required='required' autocomplete='off'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Full Name</label>
<div class='col-sm-10'>
<input type='text' name='name' class='form-control' id='name' value='<%=name%>' required='required' autocomplete='off'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Current Password</label>
<div class='col-sm-10'>
<input type='text' name='password' class='form-control' value='<%=password%>' required='required' autocomplete='off'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>dob</label>
<div class='col-sm-10'>
<input type='date' name='dob' class='form-control' id='dob' value='<%=dob%>' required='required' autocomplete='off'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Gender</label>
<div class='col-sm-10'>
<%
if(gender.equals("male"))
{ 
%>
 <input type='radio' name='gender' value='male' checked>male <input type='radio' name='gender' value='female' >female
<%
 }
else if(gender.equals("female"))
{
%>
<input type='radio' name='gender' value='male'  >male <input type='radio' name='gender' value='female'> female
 <%
     }
else
{ 
  %>
           <input type='radio' name='gender' value='male'  >male <input type='radio' name='gender' value='female' >female <input type='radio' name='gender' value='Other' required='required' checked>Other
 <%
     }
 %>
</div>
</div>

<div class='form-group'>
<label for='date' class='col-sm-2 control-label'>Date of Joining</label>
<div class='col-sm-10'>
<input type='date' name='doj' value='<%=doj%>' class='form-control' readonly required='required'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Department</label>
<div class='col-sm-10'>
<select name='dept' id='intcountry' class='form-control' style=width:200px; onChange='return mySelect();' required>
<option value='<%=dept%>' selected><%=dept%></option>
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
<label for='default' class='col-sm-2 control-label'>Mobile</label>
<div class='col-sm-10'>
<input type='text' name='mobile' class='form-control' id='mobile' value='<%=mobile%>'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Email id</label>
<div class='col-sm-10'>
<input type='email' name='emailid' class='form-control' id='email' value='<%=email%>' required='required' autocomplete='off'>
</div>
</div>
<%
if(yop==current_year){%>
           <div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>SSLC</label>
           <div class='col-sm-10'>
           <input type='number' name='sslc' min='0' max='100' step='0.01' readonly class='form-control' value='<%=sslc%>' required='required' autocomplete='off'>
           </div>
           </div>

           <div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>HSC</label>
           <div class='col-sm-10'>
           <input type='number' name='hsc' min='0' max='100' step='0.01' readonly class='form-control' value='<%=hsc%>' required='required' autocomplete='off'>
           </div>
           </div>

           <div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>CGPA</label>
           <div class='col-sm-10'>
           <input type='number' name='cgpa' min='0' max='10' step='0.01' readonly class='form-control' value='<%=cgpa%>' required='required' autocomplete='off'>
           </div>
           </div>

           <div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Current Arrears</label>
           <div class='col-sm-10'>
           <input type='number' name='c_arrear' min='0' max='100' readonly class='form-control' value='<%=c_arrear%>' required='required' autocomplete='off'>
           </div>
           </div>

           <div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>History Of Arrears</label>
           <div class='col-sm-10'>
           <input type='number' name='h_arrear' min='0' max='100' readonly class='form-control' value='<%=h_arrear%>' required='required' autocomplete='off'>
           </div>
           </div>

           <div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Year Of Passing</label>
           <div class='col-sm-10'>
           <input type='text' name='yop' class='form-control' value='<%=yop%>' readonly>
           </div>
           </div>
                                               


           <div class='form-group'>
           <div class='col-sm-offset-2 col-sm-10'>
           <input type='submit' name='update' class='btn btn-primary' value='update'>
           </div>
           </div>
           
         <%}
        else{ %>
           <div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>SSLC</label>
           <div class='col-sm-10'>
           <input type='number' name='sslc' min='0' max='100' step='0.01' class='form-control' value='<%=sslc%>' required='required' autocomplete='off'>
           </div>
           </div>

           <div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>HSC</label>
           <div class='col-sm-10'>
           <input type='number' name='hsc' min='0' max='100' step='0.01' class='form-control' value='<%=hsc%>' required='required' autocomplete='off'>
           </div>
           </div>

           <div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>CGPA</label>
           <div class='col-sm-10'>
           <input type='number' name='cgpa' min='0' max='10' step='0.01' class='form-control' value='<%=cgpa%>' required='required' autocomplete='off'>
           </div>
           </div>

           <div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Current Arrears</label>
           <div class='col-sm-10'>
           <input type='number' name='c_arrear' min='0' max='100' class='form-control' value='<%=c_arrear%>' required='required' autocomplete='off'>
           </div>
           </div>

           <div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>History Of Arrears</label>
           <div class='col-sm-10'>
           <input type='number' name='h_arrear' min='0' max='100' class='form-control' value='<%=h_arrear%>' required='required' autocomplete='off'>
           </div>
           </div>

           <div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Year Of Passing</label>
           <div class='col-sm-10'>
           <input type='text' name='yop' class='form-control' value='<%=yop%>' readonly>
           </div>
           </div>
                                               


           <div class='form-group'>
           <div class='col-sm-offset-2 col-sm-10'>
           <input type='submit' name='update' class='btn btn-primary' value='update'>
           </div>
           </div>
        <%}%>
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
    