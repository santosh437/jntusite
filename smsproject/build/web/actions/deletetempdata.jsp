<%-- 
    Document   : insertdata
    Created on : 28 Apr, 2015, 1:42:57 AM
    Author     : satish
--%>
<%@page import="classes.JdbcConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<%
  
   JdbcConnection jc = new JdbcConnection();  
    String sql_course_temp = "delete from dbo.temp_course_master;";
    String sql_branch_temp = "delete from dbo.temp_branch_master;";
    String sql_semister_temp = "delete from dbo.temp_semister_master;";
    int i4 = jc.DeleteData(sql_course_temp);
    int i5 = jc.DeleteData(sql_branch_temp);
    int i6 = jc.DeleteData(sql_semister_temp);
    System.out.println("i4 :"+i4);
    System.out.println("i4 :"+i5);
    System.out.println("i6 :"+i6);
    
    if(i4 == 1 && i5 == 1 && i6 == 1)
    {
        out.println("success");
    }
    else
    {
        out.println("delete failed");
    }

    
%>
