package metier;

import java.util.ArrayList;
import java.util.List;
import entities.paniers;

public class panierModel {

	private List<paniers> liste;

	public panierModel() {
		liste = new ArrayList<paniers>();
	}
	public List<paniers> getListe() {
		return liste;
		
	}

	public void setListe(List<paniers> liste) {
		this.liste = liste;
	}
}