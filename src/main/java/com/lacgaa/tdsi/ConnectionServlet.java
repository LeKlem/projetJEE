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
@WebServlet(name = "ConnectionServlet", urlPatterns = {"/connection"})
public class ConnectionServlet extends HttpServlet {

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            String email = request.getParameter("email");
            String password = request.getParameter("mdp");
            HttpSession session;
          
            String connectedAs = Authentification.testBD(email, password);
            switch(connectedAs){
                case("user"):
                      session=request.getSession();  
                      session.setAttribute("login",email);
                      session.setAttribute("role", "user");
                      session.setAttribute("idUser", Authentification.getIDfromUser(email));
                      response.sendRedirect("listPanier.jsp");

                   //   request.getRequestDispatcher("listPanier.jsp").include(request, response); 
                      break;
                case(" "):
                    //response.sendRedirect("index.html");
                    request.getRequestDispatcher("index.html").include(request, response); 
                break;
                case("admin"):
                    session=request.getSession();  
                    session.setAttribute("login",email);
                    session.setAttribute("idUser", Authentification.getIDfromUser(email));

                    session.setAttribute("role","admin");

                    response.sendRedirect("admin.jsp");
                    break;
                
            }
            
            
            
      
      
      
    }
    
    
}
