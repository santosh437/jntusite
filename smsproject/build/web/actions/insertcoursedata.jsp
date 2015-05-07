<%-- 
    Document   : insertcoursedata
    Created on : 1 May, 2015, 11:35:10 AM
    Author     : satish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="classes.JdbcConnection" %>
<%@page import="java.sql.*" %>
<%
    JdbcConnection jc = new JdbcConnection();
    System.out.println("inside insertcoursedata file");
    String coursename = request.getParameter("coursename");
    int duration = Integer.parseInt(request.getParameter("duration"));
    String university = request.getParameter("universityname");
    String program = request.getParameter("program");
    String level = request.getParameter("level");
    
    System.out.println("retreived the data from the form");
    
    Connection con;
    Statement st;
    ResultSet rs, rs1;
    
    int i=0,cid=0,count=0,flag=0;
    String sql="" , sql1 ="";
    
    try
    {
        System.out.println("in try block ");
        sql = "select *from dbo.temp_course_master;";
       
        rs = jc.retreiveData(sql);
        
        System.out.println("retreiving the coursemaster");
        while(rs.next())
            count+=1;
        
        System.out.println("checking count value");
        sql1 = "select *from dbo.course_master where coursename = '"+coursename+"';";
        
        rs1 = jc.retreiveData(sql1);
        
        System.out.println("retreiving coursename from main table");
        
        while(rs1.next())
        {
            flag = 1;
            out.println("existed");
            System.out.println("existed");
            
        }
        
        System.out.println("checking flag value :"+flag);
        
        if(flag == 0 && count==0)
        {
            System.out.println("inside if");
            sql = "select *from dbo.course_master;";

            rs = jc.retreiveData(sql);
            
            System.out.println("retreiving from coursemaster");
            
            while(rs.next())
            {
                cid = rs.getInt("courseid");
            }
            if(cid == 0)
            {
                cid = 1;
            }
            else
            {
                cid = cid+1;
            }
            System.out.println("retreiving courseid");

            sql = "insert into dbo.temp_course_master values("+cid+",'"+coursename+"','"+duration+"','"+university+"','"+program+"','"+level+"');";
            i = jc.insertData(sql);

            System.out.println("data inserted");
            
            if(i==1)
            {
                out.println("success");
                System.out.println("success");
            }
            else
            {
                out.println("failed");
                System.out.println("failed");
            }
        }
        else
        {
            out.println("One Course should be add");
        }
    }
    catch(Exception e)
    {
        out.println("The following error araised: "+e);
    }
    
%>