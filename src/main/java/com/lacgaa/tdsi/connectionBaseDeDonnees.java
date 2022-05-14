/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacgaa.tdsi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author USER
 */
public class connectionBaseDeDonnees {
    static Connection connexion = null;
    
    public static Connection connexionBase(){
            String url = "jdbc:mysql://localhost:3306/java";
            String login = "root";
            String pass  = "";
            String driver = "com.mysql.jdbc.Driver";
            
        try {
            Class.forName(driver);
            connexion = DriverManager.getConnection(url,login,pass);
            
        } catch (ClassNotFoundException | SQLException | NullPointerException ex) {
            ex.printStackTrace();
        }
            
            return connexion;
    }
}
