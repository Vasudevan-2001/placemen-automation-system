

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>leftbar</title>
    </head>
    <body>
        <div class='left-sidebar bg-black-300 box-shadow '>
<div class='sidebar-content'>
<div class='user-info closed'>
<img src='apple-touch-icon.png' alt='Admin' class='img-circle profile-img'>
<h6 class='title'>Admin</h6>
<small class='info'>Faculty</small>
</div>
<!-- /.user-info -->

<div class='sidebar-nav'>
<ul class='side-nav color-gray'>
<li class='nav-header'>
<span class=''>Main Category</span>
</li>
<li>
<a href='dashboard.jsp'><i class='fa fa-dashboard'></i> <span>Dashboard</span> </a>

</li>

<li class='nav-header'>
<span class=''>Appearance</span>
</li>
<li class='has-children'>
<a href='#'><i class='fa fa-file-text'></i> <span>Students</span> <i class='fa fa-angle-right arrow'></i></a>
<ul class='child-nav'>
<li><a href='search_students.jsp'><i class='fa fa-bars'></i> <span>Student Details</span></a></li>
</ul>
</li>
<li class='has-children'>
<a href='#'><i class='fa fa-file-text'></i> <span>Drives</span> <i class='fa fa-angle-right arrow'></i></a>
<ul class='child-nav'>
<li><a href='add-company.jsp'><i class='fa fa-bars'></i> <span>Add Company</span></a></li>
<li><a href='companydetails.jsp'><i class='fa fa fa-server'></i> <span>Manage Company</span></a></li>
<li><a href='search_appliedstudents.jsp'><i class='fa fa fa-server'></i> <span>Manage Applied Students </span></a></li>
</ul>
</li>
<li class='has-children'>
<a href='#'><i class='fa fa-users'></i> <span>Alumni</span> <i class='fa fa-angle-right arrow'></i></a>
<ul class='child-nav'>
<li><a href='add-alumni.jsp'><i class='fa fa-bars'></i> <span>Add Alumni Students</span></a></li>
<li><a href='search_alumnidetails.jsp'><i class='fa fa fa-server'></i> <span>Manage Alumni</span></a></li>

</ul>
</li>
</li>
<li class='has-children'>
<a href='#'><i class='fa fa-file-text'></i> <span>Report</span> <i class='fa fa-angle-right arrow'></i></a>
<ul class='child-nav'>
<li><a href='search_summary.jsp'><i class='fa fa fa-server'></i> <span>Drive Summary</span></a></li>
<li><a href='search_summary1.jsp'><i class='fa fa fa-server'></i> <span>Placed Students</span></a></li>

</ul>

</li>

<li class='has-children'>
<a href='#'><i class='fa fa-file-text'></i> <span>Notification</span> <i class='fa fa-angle-right arrow'></i></a>
<ul class='child-nav'>
<li><a href='notify.jsp'><i class='fa fa fa-server'></i> <span>Add notifications</span></a></li>
<li><a href='view_notify.jsp'><i class='fa fa fa-server'></i> <span>Manage notifications</span></a></li>

</ul>

</li>
</div>
<!-- /.sidebar-nav -->
</div>
<!-- /.sidebar-content -->
</div>
    </body>
</html>
