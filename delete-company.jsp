<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%!
String sessemail,sesstype,cid,delete1,delete;
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
 
    
    cid=request.getParameter("cid1");
//    delete1="delete from tbl_drive where id='"+cid+"'";
    delete="delete from tbl_company where cmpid='"+cid+"'";
//    int res=stmt.executeUpdate(delete1);
    int res=stmt.executeUpdate(delete);
    if(res>0){%>
        <script>alert('company deleted successfully');location.href='companydetails.jsp';</script>
  <%   }
    
 
}

else
{
%>
            <script>alert('session destroyed');location.href='home.jsp';</script>
<%}

%>
 
 




