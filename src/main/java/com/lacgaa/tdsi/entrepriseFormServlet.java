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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author USER
 */
@WebServlet(name = "entrepriseFormServlet", urlPatterns = {"/entreprise"})
public class entrepriseFormServlet extends HttpServlet {

    
     @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String mdp = request.getParameter("mdp");
        //String cmdp = request.getParameter("cmdp");
        String adresse = request.getParameter("adresse");
        String siret = request.getParameter("siret");

        Connection conn = connectionBaseDeDonnees.connexionBase();
        
        String sql_2 = "SELECT * FROM restaurant WHERE email='"+email+"'";
        String user = null;
         try {
             Statement st = conn.createStatement();
             ResultSet rs;
             rs=st.executeQuery(sql_2);
             
             while(rs.next()){
                 user = rs.getString("mail");
             }
             
             if(user == null){
                 String sql = "INSERT INTO restaurant(nom, adresse, siret, email, mdp)VALUES('"+nom+"','"+adresse+"','"+siret+
                        "','"+email+"','"+mdp+"')";
                                
                st.executeUpdate(sql);                
                response.sendRedirect("homeBusiness.jsp");
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
    }

}
