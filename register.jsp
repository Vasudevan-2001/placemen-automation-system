
<html>
<head>
<meta charset='utf-8'>  
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<meta name='description' content=''>
<meta name='author' content=''>
<link rel='icon' type='image/png' sizes='16x16' href='images/favicon.png'>
<style>
    body{
        background-color:#000\9;
    }
    .title{
        text-decoration: none;
    }
    .reg{
        text-decoration: none;
    }
</style>
<title>PAS</title>
<script language='javascript' src='script/register.js'></script>
</head>
<body bgColor=#ffffff leftMargin=0 topMargin=0 MARGINHEIGHT='0' MARGINWIDTH='0' >
<table width='100%' bgcolor='#CEECF5'><tr><td><a  href=''>
<img src='img/log.png'style='width: 50px;padding: 0px;margin: 0px;'>
</a></td><td bgcolor='#CEECF5' width='80%'><font color='white' size='5'>
<a class='title' href='index.jsp'><span style='font-size:30px; color:rgb(200, 62, 30); text-decoration:none;'>PLACEMENT AUTOMATION SYSTEM </span>
</a></td><td bgcolor='#CEECF5' align='right'><a href='register.jsp'class="reg"><b><font color='black'><b>REGISTER</b></a></td><td bgcolor='#CEECF5' align='center'><a href='home.jsp' class="reg"><b><font color='black'><i class='fa fa-sign-in'></i> SIGN IN</a></tr></table>
<form action='registeraction.jsp' method='post' name='regform'> 
<!--<img border='0' src='images/header.jpg'>-->	
<table cellspacing='0' cellpadding='0' border='0' align='center' style='width:80%;' bordercolor='gray'>
<tr></tr><tr></tr><tr></tr><br>
<tr><td><b><font size = '5' color = 'indigo'>Registration Form</font><br/></td></tr></table>
<table cellspacing='4' cellpadding='2' border='0' align='center' style='width:80%;' bordercolor = 'brown'>
<tr align='right'><td><font color='thickblue'>Fields marked with asterix ( </font>
<font color='ceyon'>*</font>
<font color='thickblue'>) are mandatory</font></td></tr></table>
<table cellspacing='4' cellpadding='2' border='0' align='center' style='width:80%;' bordercolor='brown'>
<tr><td colspan='2' style='background-color:#E3F2FA; padding:0px;'>
<tr><td colspan='2'></td></tr>
<tr><td colspan='2'></td></tr>
<tr><td colspan='2' style='background-color:#E3F2FA; padding:0px;'>
<b><font size='3' color='darkblue' face='Comic Sans MS'>LOGIN DETAILS</b></td></tr>
<tr><td colspan='2'></td></tr>
<tr><td style='width:25%;'><b><font color='darkblue'>User Name<font color='ceyon'> *</td>
<td style='width:75%;'><input type='text' name='username' clas='textfield' id='strusername' value='' size='25' maxlength='25' required/>
</td></tr>
<tr><td style='width:25%;'><b><font color='darkblue'>User ID<font color='ceyon'> *</td>
<td style='width:75%;'><input type='text' name='userid' id='struserid' value='' size='25' maxlength='25' class='textfield' onChange ='length1(this)' required placeholder="Minimum 6 characters">
<font color=gray></font></td></tr>
<tr><td><b><font color=darkblue>Password<font color=ceyon> *</td>
<td><input type=password name=password id=strpassword value='' size=25 maxlength=25 class=textfield onChange='length1(this)' required placeholder="Minimum 6 characters" >
<font color='gray'></font></td></tr>
<tr><td><b><font color='darkblue'>Confirm Password<font color='ceyon'> *</td>
<td><input type=password name=con_password id=con_password value='' size=25 maxlength=25 class=textfield required placeholder="Confirm password ">
<font color = gray></font></td></tr>
<tr><td colspan=2></td></tr>

<tr><td style=width:25%;><b><font color = darkblue>date of joining <font color = ceyon>*</td>
<td style=width:75%;>
 <input type='date' name='doj'> 
<!--<select name='dept' id='intcountry' class=textfield  style=width:200px; onChange='return mySelect();' required>
<option value=0>- Select Department-</option>
<option value='B.E-Civil'>B.E-Civil</option>
<option value='Computer science'>Computer science</option>
<option value='Electronics and communication'>Electronics and communication</option>
<option value='Electrical and electronics'>Electrical and electronics</option>
<option value='Information technology'>Information technology</option>
<option value='Mechanical'>Mechanical</option>
</select>-->
</td></tr>


<tr><td style=width:25%;><b><font color = darkblue>Department <font color = ceyon>*</td>
<td style=width:75%;>
<select name='dept' id='intcountry' class=textfield  style=width:200px; onChange='return mySelect();' required>
<option value=0>- Select Department-</option>
<option value='B.E-Civil'>B.E-Civil</option>
<option value='Computer science'>Computer science</option>
<option value='Electronics and communication'>Electronics and communication</option>
<option value='Electrical and electronics'>Electrical and electronics</option>
<option value='Information technology'>Information technology</option>
<option value='Mechanical'>Mechanical</option>
</select>
</td>
</tr>

<tr align = left><td colspan=2 style=background-color:#E3F2FA; padding:0px;>
<b><font size = 3 color = darkblue face = Comic Sans MS>USER DETAILS</b></td></tr>
<tr><td colspan=2 style=padding:0px; id=userDetails></td></tr>
<TR><TD><b><font color = darkblue>DOB:<font color = ceyon> *</TD>
<td> <input type='date' name='dob' required></TD></TR>
<tr><td colspan=2></td></tr>
<TR><TD><b><font color = darkblue>Gender:<font color = ceyon> *</TD>
<td> <input type='radio' name='gender' value='male'>Male <input type='radio' name='gender' value='female'>Female</TD></TR>
<tr><td><b><font color = darkblue>Phone<font color = ceyon> *</td>
<td><input type=text name='phone' id=strmobile value='' size=18 maxlength=10 onkeypress=return blockkey(this) required placeholder="Only 10 Digit Number">
<font color = gray></font></td></tr>
<tr><td><b><font color = darkblue>E-mail ID <font color = ceyon>*</td>
<td><input type=email name='mail' value=''  size=50 maxlength=40 onChange = email(this) required placeholder="E-mail Id" >&nbsp;&nbsp;</tr>
<tr><td colspan=2></td></tr>
<tr><td colspan=2 style=padding:0px; id=profileDetails></td></tr>
<tr><td colspan=2><input type=checkbox name=terms id=TERMS value=Y checked=checked />
<font size = 3 color = purple><b>I accept the <a href=termsandconditions.html>terms and conditions</a></b><br/>
</td></tr>
<tr><td colspan=2></td></tr>
<tr><td colspan=2 style=background-color:#E3F2FA; padding:0px;></td></tr>
<tr><td colspan=2></td></tr><tr><td colspan=2></td></tr>
<tr><td colspan=2 align=center>
<input type=image name=submit_image id=submit_image src=images/submit.jpg ></td></tr>
</table></td></tr></table></form>
</body>
</html>
