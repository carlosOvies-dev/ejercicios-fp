package LLuvia;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class Ciudad {
	private String nombre;
	private String coordenadas;
	private Map<Integer,List<Precipitacion>> precipitaciones;
	
	public Ciudad(String nombre,String coordenadas) {
		this.nombre=nombre;
		this.coordenadas=coordenadas;
		this.precipitaciones= new TreeMap<>();
		
	}
	public void añadirPRecipitacion(Precipitacion p) {
		int año = p.getFecha().getYear();
		if(!this.precipitaciones.containsKey(año)) {
			this.precipitaciones.put(año, new ArrayList<Precipitacion>());
			this.precipitaciones.get(año).add(p);
			return;
		}
		this.precipitaciones.get(año).add(p);
	}
	public void totalPrecipitaciones(int año) {
		int totalmm2=0;
		if(!this.precipitaciones.containsKey(año)) {
			System.out.println("Ese año no esta registrado");
			return;
		}
		List<Precipitacion> aux = this.precipitaciones.get(año);
		for(Precipitacion p : aux) {
			totalmm2 += p.getMm2();
		}
		System.out.println(totalmm2);
	}
	
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getCoordenadas() {
		return coordenadas;
	}

	public void setCoordenadas(String coordenadas) {
		this.coordenadas = coordenadas;
	}

	public Map<Integer, List<Precipitacion>> getPrecipitaciones() {
		return precipitaciones;
	}

	public void setPrecipitaciones(Map<Integer, List<Precipitacion>> precipitaciones) {
		this.precipitaciones = precipitaciones;
	}

	@Override
	public String toString() {
		return "Ciudad [nombre=" + nombre + ", coordenadas=" + coordenadas + ", precipitaciones=" + precipitaciones
				+ "]";
	}
	
}
