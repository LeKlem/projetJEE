package metier;

import java.sql.SQLException;
import java.util.List;
import java.util.Vector;
import entities.paniers;
import dao.paniersDAO;

public class panierMetier {
	private paniersDAO dao;
	
    public List<paniers> lister()throws SQLException{
        return dao.findAll();
    }


    public void supprimer(int id) throws SQLException {
        dao.remove(id);
    }

    public Vector<paniers> recherche(String titre ) throws SQLException {
        return dao.findAllbyName(titre);
    }
}
