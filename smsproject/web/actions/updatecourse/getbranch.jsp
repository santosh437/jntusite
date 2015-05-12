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

String id = request.getParameter("id");
//System.out.println("inside updatecoursedata file"+id);
String sql1 = "select * from dbo.branch_master where courseid in (select courseid from dbo.course_master where coursename ='"+id+"');";
//String branchcode="";
ResultSet j = jc.retreiveData(sql1);
JSONObject obj;
JSONArray json = new JSONArray();
while (j.next())
{
    //System.out.println("Hello"+j.getString("branchcode"));
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
