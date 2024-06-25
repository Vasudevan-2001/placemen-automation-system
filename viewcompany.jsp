<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.util.Date" %>
<%@page import ="java.text.SimpleDateFormat" %>


<%!
    Connection con;
    ResultSet rs,rs1,rs2;
    Statement stmt,stmt1,stmt2;
    String sessregno,sessemail,remoteurl,remotefilepath;
    String   dept,sslc,hsc,cgpa,ca,hoa,dept1[];
    String cid,name,cprofile,drive_details,e_sslc,e_hsc,e_cgpa,e_ca,e_hoa,drive_date,campus,eligibility_status,status,application_status; 
    int yop,current_year;
    
  %>


<%
  sessregno=session.getAttribute("sessregno").toString();
  sessemail=session.getAttribute("sessemail").toString();  
if(!sessemail.equals(""))

  {
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
        stmt=con.createStatement(); 
        stmt1=con.createStatement(); 
        stmt2=con.createStatement(); 
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy"); /*yyyy-MM-dd HH:mm:ss */
        current_year=Integer.parseInt(sdf.format(new Date()));

%>
<!DOCTYPE html>
<html lang='en'>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>View company </title>
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
</li>

<li class='has-children'>
<a href='#'><i class='fa fa-info-circle'></i> <span>Profile</span> <i class='fa fa-angle-right arrow'></i></a>
<ul class='child-nav'>
<li><a href='viewprofile.jsp'><i class='fa fa fa-server'></i> <span>Manage Profile</span></a></li>
</ul></li>

<li class='has-children'>
<a href='#'><i class='fa fa-info-circle'></i> <span>Drives</span> <i class='fa fa-angle-right arrow'></i></a>
<ul class='child-nav'>
<li><a href='viewcompany.jsp'><i class='fa fa fa-server'></i> <span>View Companies</span></a></li>
</ul>
</li>

<li class='has-children'>
<a href='#'><i class='fa fa-info-circle'></i> <span>Alumni</span> <i class='fa fa-angle-right arrow'></i></a>
<ul class='child-nav'>
<li><a href='viewalumni.jsp'><i class='fa fa fa-server'></i> <span>View Alumni students</span></a></li>
</ul>
<li><a href='change-password.jsp'><i class='fa fa fa-server'></i> <span> Student Change Password</span></a></li>
</li>

</div>
<!-- /.sidebar-nav -->
</div>
<!-- /.sidebar-content -->
</div>

<div class='main-page'>
<div class='container-fluid'>
<div class='row page-title-div'>
<div class='col-md-6'>
<h2 class='title'>view company </h2>

</div>

<!-- /.col-md-6 text-right -->
</div>
<!-- /.row -->
<div class='row breadcrumb-div'>
<div class='col-md-6'>
<ul class='breadcrumb'>
<li><a href='dashboard1.jsp'><i class='fa fa-home'></i> Home</a></li>
<li>Drives</li>
<li class='active'>view company </li>
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

<div class='panel-body p-20'>

<table id='example' class='display table table-striped table-bordered' cellspacing='0' width='100%'>
<thead>
<tr>
<th>#</th>
<th>Company id</th>
<th>Company name</th>
<th>Company profile</th>
<th>Drive date</th>
<th>Campus</th>
<th>Eligibility status</th>
<th>Action</th>
<th>Application status</th>
</tr>
</thead>
<tbody>
<%
String select="select dept,sslc,hsc,cgpa,current_arrear,history_of_arrear,yop from tbl_student where regno='"+sessregno+"'";
rs=stmt.executeQuery(select);
if(rs.next()){
  
    dept=rs.getString(1);
    sslc=rs.getString(2);
    hsc=rs.getString(3);
    cgpa=rs.getString(4);
    ca=rs.getString(5);
    hoa=rs.getString(6);
    yop=Integer.parseInt(rs.getString(7));
 }


    remoteurl="companyProfile";
    remotefilepath=request.getRealPath(remoteurl);

String select1="select * from tbl_company where drive_date>=curdate() and dept like '%"+dept+"%'";
//out.println(select1);
int cnt=0;
rs1=stmt1.executeQuery(select1);
while(rs1.next()){

        cid=rs1.getString(2);
        name=rs1.getString(3);
        cprofile=rs1.getString(4);
        drive_details=rs1.getString(5);
        e_sslc=rs1.getString(6);
        e_hsc=rs1.getString(7);
        e_cgpa=rs1.getString(8);
        e_ca=rs1.getString(9);
        e_hoa=rs1.getString(10);
        drive_date=rs1.getString(11);
        campus=rs1.getString(14);
        cnt=cnt+1;
       
         if(e_ca.equals("0") && e_hoa.equals("0"))
         {
            
            if((Integer.parseInt(sslc)>=Integer.parseInt(e_sslc)) && (Integer.parseInt(hsc)>=Integer.parseInt(e_hsc)) && (Float.parseFloat(cgpa)>=Float.parseFloat(e_cgpa)) && (Integer.parseInt(ca)>=Integer.parseInt(e_ca)) && (Integer.parseInt(hoa)>=Integer.parseInt(e_hoa)))
            {
            
                
                eligibility_status="Eligible";
            }
            else{
            
                eligibility_status="Not Eligible";
                }
//             out.print("1 id :"+eligibility_status);
        }
        else if(e_ca.equals("0") && !e_hoa.equals("0"))
        {
           
            if((Integer.parseInt(sslc)>=Integer.parseInt(e_sslc)) && (Integer.parseInt(hsc)>=Integer.parseInt(e_hsc)) && (Float.parseFloat(cgpa)>=Float.parseFloat(e_cgpa)) && (Integer.parseInt(ca)>=Integer.parseInt(e_ca)) && (Integer.parseInt(hoa)>=Integer.parseInt(e_hoa)))
            
            {
                eligibility_status="Eligible";
            }
            else{
                eligibility_status="Not Eligible";
             }
//             out.print("2 id :"+eligibility_status);
        }
            else if(!e_ca.equals("0") && e_hoa.equals("0"))
            {
           
            if((Integer.parseInt(sslc)>=Integer.parseInt(e_sslc)) && (Integer.parseInt(hsc)>=Integer.parseInt(e_hsc)) && (Float.parseFloat(cgpa)>=Float.parseFloat(e_cgpa)) && (Integer.parseInt(ca)>=Integer.parseInt(e_ca)) && (Integer.parseInt(hoa)<=Integer.parseInt(e_hoa)))
            {
            
                eligibility_status="Eligible";
            }
            else{
                eligibility_status="Not Eligible";
             }
//             out.print("3 id :"+eligibility_status);
           } 
           else{
            if((Integer.parseInt(sslc)>=Integer.parseInt(e_sslc)) && (Integer.parseInt(hsc)>=Integer.parseInt(e_hsc)) && (Float.parseFloat(cgpa)>=Float.parseFloat(e_cgpa)) && (Integer.parseInt(ca)<=Integer.parseInt(e_ca)) && (Integer.parseInt(hoa)<=Integer.parseInt(e_hoa)))
            {
                eligibility_status="Eligible";
            }
            else{
                eligibility_status="Not Eligible";
             }
//            out.print("4 id :"+eligibility_status);
    }


%>
<tr><td><%=cnt%></td>
    <td><%=cid%></td>
    <td><%=name%></td>
    <td><a href='<%=remoteurl+"/"+cid+"/"+ cprofile%>' target='_blank' ><font color='red'><b>view/download</b></font></a></td>
    <td><%=drive_date%></td>
    <td><%=campus%></td>
    <td><%=eligibility_status%></td>

<%
    if(eligibility_status.equals("Eligible")){
            String select2="select status,application_status from tbl_drive where regno='"+sessregno+"' and id='"+cid+"'";
            rs2=stmt2.executeQuery(select2);
            if(rs2.next()){
                status=rs2.getString(1);
                application_status=rs2.getString(2);%>
                <td class='dropdown'>
                    <b><%=status%></b>
                </td>
                <%if(application_status.equals("ACCEPTED")){%>
                    <td>
                    <font color='darkgreen'><b>
                    <%=application_status%>
                    </b></font>
                    </td>
                <%}
                    else if(application_status.equals("REJECTED")){%>
                        
                    <td>
                    <font color='darked'><b>
                    <%=application_status%>
                    </b></font>
                    </td>
                   <%}
                else{
                     application_status="In Progress.....,";%>
                     <td>
                        <%=application_status%>
                     </td>
                   <%}
                }
            else if(yop==current_year){%>
                <a class='btn btn-default actionButton' data-toggle='dropdown' href='#'> Action </a>
                <td>
                <a href='apply-company.jsp?cid1=<%=cid%>&regno1=<%=sessregno%>'>
                <font color='blue'><b><i title='apply'>click to Apply</i></b></font></a> 
                </td>
                
            <%}

            else{%>
                <a class='btn btn-default actionButton' data-toggle='dropdown' href='#'> Action </a>
                <td>
                <%="Apply only Final year students"%>
                </td>
                
            <%}
}

else{%>

        <td colspan='2'>Not applicable</td>
        </tr>
        <%cnt=cnt+1;
        
        }
}
  %>
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
<% }
%>  
    