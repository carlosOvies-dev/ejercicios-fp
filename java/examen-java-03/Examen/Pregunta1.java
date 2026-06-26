package Examen;

public class Pregunta1 {
	/*Control de acceso a una clase: enumera y explica las palabras reservadas que definen el
control de acceso a los miembros de una clase.*/
	
	/* Public:es un modificador de acceso que indica que una clase, método, o atributo es accesible desde cualquier otra clase*/
	/* Protect: permite acceso a la clase o subclase dentro del mismo paquete*/
	/*private*: restringe el acceso, solo se lo permite a la misma clase a la que pertenece*/
	
	/*Explica la diferencia entre método estáticos y métodos no estáticos. ¿Cómo se les denomina a
estos últimos? ¿Cuándo se debe crear un método estático? Pon ejemplos y ejemplos de llamadas a
métodos estáticos y métodos no estáticos.*/
	/*Los metodos estaticos pertenecen a la clase y no necesita instanciarse para utilizarse*/
	/*Ejemplos de metodos estaticos*/
	public class Calculadora{
		public static int sumar(int a,int b) {
			return a + b;
		}
	}
	
	/*Los metodos no estaticos son aquellos que dependen de una instancia de la clase para ser invocados*/
	public static class Calculadora2{ /*Pusismos static para que no diese error*/
		
		public Calculadora2() {
			
		}
		public int sumar (int a,int b) {
			return a+b;
		}
	}
	
	
}
