package CorredoresEntrenamiento;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class Corredor {
	private String nombre;
	private String dni;
	private Map<Integer,List<Entrenamiento>> entrenamientos;
	
	public Corredor(String nombre,String dni) {
		this.nombre=nombre;
		this.dni=dni;
		this.entrenamientos= new TreeMap<>();
	}
	
	public void añadirEntrenamiento(Entrenamiento e) {
		int año = e.getFecha().getYear();
		
		if(!this.entrenamientos.containsKey(año)) {//compruebo si el año ya existe
			this.entrenamientos.put(año, new ArrayList<>());//no existe lo añadimos y nueva lista
			this.entrenamientos.get(año).add(e);//añadimos el entrenamiento a ese año
		}else {
			this.entrenamientos.get(año).add(e);//si existe el año añadimos el entrenamiento
		}
	}
	
	public void totalKilometros(int año) {
		double totalKilometros=0;
		if(!this.entrenamientos.containsKey(año)) {
			System.out.println("Ese año no tiene entrenamientos");
			return;
		}
		
	//creo una lista para guardar todos los entrenamientos de ese año	
		List<Entrenamiento> aux = this.entrenamientos.get(año);
	//vamos a ir cogiendo cada entrenamiento para coger los km	
		for(Entrenamiento e : aux) {
			totalKilometros += e.getKilometros();
		}
		System.out.println( totalKilometros);
	}
		
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDni() {
		return dni;
	}

	public void setDni(String dni) {
		this.dni = dni;
	}

	public Map<Integer, List<Entrenamiento>> getEntrenamientos() {
		return entrenamientos;
	}

	public void setEntrenamientos(Map<Integer, List<Entrenamiento>> entrenamientos) {
		this.entrenamientos = entrenamientos;
	}

	@Override
	public String toString() {
		return "Corredor [nombre=" + nombre + ", dni=" + dni + ", entrenamientos=" + entrenamientos + "]";
	}
	
	
	
}
