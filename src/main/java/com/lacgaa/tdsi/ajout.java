package com.lacgaa.tdsi;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ajout {
    private static Boolean done=false;
    
    public static boolean ajoutPanier(String titre,String desc, int id){
            Connection con = connectionBaseDeDonnees.connexionBase();
            String sql="INSERT INTO `panier`(`idResto`, `titre`, `description`) VALUES ("+id+",'"+titre+"','"+desc+"')";
            
        try {
            Statement st = con.createStatement();
            st.executeUpdate(sql);
            done = true;
                       
        } catch (SQLException ex) {
            Logger.getLogger(Authentification.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return done;
        }
    
        
    public static boolean validerPanier(String id){
        Connection con = connectionBaseDeDonnees.connexionBase();
        int idPanier = Integer.parseInt(id);
        String sql="UPDATE panier SET validated = 1 WHERE idPanier = "+idPanier+"";
        System.out.println(sql);
        
    try {
        Statement st = con.createStatement();
        st.executeUpdate(sql);
        done = true;
                   
    } catch (SQLException ex) {
        Logger.getLogger(Authentification.class.getName()).log(Level.SEVERE, null, ex);
    } 
    return done;
    }
            
            
    }
    

