<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.util.Date" %>
<%@page import ="java.text.SimpleDateFormat" %>


<%!
    Connection con;
    ResultSet rs;
    Statement stmt;
    String sessemail,sesstype,yop,dept,regno,mobile,email,name,doj;
   
%>

<%
  sesstype=session.getAttribute("sesstype").toString();
  sessemail=session.getAttribute("sessmail").toString(); 
  if(!sessemail.equals(""))
  {
         
        Class.forName("com.mysql.cj.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
        stmt=con.createStatement(); 
        dept=request.getParameter("dept");
        yop=request.getParameter("yop");

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

            <body class='top-navbar-fixed'>
            <div class='main-wrapper'>

            <!-- ========== TOP NAVBAR ========== -->
        
            <%@include file="topbar.jsp" %>
            <!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
            <div class='content-wrapper'>
            <div class='content-container'>

            <%@include file="leftbar.jsp" %>

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

            <li class='active'>Search Student Details</li>
            </ul>
            </div>

            </div>
            <!-- /.row -->
            </div><br>
            <table id='example' class='display table table-striped table-bordered' cellspacing='0' width='100%'>
            <thead>
            <tr>
            <th>#</th>
            <th>Regno</th>
            <th>Name</th>
            <th>Date of Joining</th>
            <th>Mobile</th>
            <th>E-mail</th>
            <th>Department</th>
            <th>Year of Passing</th>
            </tr>
            </thead>
            <tbody>
                <%
                    int cnt=0;
                     String search="select regno,name,doj,mobile,email,dept,yop from tbl_student where yop='"+yop+"' and dept='"+dept+"'";
                     rs=stmt.executeQuery(search);
                     while(rs.next()){
                            cnt=cnt+1;
                            regno=rs.getString(1);
                            name=rs.getString(2);
                            doj=rs.getString(3);
                            mobile=rs.getString(4);
                            email=rs.getString(5);
                            dept=rs.getString(6);
                            yop=rs.getString(7);
                            
                    
                    
                %>
                <tr>
                    <td><%=cnt%></td>
                    <td><%=regno%></td>
                    <td><%=name%></td>
                    <td><%=doj%></td>
                    <td><%=mobile%></td>
                    <td><%=email%></td>
                    <td><%=dept%></td>
                    <td><%=yop%></td>
                </tr>
                
                
                <%}%>
                
            </tbody>
            </table>
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