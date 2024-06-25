<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.util.Date" %>
<%@page import ="java.text.SimpleDateFormat" %>

<%!
    
    String dept,cid,regno,msg,error,update,application_status,select,name,doj,sslc,hsc,cgpa,c_arrear,h_arrear,yop,cname,drive_date;
    int current_year,cnt=1,res;
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
    regno=request.getParameter("regno1");
    cid=request.getParameter("cid1");
    msg=request.getParameter("msg");
    error=request.getParameter("error");
    %>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>PMS| Edit Student </title>
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
<h2 class='title'>Academic Marks</h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard1.py'><i class='fa fa-home'></i> Home</a></li>

<li class='active'>Academic Marks</li>
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
<h5>Academic Student info</h5>
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
<form class='form-horizontal' method='post'>
<%    
select="select regno,student_name,dept,doj,sslc,hsc,cgpa,current_arrear,history_arrear,yop,cname,drive_date from tbl_drive where regno='"+regno+"' and id='"+cid+"'";
rs=stmt.executeQuery(select);
if(rs.next())
{
regno=rs.getString(1);
name=rs.getString(2);
dept=rs.getString(3);
doj=rs.getString(4);
sslc=rs.getString(5);
hsc=rs.getString(6);
cgpa=rs.getString(7);
c_arrear=rs.getString(8);
h_arrear=rs.getString(9);
yop=rs.getString(10);
cname=rs.getString(11);
drive_date=rs.getString(12);
}
%>
<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Register Number</label>
<div class='col-sm-10'>
<input type='text' name='regno' class='form-control' readonly id='regno' value='<%=regno%>' required='required' autocomplete='off'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Student Name</label>
<div class='col-sm-10'>
<input type='text' name='name' class='form-control' id='name' value='<%=name%>' readonly required='required' autocomplete='off'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Year Of Passing</label>
<div class='col-sm-10'>
<input type='text' name='yop' class='form-control' value='<%=yop%>' readonly>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Company Name</label>
<div class='col-sm-10'>
<input type='text' name='cname' class='form-control' value='<%=cname%>' required='required' readonly autocomplete='off'>
</div>
</div>

<div class='form-group'>
<label for='date' class='col-sm-2 control-label'>Department</label>
<div class='col-sm-10'>
<input type='text' name='dept' value='<%=dept%>' required='required' readonly>
</div>
</div>


<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>SSLC</label>
<div class='col-sm-10'>
<input type='text' name='sslc' class='form-control'  readonly value='<%=sslc%>'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>HSC</label>
<div class='col-sm-10'>
<input type='text' name='hsc' class='form-control' readonly value='<%=hsc%>' required='required' autocomplete='off'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>CGPA</label>
<div class='col-sm-10'>
<input type='text' name='cgpa' class='form-control' value='<%=cgpa%>' readonly required='required' autocomplete='off'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>Current Arrears</label>
<div class='col-sm-10'>
<input type='text' name='c_arrear' class='form-control' value='<%=c_arrear%>' readonly required='required' autocomplete='off'>
</div>
</div>

<div class='form-group'>
<label for='default' class='col-sm-2 control-label'>History Of Arrears</label>
<div class='col-sm-10'>
<input type='text' name='h_arrear'  class='form-control' value='<%=h_arrear%>' readonly required='required' autocomplete='off'>
</div>
</div>


<div class='form-group'>
<div class='col-sm-offset-2 col-sm-10'>
<input type='submit' name='back' class='btn btn-primary' value='back' formaction='applied-students.jsp?regno1=<%=regno%>&cid1=<%=cid%>'>
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
    
    
    
    
    <%  }
else
{
%>
            <script>alert('session destroyed');location.href='home.jsp';</script>
<%}

%>

    


