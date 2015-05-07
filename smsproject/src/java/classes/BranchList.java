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
public class BranchList
{
    public String branchcode;
    
    public String branchname;
    
    public String refer;
    
    public int no_of_seats;
    
    public String aicte_name;
    
    public BranchList(String branchcode, String branchname, String refer, int no_of_seats, String aicte_name)
    {
       this.branchcode = branchcode;
       
       this.branchname = branchname;
       
       this.refer = refer;
       
       this.no_of_seats = no_of_seats;
       
       this.aicte_name = aicte_name;      
    }
} 