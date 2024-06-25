
<%@page import ="java.sql.*" %>
<%!
String update,cid,drive_date,sessemail,sesstype,mobile,email,campus,name,cprofile,drive_details,e_sslc,e_hsc,e_cgpa,e_ca,e_hoa,location,website;
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
    
    update="update tbl_company set e_sslc='"+e_sslc+"',e_hsc='"+e_hsc+"',e_cgpa='"+e_cgpa+"',e_ca='"+e_ca+"',e_hoa='"+e_hoa+"',drive_date='"+drive_date+"',location='"+location+"',website='"+website+"',campus='"+campus+"',dept='"+sb+"' where cmpid='"+cid+"'";
    int res=stmt.executeUpdate(update);
    if(res>0){%>
                <script>alert('Company details are updated successfully');location.href='companydetails.jsp';</script>
        
    <%}
    else{%>
        
        <script>alert('Company details are updated unsuccessfully');location.href('edit-company.jsp');</script>
    <%}
    }
  %>