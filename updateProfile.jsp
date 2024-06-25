<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.time.*" %>



<%!
    Connection con;
    ResultSet rs;
    Statement stmt;
    String regno,name,password,dept,dob,gender,mobile,email,doj,sslc,hsc,cgpa,c_arrear,h_arrear,syop,update,msg,error,confirm_password;
    String current_arrear,history_of_arrear,sessregno,sessemail;
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
       // int current_year=localate.getYear();
           regno=request.getParameter("regno");
           name=request.getParameter("name");
           password=request.getParameter("password");
           dept=request.getParameter("dept");
           dob=request.getParameter("dob");
           gender=request.getParameter("gender");
           mobile=request.getParameter("mobile");
           email=request.getParameter("emailid");
           doj=request.getParameter("doj");
           sslc=request.getParameter("sslc");
           hsc=request.getParameter("hsc");
           cgpa=request.getParameter("cgpa");
           c_arrear=request.getParameter("c_arrear");
           h_arrear=request.getParameter("h_arrear");
           yop=Integer.parseInt(request.getParameter("yop"));
           
     try{
        update="update tbl_student set name='"+name+"',password='"+password+"',dob='"+dob+"',"
        + "gender='"+gender+"',doj='"+doj+"',dept='"+dept+"',mobile='"+mobile+"',"
        + "email='"+email+"',sslc='"+sslc+"',hsc='"+hsc+"',cgpa='"+cgpa+"',"
        + "current_arrear='"+c_arrear+"',history_of_arrear='"+h_arrear+"',"
        + "yop='"+yop+"' where regno='"+regno+"'";
        int res=stmt.executeUpdate(update);
         if(res==1){ %>
                        
       <script>alert('update susccessfully');location.href='dashboard1.jsp';</script>
                            
           <%}
              else{
                   %>
                     <script>alert('Error in updation');location.href='viewprofile.jsp';</script>
                  <%}
            }
           catch(Exception e){ 
                      error="Something went wrong. Please try again"; %>
                      <script>alert('regno/email already exist');location.href='viewprofile.jsp';</script>
               <% } }

else
{
%>
<script>alert('session destroyed');location.href='home.jsp';</script>
<%}
%>   