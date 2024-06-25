<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.util.Date" %>
<%@page import ="java.text.SimpleDateFormat" %>


<%!
    
    String sessemail,sesstype,select,cid,hypen="-";
    String regno,student_name,yop,dept,resume,id,cname,drive_date,application_status,drive_status,campus_status,app_status,cid1;
    Connection con;
    Statement stmt;
    ResultSet rs;
    int current_year,cnt=0;

    %>
    
 <%
  sesstype=session.getAttribute("sesstype").toString();
  sessemail=session.getAttribute("sessmail").toString();  
  if(!sessemail.equals(""))
  {  
     Class.forName("com.mysql.jdbc.Driver");
     con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
     stmt=con.createStatement();
     cid=request.getParameter("cid");
//     out.print(cid);
     yop=request.getParameter("yop");
     dept=request.getParameter("dept");
//     out.print(yop);
//     out.print(dept);
     
  %>
  
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Admin Drive Summary </title>
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
<h2 class='title'>Drive Summary </h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard.jsp'><i class='fa fa-home'></i> Home</a></li>
<li> Applied students</li>
<li class='active'>Drive Summary </li>
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
<h5>View Applied students Info</h5>
</div>
</div>
<!--if(msg!=None):
    print "<div class='alert alert-success left-icon-alert' role='alert'>"
    print "<strong>Well done!</strong>%s"%(msg)
    print "</div>"
elif(error!=None):
    print "<div class='alert alert-danger left-icon-alert' role='alert'>"
    print "<strong>Oh snap!</strong>%s"%(error)
    print "</div>"-->
<div class='panel-body p-20'>
    <%
    
     SimpleDateFormat sdf=new SimpleDateFormat("yyyy"); /*yyyy-MM-dd HH:mm:ss */
     current_year=Integer.parseInt(sdf.format(new Date()));
    
    %>

<table id='example' class='display table table-striped table-bordered' cellspacing='0' width='100%' >
<thead>
<tr>
<th>#</th>
<th>Student Regno</th>
<th>Student Name</th>
<th>Year of passing</th>
<th>Department</th>
<th>Company Name</th>
<th>Drive Date</th>
<th>Application Status</th>
<th>Drive Status</th>
<th>Campus Status</th>
</tr>
</thead>
<tbody>
<%
select="select regno,student_name,yop,dept,resume,id,cname,drive_date,application_status,drive_status,campus_status from tbl_drive where drive_date>=curdate() and dept='"+dept+"' and yop='"+yop+"' and id='"+cid+"'";
rs=stmt.executeQuery(select);
while(rs.next()){
        regno=rs.getString(1);
        student_name=rs.getString(2);
        yop=rs.getString(3);
        dept=rs.getString(4);
        resume=rs.getString(5);
        cid=rs.getString(6);
        cname=rs.getString(7);
        drive_date=rs.getString(8);
        app_status=rs.getString(9);
        drive_status=rs.getString(10);
        campus_status=rs.getString(11);
%>
        <tr>
        <td>
         
        <%=cnt%>
        
        </td>
        <td>
        <%=regno%>
        </td>
        <td>
        <%=student_name%>
        </td>
        <td>
        <%= yop%>
        </td>
        <td>
        <%=dept%>
        </td>
        <td>
        <%=cname%>
        </td>
        <td>
        <%=drive_date%>
        </td>
        <td>
        <%=app_status%>
        </td>
        <%
        if(app_status.equals("ACCEPTED")){
            if(drive_status.equals("null"))
            {%>
            <td>
                <a href='drive_summary_update.jsp?regno1=<%=regno%>&dept1=<%=dept%>&cid1=<%=cid%>&yop1=<%=yop%>&drive_stat=ATTENDED'><font color='green'><b><u>Attended</u></b></font></a>
                <br>
                <a href='drive_summary_update.jsp?regno1=<%=regno%>&dept1=<%=dept%>&cid1=<%=cid%>&yop1=<%=yop%>&drive_stat=NOT ATTENDED'><font color='green'><b><u>Not_Attended</u></b></font></a>
            </td>
            <%}
            else{%>
            <td>
                <font color="Blue"><b><%=drive_status%></b></font>
            </td>
              
            <%}
            if(drive_status.equals("ATTENDED"))
            {
                if(campus_status.equals("null")){%>
                    <td>
                    <a href='drive_summary_update1.jsp?regno1=<%=regno%>&dept1=<%=dept%>&cid1=<%=cid%>&yop1=<%=yop%>&campus_stat=PLACED'><font color='green'><b><u>Placed</u></b></font></a>
                    <br>
                    <a href='drive_summary_update1.jsp?regno1=<%=regno%>&dept1=<%=dept%>&cid1=<%=cid%>&yop1=<%=yop%>&campus_stat=NOT PLACED'><font color='red'><b><u>Not placed</u></b></font></a>
                    </td>
                <%}
                else{%>
                <td>
                    <font color="green"><b><%=campus_status%></b></font>
                </td>
                <%}
            }
        else{%>
            <td>
            <%="-"%>
            </td>
            <%}
        }
    else{%>
            <td rowspan='2'>
            <%="-"%>
            </td>
            </tr>
    <%}
  
cnt=cnt+1;

}%>
        
        
</tbody>
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
  
  
