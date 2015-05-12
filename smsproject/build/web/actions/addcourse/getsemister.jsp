<%-- 
    Document   : getbranchdata.jsp
    Created on : 4 May, 2015, 10:03:46 PM
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
String sql1 = "select * from dbo.temp_semester_master;";                     
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
