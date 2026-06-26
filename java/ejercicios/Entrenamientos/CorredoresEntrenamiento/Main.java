package CorredoresEntrenamiento;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class Main {
public static void main(String[] args) {
	Corredor c1 = new Corredor("Carlos", "123");
	Corredor c2 = new Corredor("Uxia", "123");
	Corredor c3 = new Corredor("Lolo", "123");
	
	Corredor[] corredores = {c1,c2,c3};
	c1.añadirEntrenamiento(new Entrenamiento(2000, 3, 1, 100, 60));
	c1.añadirEntrenamiento(new Entrenamiento(2000, 3, 1, 300, 60));
	c1.añadirEntrenamiento(new Entrenamiento(2001, 3, 1, 200, 60));
	
	c2.añadirEntrenamiento(new Entrenamiento(2000, 3, 1, 400, 60));
	c2.añadirEntrenamiento(new Entrenamiento(2000, 3, 1, 300, 60));
	c2.añadirEntrenamiento(new Entrenamiento(2001, 3, 1, 100, 60));
	
	c3.añadirEntrenamiento(new Entrenamiento(2000, 3, 1, 500, 60));
	c3.añadirEntrenamiento(new Entrenamiento(2000, 3, 1, 0, 60));
	c3.añadirEntrenamiento(new Entrenamiento(2001, 3, 1, 100, 60));
	System.out.println( c1.getEntrenamientos());
	c1.totalKilometros(2001);
	
	System.out.println(totalKilometrosNombreContiene(corredores,"Uxia"));
}

public static double totalKilometrosNombreContiene(Corredor[] corredores,String nombre) {
	Map<Integer, List<Entrenamiento>> aux= new TreeMap<>();
	double totalKilometros=0;
	for(Corredor c : corredores) { //recorremos el array
		if(c.getNombre().equals(nombre)) { //buscamos al corredor
			aux = c.getEntrenamientos();
		 for(List<Entrenamiento> e : aux.values()) {
			 for(Entrenamiento cadaAño : e) {
				 totalKilometros += cadaAño.getKilometros();
			 }
		 }
		}
	}
	return totalKilometros;
}
}
