<%-- 
    Document   : getsemester
    Created on : 12 May, 2015, 4:00:10 PM
    Author     : SantoshKumar
--%>

<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="classes.JdbcConnection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//System.out.println("inside insertcoursedata file");  
String id = request.getParameter("id");
JdbcConnection jc = new JdbcConnection();
//System.out.println("inside insertcoursedata file");
String sql1 = "select * from dbo.semester_master where courseid in(select courseid from dbo.course_master where coursename='"+id+"');;";                     
//String branchcode="";
ResultSet j = jc.retreiveData(sql1);
JSONObject obj;
JSONArray json = new JSONArray();
while (j.next())
{
   // System.out.println("Hello"+j.getString("year"));
    String year = j.getString(2);
    String semname = j.getString(3);
    String sem_print = j.getString(4);
    String complete = j.getString(5);
    String annual = j.getString(6);
    
    obj = new JSONObject();
    obj.put("ye", year);
    obj.put("se", semname);
    obj.put("sm", sem_print);
    obj.put("co", complete);
    obj.put("an", annual);
    json.add(obj);
   // System.out.println(obj.values());
 }
 
//System.out.println("Keys stored"+json.size());
/*for(int i=0;i<json.size(); i++)
{
    System.out.println(json.get(i));
}
*/
out.println(json);


%>

