<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.util.Date" %>
<%@page import ="java.text.SimpleDateFormat" %>


<%!
    Connection con;
    ResultSet rs;
    Statement stmt;
    String sessregno,sessemail,select_student,sname,doj,current_arrear,history_arrear,insert;
    String dept,sslc,hsc,cgpa,ca,hoa,select,location,website,regno,email,cid,cname,drive_status,campus_status;
    String campus,eligibility_status,status,application_status,select_company,drive_date,error; 
    String remoteurl,remotefilepath,localdirectorypath,fileName,resume1,yop,dept1,yop1,curdate,name,mobile;
    int yop,current_year,res,cnt;
    
  %>


<%
  sessregno=session.getAttribute("sessregno").toString();
  sessemail=session.getAttribute("sessemail").toString();  
if(!sessemail.equals(""))

  {
      cid=request.getParameter("cid1");
      regno=request.getParameter("regno1");
      Class.forName("com.mysql.cj.jdbc.Driver");
      con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
      
      dept=request.getParameter("dept");
      yop=request.getParameter("yop");
      dept1=request.getParameter("dept1");
      yop1=request.getParameter("yop1");

%>

<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Admin Manage students </title>
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
 <%@include file="topbar.jsp"%>
<!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
<div class='content-wrapper'>
<div class='content-container'>

 <%@include file="leftbar.jsp"%>

<div class='main-page'>
<div class='container-fluid'>
<div class='row page-title-div'>
<div class='col-md-6'>
<h2 class='title'>Manage students </h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard.jsp'><i class='fa fa-home'></i> Home</a></li>
<li> Students</li>
<li class='active'>Manage students </li>
</ul>
</div>

</div>
<!-- /.row -->
</div>
<!-- /.container-fluid -->

<section class='section'>
<div class='container-fluid'>



<div class='row'>
<div class='col-md-12'>

<div class='panel'>
<div class='panel-heading'>
<div class='panel-title'>
<h5>View Students Info</h5>
</div>
</div>

<div class='panel-body p-20'>

<table id='example' class='display table table-striped table-bordered' cellspacing='0' width='100%'>
<thead>
<tr>
<th>#</th>
<th>Student Regno</th>
<th>Student Name</th>
<th>Year of passing</th>
<th>Department</th>
<th>Mobile</th>
<th>Mail</th>
<th>Action</th>
</tr>
</thead>
<tbody>
<%
select="select date_format(curdate(),'%Y')";
rs=stmt.executeQuery(select);
if(rs.next()){
    curdate=rs.getString(1);
}

String select1="select * from tbl_student where yop>='"+curdate+"' and (dept='"+dept+"' or dept='"+dept1+"') and (yop='"+yop+"' or yop='"+yop1+"')";
cnt=1;
rs=stmt.executeQuery(select1);
if(rs.next()){
        regno=rs.getString(1);
        name=rs.getString(2);
        dept=rs.getString(3);
        yop=rs.getString(4);
        mobile=rs.getString(5);
        email=rs.getString(6);


%>
<ul id='contextMenu' class='dropdown-menu' role='menu'>
<li><a tabindex='-1' href='edit-student.jsp?regno1=<%=regno%>' class='editLink'>View/Edit</a></li>
<li><a tabindex=-1' href='delete-student.jsp?regno1=<%=regno%>' class='delLink'>Delete</a></li>
        </ul>
        <tr>
        <td>
        <%= cnt%>
        </td>
        <td>
        <%=regno%>
        </td>
        <td>
        <%=name%>
        </td>
        <td>
        <%=yop%>
        </td>
        <td>
        <%=dept%>
        </td>
        <td>
        <%=mobile%>
        </td>
        <td>
        <%=email%>
        </td>
        <td class='dropdown'>
        <a class='btn btn-default actionButton' data-toggle='dropdown' href='#'> Action </a>
        <a href='edit-student.jsp?regno1=<%=regno%>&dept1=<%=dept%>&yop1=<%=yop%>'>
        <i title='Edit Record'>View</i> </a><br>
        <a href='delete-student.jsp?regno1=<%=regno%>&dept1=<%=dept%>&yop1=<%=yop%>'>
        <i title='Delete Record'>Delete</i> </a><br> 
        </td>
        </tr>
        <%cnt=cnt+1;
        
}%>

</tbody>
</table>

<p align='center'><font color='red'><b><u>Click To Print all  Students List</u></b></font>&nbsp;
<a href='print1.jsp?dept1=<%=dept%>&yop1=<%=yop%>' target='_blank'><button name='print'><font color='darkgreen'><b>PRINT</b></font></button></a></p>



<!-- /.col-md-12 -->
</div>
</div>
</div>
<!-- /.col-md-6 -->


</div>
<!-- /.col-md-12 -->
</div>
</div>
<!-- /.panel -->
</div>
<!-- /.col-md-6 -->

</div>
<!-- /.row -->

</div>
<!-- /.container-fluid -->
</section>
<!-- /.section -->

</div>
<!-- /.main-page -->



</div>
<!-- /.content-container -->
</div>
<!-- /.content-wrapper -->

</div>
<!-- /.main-wrapper -->

<!-- ========== COMMON JS FILES ========== -->
<script src='js/jquery/jquery-2.2.4.min.js'></script>
<script src='js/bootstrap/bootstrap.min.js'></script>
<script src='js/pace/pace.min.js'></script>
<script src='js/lobipanel/lobipanel.min.js'></script>
<script src='js/iscroll/iscroll.js'></script>

<!-- ========== PAGE JS FILES ========== -->
<script src='js/prism/prism.js'></script>
<script src='js/DataTables/datatables.min.js'></script>

<!-- ========== THEME JS ========== -->
<script src='js/main.js'></script>
<script>
$(function($) {
$('#example').DataTable();

$('#example2').DataTable( {
'scrollY':        '300px',
'scrollCollapse': true,
'paging':         false
} );

$('#example3').DataTable();
});
</script>
</body>
</html>


<%
  }
else
{
%>
<script>alert('session destroyed');location.href='home.jsp';</script>
<% }
%>  
  