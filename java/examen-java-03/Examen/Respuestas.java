package Examen;

import Examen.Pregunta1.Calculadora;
import Examen.Pregunta1.Calculadora2;

public class Respuestas {
	public static void main(String[] args) {
		/* Ejemplo para un metodo  ESTATICO*/	
			int resultado = Calculadora.sumar(3, 7);/*Se permite usar sumar porque es estatico, si no lo fuese nos pediria crear un objeto calculadora*/
			
		/*Ejemplo para un metodo NO ESTATICO*/	
			Calculadora2 c = new Calculadora2();/*Tenemos que crear un objeto para poder acceder al metodo de la clase*/
			c.sumar(5, 5);
		}
}
