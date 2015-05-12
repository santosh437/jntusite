<%-- 
    Document   : gettablebranch
    Created on : 9 May, 2015, 12:04:32 PM
    Author     : SantoshKumar
--%>

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

String sql_branch = "select * from dbo.branch_master where courseid in (select courseid from dbo.course_master where coursename ='"+coursename+"');";
//String sql_branch = "select * from dbo.branch_master;";

//System.out.println("sql :"+sql_branch);
//String sql1 = "select * from dbo.branch_master;";
//String branchcode="";
ResultSet j = jc.retreiveData(sql_branch);
JSONObject obj;
JSONArray json = new JSONArray();
while (j.next())
{
    String branchcode = j.getString(2);
    String branchname = j.getString(3);
    String refer = j.getString(4);
    int seats = j.getInt(5);
    String aictename = j.getString(6);
    
    obj = new JSONObject();
    obj.put("bc", branchcode);
    obj.put("bn", branchname);
    obj.put("re", refer);
    obj.put("se", seats);
    obj.put("ai", aictename);
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

