<%-- 
    Document   : insertbranchdata
    Created on : 2 May, 2015, 1:03:36 AM
    Author     : satish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.JdbcConnection" %>
<%@page import="java.sql.*" %>
<%
    JdbcConnection jc = new JdbcConnection();
    
    Connection con;
    Statement st;
    ResultSet rs;
    
    
    
    String branchcode = request.getParameter("branchcode");
    String branchname = request.getParameter("branchname");
    String refer = request.getParameter("refer");
    String no_of_seats = request.getParameter("seats");
    String aicte_name = request.getParameter("aictename");
    
    String sql="";
    
    int cid=0,i=0;
    
    try
    {
        sql = "select *from dbo.temp_course_master;";
        
        rs = jc.retreiveData(sql);
        
        while(rs.next())
            cid = rs.getInt("courseid");
        System.out.println(cid);
        
        sql = "insert into dbo.temp_branch_master values("+cid+",'"+branchcode+"','"+branchname+"','"+refer+"','"+no_of_seats+"','"+aicte_name+"');";
        
        i = jc.insertData(sql);
        
        if(i==1)
        {
            out.println("success");
            System.out.println("success");
        }
        else
        {
            out.println("failed");
        }

    }
    catch(Exception e)
    {
        out.println("Execption occured");
    }
    
%>