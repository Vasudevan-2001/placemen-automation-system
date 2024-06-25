#!/Python27/python.exe
print "content-type:text/html\n\r\n\r"
from connection import *
regno=form.getvalue('regno1')
msg=form.getvalue('msg')
error=form.getvalue('error')
if(form.getvalue('update')=="update"):
           regno=form.getvalue('regno')
           name=form.getvalue('name')
##           password=form.getvalue('password')
           dept=form.getvalue('dept')
           dob=str(form.getvalue('dob'))
           gender=form.getvalue('gender')
           mobile=form.getvalue('mobile')
           email=form.getvalue('emailid')
           doj=form.getvalue('doj')
           sslc=form.getvalue('sslc')
           hsc=form.getvalue('hsc')
           cgpa=form.getvalue('cgpa')
           c_arrear=form.getvalue('c_arrear')
           h_arrear=form.getvalue('h_arrear')
           yop=form.getvalue('yop')
           try:
                      update="update tbl_student set name='%s',dob='%s',gender='%s',doj='%s',dept='%s',mobile='%s',email='%s',sslc='%s',hsc='%s',cgpa='%s',current_arrear='%s',history_of_arrear='%s',yop='%s' where regno='%s'"%(name,dob,gender,doj,dept,mobile,email,sslc,hsc,cgpa,c_arrear,h_arrear,yop,regno)
                      if(cursor.execute(update)>0):
                                 db.commit()
                                 print "<script>location.href='edit-student.py?msg=Details Updated successfully&regno1=%s';</script>"%(regno)
           except:
                      error="Something went wrong. Please try again"
                      print "<script>alert('regno/email already exist');location.href='edit-student.py';</script>"

print """<!DOCTYPE html>
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

<!-- ========== TOP NAVBAR ========== -->"""
##<?php include('includes/topbar.py');?>
import topbar
print """<!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
<div class='content-wrapper'>
<div class='content-container'>"""

import leftbar

print """<div class='main-page'>

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
<li><a href='dashboard1.py'><i class='fa fa-home'></i> Home</a></li>

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
<h5>Fill the Student info</h5>
</div>
</div>
<div class='panel-body'>"""
if(msg!=None):
    print "<div class='alert alert-success left-icon-alert' role='alert'>"
    print "<strong>Well done!</strong>%s"%(msg)
    print "</div>"
elif(error!=None):
    print "<div class='alert alert-danger left-icon-alert' role='alert'>"
    print "<strong>Oh snap!</strong>%s"%(error)
    print "</div>"
