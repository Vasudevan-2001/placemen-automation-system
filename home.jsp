<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>Admin Login</title>
<link rel='stylesheet' href='css/bootstrap.min.css' media='screen' >
<link rel='stylesheet' href='css/font-awesome.min.css' media='screen' >
<link rel='stylesheet' href='css/animate-css/animate.min.css' media='screen' >
<link rel='stylesheet' href='css/prism/prism.css' media='screen' > <!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
<link rel='stylesheet' href='css/main.css' media='screen' >
<script src='js/modernizr/modernizr.min.js'></script>
<style>
    body{
        background-image: url("img/header.jpg");
    }
</style>
</head>
<body class=''>
<div class='main-wrapper'>

<div class=''>
<div class='row'>
<table><tr><td bgcolor='#CEECF5' width='70%'><font color='white' size='5'><a  href=''>
                <img src='img/log.png' width="50px" height="50px">
            </a><a class='' href='index.jsp'><span style='font-size:23px; color:rgb(204, 62, 30);'><b>PLACEMENT AUTOMATION SYSTEM</b></span>
</a></td><td bgcolor='#CEECF5' align='right'><a href='register.jsp'><b><font color='black'><b>REGISTER</b></a></td>
<td bgcolor='#CEECF5' align='center'><a href='home.jsp'><b><font color='black'><i class='fa fa-sign-in'></i>SIGN IN</a></tr></table>
<div class='col-lg-6 visible-lg-block'>

<section class='section'>
<div class='row mt-40'>
<div class='col-md-10 col-md-offset-1 pt-50'>

<div class='row mt-30 '>
<div class='col-md-11'>
<div class='panel'>
<div class='panel-heading'>
<div class='panel-title text-center'>
<h4>For Students</h4>
</div>
</div>
<div class='panel-body p-20'>



<form class='form-horizontal' method='post' action='loginaction1.jsp' >
<div class='form-group'>
<label  class='col-sm-2 control-label'>Regno</label>
<div class='col-sm-10'>
<input type='text' name='regno' class='form-control' placeholder='Regno' required='required'>
</div>
</div>
<div class='form-group'>
<label  class='col-sm-2 control-label'>Mail Id</label>
<div class='col-sm-10'>
<input type='email' name='email' class='form-control' placeholder='emailid' required='required'>
</div>
</div>
<div class='form-group'>
<label for='' class='col-sm-2 control-label'>Password</label>
<div class='col-sm-10'>
    <input type='password' name='password' class='form-control' id='inputEmail3' placeholder='Password'  required='required'>
</div>
</div>


<div class='form-group mt-20'>
<div class='col-sm-offset-2 col-sm-10'>

    <button type='submit' name='login' class='btn btn-success btn-labeled pull-right'>Sign in<span class='btn-label btn-label-right'><i class='fa fa-check'></i></span></button>
</div>
</div>

</form>




</div>
</div>
<!-- /.panel -->

</div>
<!-- /.col-md-11 -->
</div>
<!-- /.row -->
</div>
<!-- /.col-md-12 -->
</div>
<!-- /.row -->
</section>
</div>
<div class='col-lg-6'>
<section class='section'>
<div class='row mt-40'>
<div class='col-md-10 col-md-offset-1 pt-50'>

<div class='row mt-30 '>
<div class='col-md-11'>
<div class='panel'>
<div class='panel-heading'>
<div class='panel-title text-center'>
<h4>Admin Login</h4>
</div>
</div>
<div class='panel-body p-20'>


<form class='form-horizontal'  action='loginaction.jsp' method='post'>
<div class='form-group'>
<label for='inputtype3' class='col-sm-2 control-label'>ADMIN</label>
<div class='col-sm-10'>
    <select name='usertype' class='form-control' id='inputtype3'  required='required'>
    <option value='HOD or PRINCIPAL'>PRINCIPAL/HOD
    <option value='placement_officer'>Placement Officer
    <option value='placement_coordinator'>Placement Coordinator</select>
</div>
</div>
<div class='form-group'>
<label for='inputEmail3' class='col-sm-2 control-label'>Email</label>
<div class='col-sm-10'>
    <input type='email' name='username' class='form-control' id='inputEmail3' placeholder='UserName' pattern='^(([-\w\d]+)(\.[-\w\d]+)*@([-\w\d]+)(\.[-\w\d]+)*(\.([a-zA-Z]{2,5}|[\d]{1,3})){1,2})$' required='required'>
</div>
</div>
<div class='form-group'>
<label for='inputPassword3' class='col-sm-2 control-label'>Password</label>
<div class='col-sm-10'>
    <input type='password' name='password' class='form-control' id='inputPassword3' placeholder='Password'>
</div>
</div>

<div class='form-group mt-20'>
<div class='col-sm-offset-2 col-sm-10'>

    <button type='submit' name='login' class='btn btn-success btn-labeled pull-right'>Sign in<span class='btn-label btn-label-right'><i class='fa fa-check'></i></span></button>
</div>
</div>
</form>




</div>
</div>
<!-- /.panel -->
<p class='text-muted text-center'><small>Copyright  @ AU</small></p>
</div>
<!-- /.col-md-11 -->
</div>
<!-- /.row -->
</div>
<!-- /.col-md-12 -->
</div>
<!-- /.row -->
</section>

</div>
<!-- /.col-md-6 -->
</div>
<!-- /.row -->
</div>
<!-- /. -->

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

<!-- ========== THEME JS ========== -->
<script src='js/main.js'></script>
<script>
$(function(){

});
</script>

<!-- ========== ADD custom.js FILE BELOW WITH YOUR CHANGES ========== -->
</body>
</html>

