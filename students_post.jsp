<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.time.LocalDate"%>;

<%!
    
    String sessemail,sessregno,nid,date,notification,select,question,answer,regno,email;
    Connection con;
    Statement stmt;
    ResultSet rs;

    %>
    
 <%
  sessregno=session.getAttribute("sessregno").toString();
  sessemail=session.getAttribute("sessemail").toString();
  if(!sessemail.equals(""))
  {  
     Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms","root","vasudevan6385742738@");
        stmt=con.createStatement();
        %>
     <html lang='en'>
    <head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>Student Dashboard</title>
    <link rel='stylesheet' href='css/bootstrap.min.css' media='screen' >
    <link rel='stylesheet' href='css/font-awesome.min.css' media='screen' >
    <link rel='stylesheet' href='css/animate-css/animate.min.css' media='screen' >
    <link rel='stylesheet' href='css/lobipanel/lobipanel.min.css' media='screen' >
    <link rel='stylesheet' href='css/toastr/toastr.min.css' media='screen' >
    <link rel='stylesheet' href='css/icheck/skins/line/blue.css' >
    <link rel='stylesheet' href='css/icheck/skins/line/red.css' >
    <link rel='stylesheet' href='css/icheck/skins/line/green.css' >
    <link rel='stylesheet' href='css/main.css' media='screen' >
    <script src='js/modernizr/modernizr.min.js'></script>
    </head>
    <body class='top-navbar-fixed'>
    <div class='main-wrapper'
         <%@include file="topbar.jsp"%>
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
    <a href='dashboard1.jsp'><i class='fa fa-dashboard'></i> <span>Dashboard</span> </a>

    </li>

    <li class='nav-header'>
    <span class=''>Appearance</span>
    </li><li class='has-children'>
    <a href='#'><i class='fa fa-info-circle'></i> <span>Profile</span> <i class='fa fa-angle-right arrow'></i></a>
    <ul class='child-nav'>
    <li><a href='viewprofile.jsp'><i class='fa fa fa-server'></i> <span>Manage Profile</span></a></li>
    </ul></li>

    <li class='has-children'>
    <a href='#'><i class='fa fa-info-circle'></i> <span>Drives</span> <i class='fa fa-angle-right arrow'></i></a>
    <ul class='child-nav'>
    <li><a href='viewcompany.jsp'><i class='fa fa fa-server'></i> <span>View Companies</span></a></li>
    </ul>
    </li><li class='has-children'>
    <a href='#'><i class='fa fa-info-circle'></i> <span>Alumni</span> <i class='fa fa-angle-right arrow'></i></a>
    <ul class='child-nav'>
    <li><a href='viewalumni.jsp'><i class='fa fa fa-server'></i> <span>View Alumni students</span></a></li>
    </ul>
    <li><a href='change-password.jsp'><i class='fa fa fa-server'></i> <span> Student Change Password</span></a></li>
    </li></div>
    <!-- /.sidebar-nav -->
    </div>
    <!-- /.sidebar-content -->
    </div>
    <div class='main-page'>
<div class='container-fluid'>
<div class='row page-title-div'>
<div class='col-md-6'>
<h2 class='title'>Discussion Forum</h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard1.jsp'><i class='fa fa-home'></i> Home</a></li>
<li>Disscussion Forum</li>
<li class='active'>Posts</li>
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
<h5>Ask A Question</h5>
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
<form method=post action='students_post_action.jsp'>
<p><strong>Your E-Mail Address:</strong><br>
<input type='text' name='email' size=40 maxlength=150>
<p><strong>Topic Title:</strong><br>
<input type='text' name='topic_title' size=40 maxlength=150>
<P><strong>Write a Question:</strong><br>
<center><textarea name='question' rows=2 cols=150 wrap=virtual></textarea></center>
<P><center><input type='submit' name='submit' value='send'></p></center>
</form>
<table id='example' class='display table table-striped table-bordered' cellspacing='0' width='100%'>
<thead>
<tr>
<th>#</th>
<th>Question</th>
<th>Answer</th>
</tr>
</thead>
<tbody>
    <%int cnt=0;
select="select question,answer from tbl_forum where answer!='None'";
rs=stmt.executeQuery(select);
while(rs.next()){
        cnt=cnt+1;
        question=rs.getString(1);
        answer=rs.getString(2);%>
        <tr><td>
         <%=cnt%>
                </td><td>
                 <%=question%>   
            </td>
                <td>
                    <%=answer%>
            </td>
            
            
        <%}%>
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
    <script src='js/jquery-ui/jquery-ui.min.js'></script>
    <script src='js/bootstrap/bootstrap.min.js'></script>
    <script src='js/pace/pace.min.js'></script>
    <script src='js/lobipanel/lobipanel.min.js'></script>
    <script src='js/iscroll/iscroll.js'></script>

    <!-- ========== PAGE JS FILES ========== -->
    <script src='js/prism/prism.js'></script>
    <script src='js/waypoint/waypoints.min.js'></script>
    <script src='js/counterUp/jquery.counterup.min.js'></script>
    <script src='js/amcharts/amcharts.js'></script>
    <script src='js/amcharts/serial.js'></script>
    <script src='js/amcharts/plugins/export/export.min.js'></script>
    <link rel='stylesheet' href='js/amcharts/plugins/export/export.css' type='text/css' media='all' />
    <script src='js/amcharts/themes/light.js'></script>
    <script src='js/toastr/toastr.min.js'></script>
    <script src='js/icheck/icheck.min.js'></script>

    <!-- ========== THEME JS ========== -->
    <script src='js/main.js'></script>
    <script src='js/production-chart.js'></script>
    <script src='js/traffic-chart.js'></script>
    <script src='js/task-list.js'></script>
    <script>
    $(function(){

    // Counter for dashboard stats
    $('.counter').counterUp({
    delay: 10,
    time: 1000
    });

    // Welcome notification
    toastr.options = {
    'closeButton': true,
    'debug': false,
    'newestOnTop': false,
    'progressBar': false,
    'positionClass': 'toast-top-right',
    'preventDuplicates': false,
    'onclick': null,
    'showDuration': '300',
    'hideDuration': '1000',
    'timeOut': '5000',
    'extendedTimeOut': '1000',
    'showEasing': 'swing',
    'hideEasing': 'linear',
    'showMethod': 'fadeIn',
    'hideMethod': 'fadeOut'
    }
    toastr['success']( 'Welcome to PMS!');

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
<%}
%>
