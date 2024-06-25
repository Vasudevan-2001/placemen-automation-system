<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="java.sql.*" %>
<%@page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@page import="javax.servlet.http.*" %>
<%@page import="org.apache.commons.fileupload.*" %>
<%@page import="org.apache.commons.fileupload.disk.*" %>
<%@page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="org.apache.commons.io.output.*" %>

<%!
String sessemail,sesstype,sesscomp;
String cid;
int res;
Connection con;
Statement stmt;
ResultSet rs;
String remoteurl,remotefilepath,localdirectorypath,fileName;

%>  
       

<%
  sesstype=session.getAttribute("sesstype").toString();
  sessemail=session.getAttribute("sessmail").toString();  
  sesscomp=session.getAttribute("sesscompany").toString(); 
  if(!sessemail.equals(""))
  {  
  try{
        cid=session.getAttribute("sesscompany").toString();
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
        stmt=con.createStatement();
        
           File file;
           int maxFileSize = 5000 *1024;
           int maxMemSize= 5000 * 1024;
           remoteurl="companyProfile";
           remotefilepath=request.getRealPath(remoteurl);
//           out.print(remotefilepath);
           File localDirectory=new File(remotefilepath+"/"+sesscomp);
           if(!localDirectory.exists())
           {
               localDirectory.mkdirs();
           }
           String contentType=request.getContentType();
           if((contentType.indexOf("multipart/form-data")>=0)){
               DiskFileItemFactory factory=new DiskFileItemFactory();
               factory.setSizeThreshold(maxMemSize);
               factory.setRepository(new File("E:\\test"));
               ServletFileUpload upload=new ServletFileUpload(factory);
               upload.setSizeMax(maxFileSize);
               try{
                   List fileItems=upload.parseRequest(request);
                   Iterator fi=fileItems.iterator();
                   while(fi.hasNext())
                   {
                       FileItem fitem=(FileItem)fi.next();
                       if(!fitem.isFormField())
                       {
                           String fieldName=fitem.getFieldName();
                           fileName=fitem.getName();
                           boolean isInMemory=fitem.isInMemory();
                           long sizeInBytes=fitem.getSize();
                           file=new File(remotefilepath+"/"+sesscomp+"/"+fileName);
                           fitem.write(file);
                       }
                   }
               }
               catch(Exception e)
               {
                   %>
                   <script>alert("Error:<%=e.getMessage()%>");</script>
               <%}
               
           }
           
           String update="update tbl_company set about='"+fileName+"' where cmpid='"+cid+"'" ;
           res=stmt.executeUpdate(update);
           if(res>0){%>
           <script>alert('Profile Updated Successfully <%=cid%>');location.href='dashboard.jsp';</script>
                    <%}
           else
            {
                
%>
            <script>alert('Error in Uploading');location.href='dashboard.jsp.jsp';</script>
               
         <% 
                }
          
}
catch(Exception e)
            {
         
         
         %>
                     <script>alert('Error in Uploading');location.href='addcompanyprofile.jsp';</script>
             
         <%
        
            }%>
            
                      
 <%        }
        
else
{
%>
            <script>alert('session destroyed');location.href='home.jsp';</script>
<%}


%>