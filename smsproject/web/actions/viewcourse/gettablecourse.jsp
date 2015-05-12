<%-- 
    Document   : gettabledata
    Created on : 9 May, 2015, 11:26:06 AM
    Author     : SantoshKumar
--%>

<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="classes.JdbcConnection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//System.out.println("inside insertcoursedata file");  
String coursename = request.getParameter("id");
//System.out.println("Course name :"+coursename);
JdbcConnection jc = new JdbcConnection();
//System.out.println("inside insertcoursedata file");

String sql_course = "select * from dbo.course_master where coursename = '"+coursename+"' ;";
//String sql_branch = "select * from dbo.branch_master;";

//System.out.println("sql :"+sql_course);
//String sql1 = "select * from dbo.branch_master;";
//String branchcode="";
ResultSet j = jc.retreiveData(sql_course);
JSONObject obj;
JSONArray json = new JSONArray();
while (j.next())
{
    //System.out.println("Hello"+j.getString("branchcode"));
   int courseid = j.getInt(1);
    String coursename1 = j.getString(2);
    int duration = j.getInt(3);
    String universityname = j.getString(4);
    String program = j.getString(5);
    String level = j.getString(6);
    
    
    obj = new JSONObject();
    obj.put("ci", courseid);
    obj.put("co", coursename1);
    obj.put("du", duration);
    obj.put("un", universityname);
    obj.put("pr", program);
    obj.put("le", level);
    json.add(obj);
    //System.out.println(obj.values());
 }
 
/*System.out.println("Keys stored"+json.size());
for(int i=0;i<json.size(); i++)
{
    System.out.println(json.get(i));
}
*/
out.println(json);


%>

