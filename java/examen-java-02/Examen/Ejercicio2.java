package Examen;

public class Ejercicio2 {
	public static void main(String[] args) {
		contarLetras("casa");
		
	}
	public static void contarLetras( String palabra) {
		int[] contador = new int[26];
	//Iniciamos bucle para recorrer la palabra introducida	
		for(int i = 0; i<palabra.length();i++) {
	//Usamos un char para guardar cada letra de la plabra		
			char letra = palabra.charAt(i);
	//Comparamos el valor de la letra con el valor de la A a la Z que seria de 97 a 122		
			if(letra>='a' && letra<='z') {
	//Usamos un contador, la posicion del contador sera letra - 97 para comenzar en la posicion 0 // Ejemplo si tenemos letras = a seria 97-97= 0 y incrementaria la primera posicion del contador
	//incrementamos el valor del contador //Ejemplo si a se repite 3 veces el contador en la posicion 0 seria 3			
				contador[letra-'a']++;
			} 
		}
		int max = 0;
		int min = Integer.MAX_VALUE;// esto es una constante, la otra opcion seria int min = contador[0]
		char letramax= ' ';		
		char letramin= ' ';
	//Usamos un bucle para recorrer el contador creado anteriormente	
		for ( int z = 0; z<contador.length; z++) {
	//Si el numero dentro de contador en la posicion Z es mayor que max, pasara a ser max		
			if( contador[z] > max) {
				max= contador[z];
	/*A es el numero mas pequeño del codigo ASCII y es 97, entonces se le tiene que sumar a cualquier valor del indice Z ese 97 
	  para que quede dentro del rango del codigo ASCII*/
	 
	/*Ejemplo si fuese la letra B en el codigo es 98 pero en el indice de nuestro contador es 1, entonces tenemos que sumar los 97 + 1 
	 para que sea igual a 98 y tome la letra que equivale a ese numero dentro del ASCII	*/					
				letramax = (char)('a'+ z);			
			}
			if( contador[z]< min && contador[z]>0) {
				min= contador[z];
				letramin = (char)('a'+z);
			}
		}
		System.out.println("letras mas repetida "+ letramax +" letras menos repetida "+ letramin);
		System.out.println("letras mas repetida "+ max +" letras menos repetida "+ min);
	}
}
