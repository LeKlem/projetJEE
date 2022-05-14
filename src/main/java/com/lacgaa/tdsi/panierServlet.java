/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacgaa.tdsi;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
@WebServlet(name = "panierServlet", urlPatterns = {"/ajout-panier"})
public class panierServlet extends HttpServlet {

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
  	  		HttpSession session = request.getSession();
  	  		int idResto = (int) session.getAttribute("idResto");
            String titre = request.getParameter("nom");
            String desc = request.getParameter("desc");
      	  
      	  	if(ajout.ajoutPanier(titre, desc, idResto)) {
             response.sendRedirect("homeBusiness.jsp?success");

      	  	}
      	  	else {
                request.getRequestDispatcher("homeBusiness.jsp").include(request, response); 
      	  	}     
     
    }
    
    
}
