<%@page import ="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
   String sessemail,sessregno,dept,select,select1,regno;
   int count=0,count1=0;
   
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
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
        stmt=con.createStatement();
  %>
  
    <html lang='en'>
    <head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>PAS | Dashboard</title>
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
    <li><a href='change-password.jsp'><i class='fa fa fa-server'></i> <span> Change Password</span></a></li>
    </li></div>
    <!-- /.sidebar-nav -->
    </div>
    <!-- /.sidebar-content -->
    </div><div class='main-page'>
    <div class='container-fluid'>
    <div class='row page-title-div'>
    <div class='col-sm-6'>
    <h2 class='title'>Dashboard</h2>

    </div>
    <!-- /.col-sm-6 -->
    </div>
    <!-- /.row -->

    </div>
    <!-- /.container-fluid -->

    <section class='section'>
    <div class='container-fluid'>
    <div class='row'>
    <div class='col-lg-3 col-md-3 col-sm-6 col-xs-12'>
    <a class='dashboard-stat bg-primary' href=''>
        
    <%  String select="select count(regno) from tbl_student where yop>=date_format(curdate(),'%Y')";
    rs=stmt.executeQuery(select);
    if(rs.next())
        {  
        count=rs.getInt(1);
    }
            %>
  
   
               
    <span class='number counter'><%=count%></span>
    <span class='name'>Registered students</span>
    <span class='bg-icon'><i class='fa fa-users'></i></span>
    </a>
    <!-- /.dashboard-stat -->
    </div>
    <!-- /.col-lg-3 col-md-3 col-sm-6 col-xs-12 -->

    <div class='col-lg-3 col-md-3 col-sm-6 col-xs-12'>
    <a class='dashboard-stat bg-danger' href='viewcompany.jsp'>
     
        <%
    String select1="select count(id) from tbl_company where drive_date>=curdate()";
    rs=stmt.executeQuery(select1);
    if(rs.next())
    {     
    count1=rs.getInt(1);
    }%>
    <span class='number counter'><%=count1%></span>
    <span class='name'> Upcoming Drives</span>
    <span class='bg-icon'><i class='fa fa-ticket'></i></span>
    </a>
    <!-- /.dashboard-stat -->
    </div>
    <!-- /.col-lg-3 col-md-3 col-sm-6 col-xs-12 -->

    <div class='col-lg-3 col-md-3 col-sm-6 col-xs-12'>
    <a class='dashboard-stat bg-warning' href='placed_summary1.jsp'>
     <%
   int count2=0;
   
String select2="select distinct(count(regno)) from tbl_drive where campus_status='Placed'";
rs=stmt.executeQuery(select2);
if(rs.next())
{     count2=rs.getInt(1);

}%>
    <%
   int count3=0;
   
String select3="select distinct(count(id)) from tbl_alumni where status='Placed'";
rs=stmt.executeQuery(select3);
if(rs.next())
{     count3=rs.getInt(1);

}%>
    <span class='number counter'><%=count2+count3%></span>
    <span class='name'>Students Placed</span>
    <span class='bg-icon'><i class='fa fa-bank'></i></span>
    </a>
    <!-- /.dashboard-stat -->
    </div>
    <!-- /.col-lg-3 col-md-3 col-sm-6 col-xs-12 -->

    <div class='col-lg-3 col-md-3 col-sm-6 col-xs-12'>
    <a class='dashboard-stat bg-success' href='students_post.jsp'>

<%
    int count4=0;
    String select4="select count(distinct(qid)) from tbl_forum";
    rs=stmt.executeQuery(select4);
    if(rs.next())
    {     
    count4=rs.getInt(1);
}%>  
    <span class='number counter'><%=count4%></span>
    <span class='name'>Disscussion Forum</span>
    <span class='bg-icon'><i class='fa fa-file-text'></i></span>
    </a>
    <!-- /.dashboard-stat -->
    </div>
    <!-- /.col-lg-3 col-md-3 col-sm-6 col-xs-12 -->

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
    };
    toastr['success']( 'Welcome to PAS!');

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
