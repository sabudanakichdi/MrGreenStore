/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import java.sql.*;

/**
 *
 * @author vj
 */
public  class DAOConnection {
static Connection con;
static String username = null;
static String password = null;

 
   public static Connection sqlconnection(){
       try{
           String dbUrl = "jdbc:mysql://localhost:5432/postgres";
           Class.forName("org.postgres.Driver").newInstance();
           con=DriverManager.getConnection(dbUrl,"postgres","root");              
           System.out.println("Connection established for SQL");
       }catch(Exception e){
           System.out.println("Database connection exception="+e);
       }
       return con;    
    
}    
    
}
