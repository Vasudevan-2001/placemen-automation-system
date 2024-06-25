<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import ="java.util.ArrayList" %>
<%@page import ="javax.servlet.*" %>

<%!
String msg,error,select,cid,name,drive_date,drive_details,sessemail,sesstype,mobile,email,campus,e_sslc,e_hsc,e_cgpa;
String e_ca,e_hoa,location,website,insert;
int res;
String[] dept;
Connection con;
Statement stmt;
ResultSet rs;

%>  
       

<%
  sesstype=session.getAttribute("sesstype").toString();
  sessemail=session.getAttribute("sessmail").toString();  
  if(!sessemail.equals(""))
  {  
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
        stmt=con.createStatement();
  
        cid=request.getParameter("cid");
        name=request.getParameter("cname");
        drive_details=request.getParameter("drive_details");
        e_sslc=request.getParameter("e_sslc");
        e_hsc=request.getParameter("e_hsc");
        e_cgpa=request.getParameter("e_cgpa");
        e_ca=request.getParameter("e_ca");
        e_hoa=request.getParameter("e_hoa");
        drive_date=request.getParameter("drive_date");
        location=request.getParameter("location");
        website=request.getParameter("website");
        campus=request.getParameter("campus");
        
        StringBuffer sb=new StringBuffer();
        
        
       String dept[]=request.getParameterValues("dept");
       
       for(int k=0;k<dept.length;k++)
       {
         sb.append(dept[k]+",");
       }
       
       insert="insert into tbl_company(cmpid,name,job_desc,e_sslc,e_hsc,e_cgpa,e_ca,e_hoa,drive_date,location,website,campus,dept) values('"+cid+"','"+name+"','"+drive_details+"','"+e_sslc+"','"+e_hsc+"','"+e_cgpa+"','"+e_ca+"','"+e_hoa+"','"+drive_date+"','"+location+"','"+website+"','"+campus+"','"+sb+"')";
       int res=stmt.executeUpdate(insert);
       if(res>0){
       session.setAttribute("sesscompany",cid);

%>
       <script>alert('Company details are Inserted Successfully');location.href='addcompanyprofile.jsp?cid1=<%=cid%>'; </script>
           
       <%
    }
        
}
        
else
{
%>
            <script>alert('session destroyed');location.href='home.jsp';</script>
<%}


%>