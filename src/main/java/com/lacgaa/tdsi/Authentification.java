/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacgaa.tdsi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author USER
 */
public class Authentification {
    private static boolean var=false;
    
    public static boolean testBD(String user,String passw){
            Connection con = connectionBaseDeDonnees.connexionBase();
            
            String sql="SELECT user,password FROM authentification WHERE user='"+user+"' AND password='"+passw+"'";
            
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            var = rs.next();
            
        } catch (SQLException ex) {
            Logger.getLogger(Authentification.class.getName()).log(Level.SEVERE, null, ex);
        } 
            
        
            return var;
        }
        
     
            
            
    }
    

