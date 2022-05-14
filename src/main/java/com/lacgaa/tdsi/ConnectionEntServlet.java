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
@WebServlet(name = "ConnectionEntServlet", urlPatterns = {"/connection_ent"})
public class ConnectionEntServlet extends HttpServlet {

    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
            
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            String email = request.getParameter("email");
            String password = request.getParameter("mdp");
      	  	HttpSession session;
      	  	int idResto = auth_ent.testBD(email, password);
      	  	if(idResto != 0) {
      	  	 session=request.getSession();
             session.setAttribute("login",email);
             session.setAttribute("role", "business");
             session.setAttribute("idResto",idResto );

             response.sendRedirect("homeBusiness.jsp");

      	  	}
      	  	else {
                request.getRequestDispatcher("index.html").include(request, response); 
      	  	}     
     
    }
    
    
}