print "<form class='form-horizontal' method='post'>"
select="select * from tbl_student where regno='%s'"%(regno)
cursor.execute(select)
results=cursor.fetchone()
regno=results[0]
name=results[1]
password=results[2]
dob=results[4]
gender=results[5]
dept=results[9]
doj=results[8]
mobile=results[6]
email=results[7]
sslc=results[10]
hsc=results[11]
cgpa=results[12]
c_arrear=results[13]
h_arrear=results[14]
##yop=doj.split('/') and doj.split('-')
yop=results[15]
from datetime import datetime
current_year=datetime.now().strftime('%Y')
if(yop==current_year):
           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Register Number</label>
           <div class='col-sm-10'>"""
           print "<input type='text' name='regno' class='form-control' readonly id='regno' value='%s' required='required' autocomplete='off'>"%(regno)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Full Name</label>
           <div class='col-sm-10'>"""
           print "<input type='text' name='name' class='form-control' id='name' value='%s' readonly required='required' autocomplete='off'>"%(name)
           print """</div>
           </div>"""

           ##print """<div class='form-group'>
           ##<label for='default' class='col-sm-2 control-label'>Current Password</label>
           ##<div class='col-sm-10'>"""
           ##print "<input type='text' name='password' class='form-control' value='%s' required='required' autocomplete='off'>"%(password)
           ##print """</div>
           ##</div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>dob</label>
           <div class='col-sm-10'>"""
           print "<input type='date' name='dob' class='form-control' id='dob' value='%s' readonly required='required' autocomplete='off'>"%(dob)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Gender</label>
           <div class='col-sm-10'>"""

           if(gender=="male"):
                      print "<input type='radio' name='gender' value='male' required='required' checked>male <input type='radio' name='gender' value='female' required='required' readonly>female"
           if(gender=="female"):
                      print "<input type='radio' name='gender' value='male' readonly required='required' >male <input type='radio' name='gender' value='female' required='required' checked>female"
           ##if(gender=="Other"):
           ##           print "<input type='radio' name='gender' value='male' required='required' >male <input type='radio' name='gender' value='female' required='required'>female <input type='radio' name='gender' value='Other' required='required' checked>Other"
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='date' class='col-sm-2 control-label'>Date of Joining</label>
           <div class='col-sm-10'>"""
           print "<input type='date' name='doj' value='%s' class='form-control' required='required' readonly>"%(doj)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Department</label>
           <div class='col-sm-10'>"""
           print "<select readonly name='dept' id='intcountry' class='form-control'  style=width:200px; onChange='return mySelect();' required>"
           print "<option value='%s' selected>%s</option>"%(dept,dept)
           ##print "<option value='B.E-Civil'>B.E-Civil</option>"
           ##print "<option value='Computer science'>Computer science</option>"
           ##print "<option value='Electronics and communication'>Electronics and communication</option>"
           ##print "<option value='Electrical and electronics'>Electrical and electronics</option>"
           ##print "<option value='Information technology'>Information technology</option>"
           ##print "<option value='Mechanical'>Mechanical</option>"
           print "</select>"
           print """</div>
           </div>"""


           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Mobile</label>
           <div class='col-sm-10'>"""
           print "<input type='text' name='mobile' class='form-control' id='mobile' readonly value='%s'>"%(mobile)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Email id</label>
           <div class='col-sm-10'>"""
           print "<input type='email' name='emailid' class='form-control' id='email' readonly value='%s' required='required' autocomplete='off'>"%(email)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>SSLC</label>
           <div class='col-sm-10'>"""
           print "<input type='number' name='sslc' min='0' max='100' step='0.01' class='form-control' value='%s' required='required' autocomplete='off'>"%(sslc)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>HSC</label>
           <div class='col-sm-10'>"""
           print "<input type='number' name='hsc' min='0' max='100' step='0.01' class='form-control' value='%s' required='required' autocomplete='off'>"%(hsc)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>CGPA</label>
           <div class='col-sm-10'>"""
           print "<input type='number' name='cgpa' min='0' max='10' step='0.01' class='form-control' value='%s' required='required' autocomplete='off'>"%(cgpa)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Current Arrears</label>
           <div class='col-sm-10'>"""
           print "<input type='number' name='c_arrear' min='0' max='100' class='form-control' value='%s' required='required' autocomplete='off'>"%(c_arrear)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>History Of Arrears</label>
           <div class='col-sm-10'>"""
           print "<input type='number' name='h_arrear' min='0' max='100' class='form-control' value='%s' required='required' autocomplete='off'>"%(h_arrear)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Year Of Passing</label>
           <div class='col-sm-10'>"""
           print "<input type='text' name='yop' class='form-control' value='%s' readonly>"%(yop)
           print """</div>
           </div>"""
                                               


           print """<div class='form-group'>
           <div class='col-sm-offset-2 col-sm-10'>
           <input type='submit' name='update' class='btn btn-primary' value='update'>"""
           print "<input type='submit' name='back' class='btn btn-primary' value='back' formaction='studentdetails.py?dept1=%s&yop1=%s'>"%(dept,yop)
           print """</div>
           </div>"""
