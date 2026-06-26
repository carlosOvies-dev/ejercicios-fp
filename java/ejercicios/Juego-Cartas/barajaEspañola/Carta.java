package barajaEspañola;

public class Carta {
	private String palo;
	private int numero;
	
	
	public Carta() {
		
	}
	public Carta(String palo,int numero) {
		this.palo=palo;
		this.numero=numero;
	}
	public String getPalo() {
		return palo;
	}
	public void setPalo(String palo) {
		this.palo = palo;
	}
	public int getNumero() {
		return numero;
	}
	public void setNumero(int numero) {
		this.numero = numero;
	}
	public String toString() {
		return  this.numero +" de " +this.palo ;
	}
	//hacer equals para comparar las cartas y poder saber cuales se han metido y cuales no
}
