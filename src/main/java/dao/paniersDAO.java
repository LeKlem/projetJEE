package dao;

import entities.paniers;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;

import com.lacgaa.tdsi.connectionBaseDeDonnees;

public class paniersDAO
{

	Connection conn = connectionBaseDeDonnees.connexionBase();
	
   public boolean add(paniers a)
    {
        try
        {
            String req = "INSERT INTO panier(`idPanier`, `idResto`, `titre`, `description`, `lienImage`)"
                    + " VALUES (NULL , '" + a.getIdResto() + "', '" + a.getTitre() + "', '" + a.getDescription() + "', '" + a.getLienImage() + "');";

            Statement st = conn.createStatement();

            int rs = st.executeUpdate(req);

            if (rs > 0)
            {
                return true;
            }

        } catch (Exception e1)
        {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        return false;
    }

    public boolean remove(int idPanier)
    {
        try
        {
            String req = "DELETE FROM panier " + "WHERE idPanier = " + idPanier;

            Statement st = conn.createStatement();

            int rs = st.executeUpdate(req);

            if (rs > 0)
            {
                return true;
            }

        } catch (Exception e1)
        {
            e1.printStackTrace();
        }

        return false;
    }

    public boolean update(paniers a)
    {
        try
        {
            String req = "UPDATE `projet_app_ent`.`panier` "
                    + "SET `idResto`='" + a.getIdResto() + "', "
                    + "`titre`='" + a.getTitre() + "', "
                    + "`description`='" + a.getDescription() + "', "
                    + "`lienImage`='" + a.getLienImage() + "', "
                    + "`idAcheteur`='" + a.getAcheterPar() + "' "
                    + "WHERE `idPanier`='" + a.getIdPaniers() + "';";

            Statement st = conn.createStatement();

            int rs = st.executeUpdate(req);

            if (rs > 0)
            {
                return true;
            }

        } catch (Exception e1)
        {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }

        return false;
    }

	
    public paniers findByPaName(String titre)
    {
        String req = "SELECT* " + " FROM panier " + " WHERE titre = " + titre;

        try
        {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(req);

            paniers e = null;

            if (rs.next())
            {
                e = new paniers(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6));
            }
            return e;

        } catch (Exception e)
        {
            e.printStackTrace();
        }

        return null;
    }

    public Vector<paniers> findAll()
    {
        String req = "SELECT * " + " FROM panier ";

        Vector<paniers> vect = null;

        try
        {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(req);

            while (rs.next())
            {

                if (vect == null)
                {
                    vect = new Vector<>();
                }

                paniers e = new paniers(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6));

                vect.add(e);
            }

            return vect;
        } catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }

    
    public Vector<paniers> findAllbyName(String key)
    {
        String req = "SELECT * " + " FROM panier WHERE titre like '%"+key+"%'";

        Vector<paniers> vect = null;

        try
        {
            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery(req);

            while (rs.next())
            {

                if (vect == null)
                {
                    vect = new Vector<>();
                }

                paniers e = new paniers(rs.getInt(1), rs.getInt(2), rs.getString(3),
                        rs.getString(4), rs.getString(5), rs.getInt(6));

                vect.add(e);
            }

            return vect;
        } catch (Exception e)
        {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }


}
