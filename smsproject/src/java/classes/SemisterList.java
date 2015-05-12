/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

/**
 *
 * @author SantoshKumar
 */
public class SemisterList 
{
    public String year;
    
    public String semistername;
    
    public String semprintname;
    
    public String coursecompleted;
    
    public String annualexam;
    
    public SemisterList(String year, String semistername, String semprintname, String coursecompleted, String annualexam)
    {
        this.annualexam = annualexam;
        
        this.coursecompleted = coursecompleted;
        
        this.semistername = semistername;
        
        this.semprintname = semprintname;
        
        this.year = year;   
    }    
}
