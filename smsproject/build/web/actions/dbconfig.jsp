<%-- 
    Document   : dbconfig.jsp
    Created on : 28 Apr, 2015, 6:57:11 PM
    Author     : SantoshKumar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<% 
    Connection con = null;
    Statement st = null;
    ResultSet rs = null;
    
    try
    {
      
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");   
        con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;user=st;password=stud;database=student");
        st =con.createStatement();
        
    }
    catch(Exception e)
    {
       // out.println("The following error has araised"+e);
    }
    finally
    {
        if(rs!=null) 
            rs.close(); 
        if(st!=null)
            st.close(); 
        if(con!=null) 
            con.close();
    } 
%>

