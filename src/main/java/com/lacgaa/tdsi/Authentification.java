package com.lacgaa.tdsi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Authentification {
    private static String str=" ";
    private static int id;
    
    public static String testBD(String user,String passw){
            Connection con = connectionBaseDeDonnees.connexionBase();
            
            String sql="SELECT * FROM authentification WHERE user='"+user+"' AND password='"+passw+"'";
            
        try {
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            rs.next();
            if(rs == null) {
            	System.out.println("erreur : résultat nul");
            	return str;
            }
            str = rs.getString(4);
            System.out.println(str);
            
        } catch (SQLException ex) {
            Logger.getLogger(Authentification.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return str;
        }
     
public static int getIDfromUser(String user){
    Connection con = connectionBaseDeDonnees.connexionBase();
    
    String sql="SELECT * FROM authentification WHERE user='"+user+"'";
    
try {
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(sql);
    rs.next();
    id = rs.getInt("idAuth");
    System.out.println(id);

    
} catch (SQLException ex) {
    Logger.getLogger(Authentification.class.getName()).log(Level.SEVERE, null, ex);
}
return id; 

}


    
    
}