else:
           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Register Number</label>
           <div class='col-sm-10'>"""
           print "<input type='text' name='regno' class='form-control' readonly id='regno' value='%s' required='required' autocomplete='off'>"%(regno)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Full Name</label>
           <div class='col-sm-10'>"""
           print "<input type='text' name='name' class='form-control' id='name' value='%s' readonly required='required' autocomplete='off'>"%(name)
           print """</div>
           </div>"""

           ##print """<div class='form-group'>
           ##<label for='default' class='col-sm-2 control-label'>Current Password</label>
           ##<div class='col-sm-10'>"""
           ##print "<input type='text' name='password' class='form-control' value='%s' required='required' autocomplete='off'>"%(password)
           ##print """</div>
           ##</div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>dob</label>
           <div class='col-sm-10'>"""
           print "<input type='date' name='dob' class='form-control' id='dob' value='%s' readonly required='required' autocomplete='off'>"%(dob)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Gender</label>
           <div class='col-sm-10'>"""
           print "<input type='text' name='gender' value='%s' class='form-control' readonly required='required'>"%(gender)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='date' class='col-sm-2 control-label'>Date of Joining</label>
           <div class='col-sm-10'>"""
           print "<input type='date' name='doj' value='%s' class='form-control' required='required' readonly>"%(doj)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Department</label>
           <div class='col-sm-10'>"""
           print "<select readonly name='dept' id='intcountry' class='form-control'  style=width:200px; onChange='return mySelect();' required>"
           print "<option value='%s' selected>%s</option>"%(dept,dept)
           ##print "<option value='B.E-Civil'>B.E-Civil</option>"
           ##print "<option value='Computer science'>Computer science</option>"
           ##print "<option value='Electronics and communication'>Electronics and communication</option>"
           ##print "<option value='Electrical and electronics'>Electrical and electronics</option>"
           ##print "<option value='Information technology'>Information technology</option>"
           ##print "<option value='Mechanical'>Mechanical</option>"
           print "</select>"
           print """</div>
           </div>"""


           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Mobile</label>
           <div class='col-sm-10'>"""
           print "<input type='text' name='mobile' class='form-control' readonly id='mobile' readonly value='%s'>"%(mobile)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Email id</label>
           <div class='col-sm-10'>"""
           print "<input type='email' name='emailid' class='form-control' readonly id='email' readonly value='%s' required='required' autocomplete='off'>"%(email)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>SSLC</label>
           <div class='col-sm-10'>"""
           print "<input type='number' name='sslc' min='0' max='100' readonly step='0.01' class='form-control' value='%s' required='required' autocomplete='off'>"%(sslc)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>HSC</label>
           <div class='col-sm-10'>"""
           print "<input type='number' name='hsc' min='0' max='100'readonly step='0.01' class='form-control' value='%s' required='required' autocomplete='off'>"%(hsc)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>CGPA</label>
           <div class='col-sm-10'>"""
           print "<input type='number' name='cgpa' min='0' max='10'readonly  step='0.01' class='form-control' value='%s' required='required' autocomplete='off'>"%(cgpa)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Current Arrears</label>
           <div class='col-sm-10'>"""
           print "<input type='number' name='c_arrear' min='0' max='100' readonly class='form-control' value='%s' required='required' autocomplete='off'>"%(c_arrear)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>History Of Arrears</label>
           <div class='col-sm-10'>"""
           print "<input type='number' name='h_arrear' min='0' max='100' readonly class='form-control' value='%s' required='required' autocomplete='off'>"%(h_arrear)
           print """</div>
           </div>"""

           print """<div class='form-group'>
           <label for='default' class='col-sm-2 control-label'>Year Of Passing</label>
           <div class='col-sm-10'>"""
           print "<input type='text' name='yop' class='form-control' value='%s' readonly>"%(yop)
           print """</div>
           </div>"""
                                               


           print """<div class='form-group'>
           <div class='col-sm-offset-2 col-sm-10'>"""
           print "<input type='submit' name='back' class='btn btn-primary' value='back' formaction='studentdetails.py?dept1=%s&yop1=%s'>"%(dept,yop)
           print """</div>
           </div>"""
print """</form>

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
</html>"""
##<?PHP } ?>
