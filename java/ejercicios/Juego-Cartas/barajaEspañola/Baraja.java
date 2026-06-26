package barajaEspañola;

import java.util.ArrayList;

public class Baraja {
	private ArrayList<Carta> cartas;

	public Baraja() {
		this.cartas = new ArrayList<>();
		cartas.addAll(crearPalo("oros"));
		cartas.addAll(crearPalo("espadas"));
		cartas.addAll(crearPalo("bastos"));
		cartas.addAll(crearPalo("copas"));
	}
	
	public ArrayList<Carta> crearPalo(String palo){
		ArrayList<Carta> coleccion= new ArrayList<>();
		for(int i = 1;i<8;i++) {
			Carta carta = new Carta(palo,i);
			coleccion.add(carta);
		}
		for(int i = 10;i<13;i++) {
			Carta carta = new Carta(palo,i);
			coleccion.add(carta);
		}
		return coleccion;
		
	}
	//no funciona
	public ArrayList<Carta> mezclar(ArrayList<Carta> baraja){
		//Para mezclar cartas
		ArrayList<Carta> mezclador = new ArrayList<>();
	
		for(int i =0;i<baraja.size();i++) {
			//indice aleatorio para que se mezclen al guardarlas
			int indiceAleatorio = (int)(Math.random() * baraja.size());
				mezclador.add(baraja.get(indiceAleatorio));
				baraja.remove(indiceAleatorio);
		}
		return mezclador;
	}

		
		
      
	
	public void mezclar3() {
		ArrayList<Carta> mezclador = new ArrayList<>();
		ArrayList<Carta> baraja = new ArrayList<>(this.cartas);
		Carta comodin;
		int indice=0;
		for(int i=0;i<=this.cartas.size();i++) {
			indice = (int)(Math.random() * 40);
			comodin=baraja.get(indice);
			
		
			mezclador.add(comodin);
			baraja.remove(indice);
			
		
		}
	}
	
	//imprimir las cartas de baraja
	public String toString() {
		return cartas.toString();
	}
	//coger los palos 
	public ArrayList<Carta> getCartas() {
		return cartas;
	}

	public int size() {
		return this.cartas.size();
		
	}
}
