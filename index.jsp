<%@page import ="java.sql.*" %>
<!DOCTYPE html>
<html lang='en'>
<%!
    Connection con;
    ResultSet rs;
    Statement stmt;
    StringBuffer sb=new StringBuffer();
    String name,date,value;
  
%>
<head>
    <title>PAS Home</title>
    <%@include file="header.jsp" %>
<style>
.collapse navbar-collapse:hover{
        text-decoration: underline;
    }
.blinking{
    animation:blinkingText 4s infinite;
}
@keyframes blinkingText{
    0%{     color: #000;    }
    49%{    color: violet; }
    50%{    color: yellow; }
    99%{    color:green;  }
    100%{   color: transparent;    }
}
.blinking1{
    animation:blinkingText1 2s infinite;
    font-family:cursive;
}


@keyframes blinkingText1{
    0%{     color: #000;    }
    49%{    color: red; }
    99%{    color:green;  }
    100%{   color: transparent;    }
}
</style>
</head>

<body id='page-top' >

<nav id='mainNav' class='navbar navbar-default navbar-fixed-top' style='background:#CEECF5; box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 15px -3px, rgba(0, 0, 0, 0.05) 0px 4px 6px -2px;'>
    
<div class='container-fluid'>
<!-- Brand and toggle get grouped for better mobile display -->
<div class='navbar-header'>
<button type='button' class='navbar-toggle collapsed' data-toggle='collapse' data-target='#bs-example-navbar-collapse-1'>

<span class='icon-bar'></span>
<span class='icon-bar'></span>
<span class='icon-bar'></span>
</button>
<table size='5'>
<tr>
<td><a class='logo' href='' >
<img src='img/log.png' style='height:50px; width:50px; '>
</a>
    <a class='' href=''><span style='font-size:25px; color:rgb(200, 62, 20); text-align: center;'><b>PLACEMENT AUTOMATION SYSTEM</b></span>
</a></td></tr></table>

</div>
<!-- Collect the nav links, forms, and other content for toggling -->
<div class='collapse navbar-collapse' id='bs-example-navbar-collapse-1'>
<ul class='nav navbar-nav navbar-right'>
<li>
    <a class='page-scroll' href='register.jsp'><font color='black'>REGISTER</font></a>
</li>
<li>
<a class='page-scroll' href='home.jsp'><font color='black'><i class='fa fa-sign-in'></i> SIGN IN</font></a>
</li>
</ul>

</div>
<!-- /.navbar-collapse -->
</div>
<!-- /.container-fluid -->
</nav>
<header>
<div class='header-content'>
<div class='header-content-inner'>
<img src='img/log.png' style='height:200px; width:200px; '>
    
<h1><font color='blue'>PLACEMENT AUTOMATION SYSTEM</font></h1> 

<% 
    try{
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
        stmt=con.createStatement();
        String select="select name,drive_date from tbl_company where drive_date>=CURDATE() LIMIT 3";
        rs=stmt.executeQuery(select);
%>

 <hr>
    <span class='blinking'><h1>UPCOMING DRIVES</h1></span> 
<%
       while (rs.next())
       {
        name = rs.getString("name");
        date = rs.getString("drive_date");
        value=name+"("+date+")";
        sb.append(value);
        sb.reverse().toString();
        String scroll1="&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp";
%>
          
    <MARQUEE behavior='scroll' direction='right' width='100%' scrollamount='25'>
            <h2><span class='blinking1'><i><%=value%></i></span></h2> 
    </MARQUEE>
     <P>---------------------------------------------------</P>
     <%
     }%>
   

<%}
catch(Exception e)
{
        out.print(e.getMessage());
}


%>   
</body>
</html>
