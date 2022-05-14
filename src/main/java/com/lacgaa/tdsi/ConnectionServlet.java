/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lacgaa.tdsi;

import java.io.IOException;
import java.io.PrintWriter;

import javax.ejb.Singleton;
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
@WebServlet(name = "ConnectionServlet", urlPatterns = {"/connection"})
public class ConnectionServlet extends HttpServlet {

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            String email = request.getParameter("email");
            String password = request.getParameter("mdp");
            
            if(!Authentification.testBD(email, password)){
                //response.sendRedirect("index.html");
            	
                request.getRequestDispatcher("index.html").include(request, response); 
            }else{
                HttpSession session=request.getSession();  
                session.setAttribute("login",email);
                
                response.sendRedirect("listPanier.jsp");
                
                
            }
            
            
            
            
      
      
      
    }
    
    
}
