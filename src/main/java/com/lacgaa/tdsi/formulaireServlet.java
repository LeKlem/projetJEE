/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacgaa.tdsi;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
@WebServlet(name = "formulaireServlet", urlPatterns = {"/formulaire"})
public class formulaireServlet extends HttpServlet {

    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String mdp = request.getParameter("mdp");
        //String cmdp = request.getParameter("cmdp");
        String tel = request.getParameter("tel");
        
        Connection conn = connectionBaseDeDonnees.connexionBase();
        
        String sql_2 = "SELECT user FROM authentification WHERE user='"+email+"'";
        String user = null;
         try {
             Statement st = conn.createStatement();
             ResultSet rs;
             rs=st.executeQuery(sql_2);
             
             while(rs.next()){
                 user = rs.getString("user");
                 
             }
             
             
             if(user == null){
                 String sql = "INSERT INTO subscribe(nom,prenom,email,pass,tel)VALUES('"+nom+"','"+prenom+"','"+email+
                        "','"+mdp+"','"+tel+"')";
                
                
                String sql_1 = "INSERT INTO authentification(user,password) VALUES('"+email+"','"+mdp+"')";
                
                st.executeUpdate(sql);
                st.executeUpdate(sql_1);
                
                response.sendRedirect("welcome.html");
             }else{
                 out.print("<HTML><BODY>");
                 out.print("<STRONG>Erreur !!! l'email "+email+" a été déjà utilisé </STRONG></BR> <a href='index.html'>"
                    + "Retourner à la page d'inscription</a>");
                 out.print("</BODY></HTML>");
                 
                 user=null;
             }
         } catch (SQLException ex) {
             ex.printStackTrace();
         }
         
        
        
      /*  
        
        if(!Inscription.Ajout(nom, prenom, email, mdp, tel)){
            out.print("<HTML><BODY>");
            out.print("<STRONG>Erreur !!! l'email "+email+" a été déjà utilisé </STRONG></BR> <a href='index.html'>"
                    + "Retourner à la page d'inscription</a>");
            out.print("</BODY></HTML>");
        }else{
            
           
           
            out.print("<HTML><BODY>");
            out.print("Bonjour M. "+prenom+" "+nom+"</BR>");
            out.print("Veuillez vous connecter avec vos identifiants <a href='index.html'>"
                    + "Retourner à la page de connexion</a>");
            out.print("</BODY></HTML>");
            
        }
            
       */     
         
          
           
        
        
        
    }

}
