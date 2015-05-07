<%-- 
    Document   : logout.jsp
    Created on : 27 Apr, 2015, 10:53:56 PM
    Author     : satish
--%>

<%-- 
    Document   : logout.jsp
    Created on : 27 Apr, 2015, 10:53:56 PM
    Author     : satish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%@page import="java.sql.*" %>
        <%
            Connection con;
            Statement st;
            try
            {
                //out.println("Connection is going to start");
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                //out.println("Class loaded");

                con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;user=st;password=stud;database=student");
                //out.println("Driverloaded");

                st = con.createStatement();
                //out.println("Statement created");
                
                st.executeUpdate("delete from dbo.temp_course_master;");
                
                st.executeUpdate("delete from dbo.temp_branch_master;");
                 
                st.executeUpdate("delete from dbo.temp_semester_master;");

               
                
                st.close();
                con.close();

            }
            catch(Exception e)
            {
                out.println("The following error araised :"+e);
            }
            
            session.invalidate();
            //session.setAttribute("uname", null);
            //session.setAttribute("array", null);
            response.sendRedirect("./index.jsp");
        %>
    </body>
</html>
