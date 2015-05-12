<%-- 
    Document   : logincheck
    Created on : 27 Apr, 2015, 2:36:33 PM
    Author     : satish
--%>

<%@page import="classes.JdbcConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<%
    
    String username = request.getParameter("username");
    String passwordid = request.getParameter("passwordid");
    
        
    String uname = "";   
   
    ResultSet rs;
    
    try
    {
       JdbcConnection jc = new JdbcConnection();
       
        String sql = "select * from users;";
        rs = jc.retreiveData(sql);
       // out.println("result set generated");
        
        while(rs.next())
        {
            if(rs.getString("username").equalsIgnoreCase(username) && rs.getString("password").equalsIgnoreCase(passwordid) )
            {
                session.setAttribute("uname", username);
                out.println(rs.getString("role"));
            }
            else
            {
                out.println("failed");
                
            }
        }
    }
    catch(Exception e)
    {
       // out.println("The following error has araised"+e);
    }
%>