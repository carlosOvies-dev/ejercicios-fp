import java.util.Scanner;

public class katia4 {
	public static void main(String[] args) {
		Scanner scanner = new Scanner (System.in);
		System.out.println(" Escribe la frase que quieres cambiar");
		String palabra = scanner.nextLine();
		String resultado =cambio(palabra);
		System.out.println ( "Esta es la frase cambiada: " + resultado);
	}
	public static String cambio( String frase) {
		char[] palabraCambiada = new char[frase.length()];
		int indice= 0;
		for( int i = frase.length() -1 ;  i>=0; i--) {
			palabraCambiada[indice] = frase.charAt(i);
			indice++;
		}
		return new String(palabraCambiada);
	}
}
