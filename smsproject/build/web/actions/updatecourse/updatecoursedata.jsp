<%-- 
    Document   : updatecoursedata
    Created on : 11 May, 2015, 4:06:37 PM
    Author     : satish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import='java.sql.*' %>
<%@page import='classes.JdbcConnection' %>
<%
    String id = request.getParameter("id");
    
    JdbcConnection jc = new JdbcConnection();
    
    String sql = "select * from dbo.course_master where coursename='"+id+"';";
    
    ResultSet rs = jc.retreiveData(sql);
%>