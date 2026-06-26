package Examen;

public class Ejercicio1 {
	public static void main(String[] args) {
		cribaEratostenes(10);
	}
	public static void cribaEratostenes ( int dado) {
	//Creamos un array para los numeros, usando la longitud del nuemro dado	
		boolean[] numeros = new boolean[dado];
	//Recorremos el array marcando todos los numeros como primos, menos el 0 y el 1	
		for( int i = 2; i<numeros.length;i++) {
			numeros[i]= true;
		}
	//creamos 2 bucles para usar todos los numeros	
		for(int i = 2; i<numeros.length;i++) {
	// inicializamos con el cuadrado de i para descartar los multiplos		
			for( int j = i*i ; j<numeros.length; j++ ) {
	//Si los los cuadrados de los numeros recorridos, los dividimos entre los numeros, descartamos los multiplos			
			 if(j % i==0) {
				 numeros[j] = false;
			}
		}
		}
	//Recorremos el array para imprimir los numeros	
		for(int z = 0; z<numeros.length;z++) {
			if (numeros[z]== true) {
				System.out.println(z);
			}
		}
	}
}
