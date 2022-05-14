package entities;

public class paniers {

	private int idPaniers;
	private int idResto;
	private String titre;
	private String description;
	private String lienImage;
	private int acheterPar;
	
	public paniers() {
	}

	public paniers(String titre, String description, String lienImage, int acheterPar) {
		this.titre = titre;
		this.description = description;
		this.lienImage = lienImage;
		this.acheterPar = acheterPar;
	}
	
	public paniers(int idPaniers, int idResto, String titre, String description, String lienImage, int acheterPar) {
		this.idPaniers = idPaniers;
		this.idResto = idResto;
		this.titre = titre;
		this.description = description;
		this.lienImage = lienImage;
		this.acheterPar = acheterPar;
	}
	public String getTitre() {
		return titre;
	}

	public void setTitre(String titre) {
		this.titre = titre;
	}

	public int getIdPaniers() {
		return idPaniers;
	}

	public void setIdPaniers(int idPaniers) {
		this.idPaniers = idPaniers;
	}

	public int getIdResto() {
		return idResto;
	}

	public void setIdResto(int idResto) {
		this.idResto = idResto;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLienImage() {
		return lienImage;
	}

	public void setLienImage(String lienImage) {
		this.lienImage = lienImage;
	}

	public int getAcheterPar() {
		return acheterPar;
	}

	public void setAcheterPar(int acheterPar) {
		this.acheterPar = acheterPar;
	}
	
	
}
