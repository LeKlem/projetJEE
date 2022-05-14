package com.lacgaa.tdsi;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class auth_ent {
    private static int idResto;
    
    public static int testBD(String mail,String passw){
            Connection con = connectionBaseDeDonnees.connexionBase();
            
            String sql="SELECT * FROM restaurant WHERE email='"+mail+"' AND mdp='"+passw+"'";
            
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            idResto = rs.getInt("idResto");                       
        } catch (SQLException ex) {
            Logger.getLogger(Authentification.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return idResto;
        }
        
     
            
            
    }
    

