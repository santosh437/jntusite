/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.*;
import java.io.*;
import javax.servlet.http.*;


/**
 *
 * @author satish
 */
public class JdbcConnection 
{
    Connection con;
    Statement st;
    ResultSet rs;
    
    HttpServletRequest request;
    HttpServletResponse response;
    String sqll="";
    int i;
    
    public void getConnection()
    {
        try
        {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //System.out.println("Class loaded");
            
            con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;user=st;password=stud;database=student");
          //  System.out.println("Driverloaded");

            st = con.createStatement();
            //System.out.println("Statement created");
        }
        catch(Exception e)
        {
             System.out.println("The following Error araised: "+e);
        }
    }
    
    public int insertData(String sql) throws IOException
    {
        sqll = sql;
        //System.out.println("sql query is: "+sqll);
        //PrintWriter out = response.getWriter();
        try
        {
           // System.out.println("inside jdbc insert");
           // System.out.println("Connection is going to start");
            
            getConnection();
            i = st.executeUpdate(sqll);
           // System.out.println("Statement executed");
           // System.out.println("at database end insert"+i);
            return i;
        }
        catch(Exception e)
        {
            System.out.println("The following Error araised: "+e);
        }
        //System.out.println("Statement closed i="+i);
        return i;
        
    }
    
    public void truncateData(String sql) throws IOException
    {
        
        sqll = sql;
        //PrintWriter out = response.getWriter();
        try
        {
           // System.out.println("inside");
            //out.println("Connection is going to start");            
            getConnection();            
            st.executeUpdate(sqll);            
        }
        catch(Exception e)
        {
            System.out.println("The following Error araised: "+e);
        }    
    }
    
    public ResultSet retreiveData(String sql) throws IOException
    {
        sqll = sql;
        //PrintWriter out = response.getWriter();
        try
        {
            getConnection();
            
            rs = st.executeQuery(sqll);
            
           // System.out.println("at database end retrieve"+rs);            
        }
        catch(Exception e)
        {
            System.out.println("The following Error araised: "+e);
        }
        return rs;
    }
    
    public int updateData(String sql) throws IOException
    {
        sqll = sql;
        //PrintWriter out = response.getWriter();
        try
        {
            getConnection();
            
            i = st.executeUpdate(sqll);
            
           // System.out.println("at database end update"+i);

        }
        catch(Exception e)
        {
            System.out.println("The following Error araised: "+e);
        }        
        return i;    
    }
    
    public int DeleteData(String sql) throws IOException
    {
        sqll = sql;
        //PrintWriter out = response.getWriter();
        try
        {
            getConnection();
            
            i = st.executeUpdate(sqll);
            
           // System.out.println("at database end delete"+i); 

        }
        catch(Exception e)
        {
            System.out.println("The following Error araised: "+e);
        }
        return i;
    }
}