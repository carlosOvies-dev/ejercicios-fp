import java.util.Scanner;

public class katia3 {
	public static void main(String[] args) {
		char[] vocales = {'a','e','i','o','u'};
		Scanner scanner = new Scanner (System.in);
		System.out.println("Escribe una palabra");
		String palabra = scanner.nextLine(); 
		 contador(vocales, palabra);
		
	}
	public static void contador ( char[] letras, String palabra) {
		int numeroVocales = 0;
		int numeroConsonantes = 0;
	
		for(int i = 0; i<palabra.length() ; i++) {			
			char letraActual= palabra.charAt(i);
			boolean esVocal = false;
			for(int j = 0; j<letras.length; j++) {
				if (letraActual==letras[j]) {
					esVocal = true;
					break;	
			}	
			}
			if(esVocal==true) {
				numeroVocales++;
			}else {
				numeroConsonantes++;
			}
		}
		System.out.println("Estas con las vocales: " + numeroVocales + " Estas son las consonantes: " + numeroConsonantes);
	}
}
