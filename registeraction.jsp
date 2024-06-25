<%@page import ="java.sql.*" %>
<%@page import ="java.time.YearMonth"%>
<%@page import ="java.time.format.DateTimeFormatter" %>
<%!
    Connection con;
    ResultSet rs;
    Statement stmt;
    String username,userid,password,con_password,dept,dob,mail,doj,query,gender,phone;
    int res,iyop;
    String syop;
    
  %>
  
<%
username=request.getParameter("username");
userid=request.getParameter("userid");
password=request.getParameter("password");
con_password=request.getParameter("con_password");
dept=request.getParameter("dept");
dob=request.getParameter("dob");
gender=request.getParameter("gender");
phone=request.getParameter("phone");
mail=request.getParameter("mail");
doj=request.getParameter("doj");
//syop=doj.split("/");
StringBuilder sb=new StringBuilder(doj);
sb.delete(4,10);
syop=sb.toString();
int yop=Integer.parseInt(syop)+4;
//iyop=syop[2];
YearMonth ym=YearMonth.now();
int current_year=Integer.parseInt(ym.format(DateTimeFormatter.ofPattern("yyyy")));

if(yop>=current_year)
{

    try{
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pms?autoReconnect=true&useSSL=false","root","vasudevan6385742738@");
        stmt=con.createStatement();
        query="insert into tbl_student(regno,name,password,confirm_password,dob,gender, mobile, email, doj, dept,yop) values ('"+userid+"','"+username+"','"+password+"','"+con_password+"','"+dob+"','"+gender+"','"+phone+"','"+mail+"','"+doj+"','"+dept+"','"+yop+"')";
        int result=stmt.executeUpdate(query);
        if(result>0){%>
                
                    <script>alert('registered successfully');location.href='home.jsp';</script>
        
        <%}
        else{
        %>
                     <script>alert('Error in Insertion');location.href='register.jsp';</script>
        <%}
}
    catch(Exception e)
        {
        
        out.print(e.getMessage());
        %>
    
        
        <script>alert('email/regno is already exist');location.href='register.jsp';</script>
        <%}
}
else{
    %>
    <script>alert('date of joining is invalid');location.href='register.jsp';</script>
<%}%>   
    









