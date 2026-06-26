package LLuvia;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class Main {
public static void main(String[] args) {
	Precipitacion p1 = new Precipitacion(2000, 7, 3, 220);
	Precipitacion p2 = new Precipitacion(2000, 7, 3, 320);
	Precipitacion p3 = new Precipitacion(2001, 7, 3, 420);
	
	Ciudad c1 = new Ciudad("Coruña", "123");
	Ciudad c2 = new Ciudad("La Coruña", "123");
	Ciudad c3 = new Ciudad("Ferrol", "123");
	
	c1.añadirPRecipitacion(p1);
	c1.añadirPRecipitacion(p2);
	c1.añadirPRecipitacion(p3);
	
	c2.añadirPRecipitacion(p3);
	c2.añadirPRecipitacion(p2);
	c2.añadirPRecipitacion(p3);
	
	c3.añadirPRecipitacion(p1);
	c3.añadirPRecipitacion(p2);
	c3.añadirPRecipitacion(p3);
	
	c1.totalPrecipitaciones(2004);
	
	Ciudad[] ciudades = {c1,c2,c3};
	
	totalPecipitacionesNombreComo(ciudades,"Casa");
}
	public static void totalPecipitacionesNombreComo(Ciudad[] ciudades,String cadena) {
		Map<String,Integer> lluviaCadaCiudad = new TreeMap<>();
		boolean encontrado= false;
		for(Ciudad c : ciudades) {
			if(c.getNombre().contains(cadena)) {
				encontrado=true;
				int totalmm2=0;
				for(List<Precipitacion> todasLasLluvias : c.getPrecipitaciones().values()) {
					for(Precipitacion lluviaPorDia : todasLasLluvias) {
						totalmm2 += lluviaPorDia.getMm2();
					}
				}
				lluviaCadaCiudad.put(c.getNombre(), totalmm2);
			}
			
		}
		if(encontrado) {
		System.out.println(lluviaCadaCiudad);
		}else {
			System.out.println("No se encontraron ciudades que contengan "+cadena);
		}
	}	
}
