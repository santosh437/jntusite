<%-- 
    Document   : insertsemester
    Created on : 28 Apr, 2015, 12:39:53 AM
    Author     : satish
--%>

<%@page import="classes.JdbcConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>

<%
    String year = request.getParameter("year");
    String semester = request.getParameter("semestername");
    String sem_print_name = request.getParameter("semprintname");
    String course_completed = request.getParameter("coursecompleted");
    String annual_exam_for_sem = request.getParameter("annualexam");
    System.out.println("hello "+course_completed);
    System.out.println("hello1 "+annual_exam_for_sem);
    if(course_completed.equalsIgnoreCase("true"))
    {
        course_completed = "yes";
    }
    else 
    {
        course_completed = "";
    }
    
    if(annual_exam_for_sem.equalsIgnoreCase("true"))
    {
        annual_exam_for_sem = "yes";
    }
    else 
    {
        annual_exam_for_sem = "";
    }
    
    Connection con;
    Statement st, st1;
    ResultSet rs, rs1,rs2;
    int count = 0, i = 0 , count1 = 0;
    try
    {
       // out.println("Connection is going to start");
        JdbcConnection jc = new JdbcConnection();
        
        String sql = "select count(*) AS count from dbo.temp_semester_master where year = '"+year+"'; ";
        rs1 = jc.retreiveData(sql);
        while(rs1.next())
        {
             count = rs1.getInt("count");
        }
        
        String sql11 = "select count(*) AS count from dbo.temp_semester_master where semister = '"+semester+"'; ";
        rs2 = jc.retreiveData(sql11);
        while(rs2.next())
        {
             count1 = rs2.getInt("count");
        }
        System.out.println("count is :"+count);
        String sql1 = "select * from dbo.temp_course_master;";
        
        int cid = 0;
        rs = jc.retreiveData(sql1);
        while(rs.next())
            cid = rs.getInt("courseid");
        
        String sql_insert = "insert into dbo.temp_semester_master values("+cid+",'"+year+"','"+semester+"','"+sem_print_name+"','"+course_completed+"','"+annual_exam_for_sem+"');";
        if(count<2 && count1<1 )
        {
            i = jc.insertData(sql_insert);
            if(i == 1)
            {
                out.println("success");
            }
            else
            {
                out.println("failure");
            }
            
        }
        else
        {
            out.println("existed");
        }
        //rs.close();
      
        
    }   
    catch(Exception e)
    {
        out.println("The following error araised"+e);
    }
    
%>
