/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author SantoshKumar
 */
package actions;
 
import java.sql.*;
 
public class DBConnection
{
     
    private static Connection con;
    private static DBConnection instance;
     
    private DBConnection()
    {
        try 
        {           
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");   
            con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;user=st;password=stud;database=student");         
        }
        catch(Exception e)
        {
            System.err.println(e.getMessage());
             
        }               
    }
     
      public static DBConnection getInstance()
      {
          if(instance == null)
          {
              instance = new DBConnection();
          }           
          return instance;           
      } 
}