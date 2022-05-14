package com.lacgaa.tdsi;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.List;
import java.util.Date;
import com.lacgaa.tdsi.connectionBaseDeDonnees;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entities.paniers;
import metier.panierMetier;
import metier.panierModel;
import java.sql.Connection;
/**
 * Servlet implementation class listServlet
 */
@WebServlet(name = "listServlet", urlPatterns = {"/list"})
public class listServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private panierMetier metier;
    public listServlet() {
  }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub

        //appel couche metier
        
        
        
        //traitement de suppression
        
        String action = request.getParameter("action");
        
        try {
            if(action!=null) {
            
                switch (action) {
                
                case "list":
                {
                    lister(request, response);
                    break;
                }
                
               /* case "delete":
                {
                    delete(request, response);
                    break;
                }*/
                
                default:
                {
                    lister(request,response);
                    break;
                }
                }
            }
            else {
                lister(request,response);
            }
        }catch(Exception e) {
        	
        }
        
    }

	 //Il faut récupérer l'id du User pour le mettre a la suite de la formule l.87
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String valide = request.getParameter("valide");
		HttpSession session = request.getSession();
		if(valide!= null) {
			try {
				Connection con = connectionBaseDeDonnees.connexionBase();
				Statement statement = con.createStatement();
				
				Object e = session.getAttribute("idAuth");
				String c = e.toString();
				String sql ="UPDATE panier SET idAcheteur = " + c; 
				String panier = null;
				statement.executeUpdate(sql);

				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	private void lister(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
        List<paniers> liste = metier.lister();
        
        //stcoker le resultat dans model
        
        panierModel model = new panierModel();
        model.setListe(liste);
        request.setAttribute("model", model);
        
        //redirection vers la vue jsp
        request.getRequestDispatcher("listPanier.jsp").forward(request, response);
                
    }

}
