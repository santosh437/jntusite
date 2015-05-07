<%-- 
    Document   : getcourse
    Created on : 6 May, 2015, 4:33:26 PM
    Author     : SantoshKumar
--%>

<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.sql.*"%>
<%@page import="classes.JdbcConnection"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
//System.out.println("inside insertcoursedata file");  
JdbcConnection jc = new JdbcConnection();
//System.out.println("inside insertcoursedata file");
String sql1 = "select * from dbo.course_master;";                     
//String branchcode="";
ResultSet j = jc.retreiveData(sql1);
JSONObject obj;
JSONArray json = new JSONArray();
while (j.next())
{
    //System.out.println("Hello"+j.getString("coursename"));
    String coursename = j.getString(2);
    
    
    obj = new JSONObject();
    obj.put("co", coursename);
   
    json.add(obj);
   // System.out.println(obj.values());
 }
 
/*System.out.println("Keys stored"+json.size());
for(int i=0;i<json.size(); i++)
{
    System.out.println(json.get(i));
}
*/
out.println(json);


%>
