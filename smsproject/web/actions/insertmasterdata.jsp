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
      
    int cid = 0;
    
       
    ResultSet rs, rs1,rs2, rsss;
       
    String sql_course = "insert into dbo.course_master select * from dbo.temp_course_master;";

    int i = jc.insertData(sql_course);
    System.out.println("cid is : "+i);


    String sql_branch = "insert into dbo.branch_master select * from dbo.temp_branch_master;";

    int i1 = jc.insertData(sql_branch);
    System.out.println("cid is : "+i1);

   String sql_semister = "insert into dbo.semister_master select *from dbo.temp_semister_master;";


    int i2 = jc.insertData(sql_semister);
    System.out.println("cid is : "+i2);


    if(i1 == 1 && i2 == 1 && i == 1)
    {
        String sql_course_temp = "delete from dbo.temp_course_master;";
        String sql_branch_temp = "delete  from dbo.temp_branch_master;";
        String sql_semister_temp = "delete  from dbo.temp_semister_master;";
        int i4 = jc.DeleteData(sql_course_temp);
        int i5 = jc.DeleteData(sql_branch_temp);
        int i6 = jc.DeleteData(sql_semister_temp);
        if(i4 == 1 && i5 == 1 && i6 == 1)
        {
            out.println("success");
        }
        else
        {
            out.println("delete failed");
        }
    }
    else
    {
         out.println("failed");
    }
%>
