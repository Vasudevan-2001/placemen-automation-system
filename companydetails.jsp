<%@page import ="java.sql.*" %>
<%!
String msg,error,select,cid,name,drive_date,sessemail,sesstype,mobile,email,campus;
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
<title>Admin Manage company </title>
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
<!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
<div class='content-wrapper'>
<div class='content-container'>

<%@include file='leftbar.jsp' %>

<div class='main-page'>
<div class='container-fluid'>
<div class='row page-title-div'>
<div class='col-md-6'>
<h2 class='title'>Manage company </h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard.jsp'><i class='fa fa-home'></i> Home</a></li>
<li> company</li>
<li class='active'>Manage company </li>
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
<h5>View company Info</h5>
</div>
</div>
<!--
if(msg!=None){ 
    <div class='alert alert-success left-icon-alert' role='alert'>
    <strong>Well done!</strong>
    </div>
    
elif(error!=None){
    <div class='alert alert-danger left-icon-alert' role='alert'>
    <strong>Oh snap!</strong>
    </div>-->

<div class='panel-body p-20'>

<table id='example' class='display table table-striped table-bordered' cellspacing='0' width='100%'>
<thead>
<tr>
<th>#</th>
<th>company Id</th>
<th>company Name</th>
<th>Drive Date</th>
<th>Campus</th>
<th>Action</th>
<th>Alter</th>
</tr>
</thead>
<tbody>
    
 <%
    int cnt=1;
    select="select * from tbl_company";
    rs=stmt.executeQuery(select);
    while(rs.next()){
//    if(rs.next()){
         
                       
                       cid=rs.getString(2);
                       name=rs.getString(3);
                       drive_date=rs.getString(11); 
                       campus=rs.getString(14);%>
            <tr>
            <td><%=cnt%></td>
        
            <td> <%=cid%></td>
        
            <td><%=name%></td>
            
            <td> <%=drive_date%></td>
            <td>
                <%if(campus.equals("on campus")){ %>
                <b><font color='darkgreen'>
                <% } %>
                </b></font>
                <%=campus%>
            </td>
            
        
        <!--<td><%=email%></td>-->
       
        <td class='dropdown'>
        <ul id='contextMenu' class='dropdown-menu' role='menu'>
        <li><a tabindex='-1' href='edit-company.jsp' >View/Edit</a></li>
        </ul>
        <a class='btn btn-default actionButton' data-toggle='dropdown' href='#'> Action </a></td>
        <td class='dropdown'>
        <a href='edit-company.jsp?cid1=<%=cid%>'>
        <i  title='edit record'><b><font color='green'>Edit</font></b></i> </a><br> 
        <a href='delete-company.jsp?cid1=<%=cid%>'>
        <i  title='Delete Record'><b><font color='red'>Delete</font></b></i> </a> 
        </td>
        </tr>
        <%cnt=cnt+1;%>
        

</tbody>
                       
                      
                       
                       
<% }

%>
     
     
      
</table>


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

<% }
else
{
%>
            <script>alert('session destroyed');location.href='home.jsp';</script>
<%}

%>
 
 
