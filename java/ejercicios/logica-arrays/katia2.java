import java.util.Scanner;

public class katia2 {
	public static void main(String [] args) {
		Scanner scanner = new Scanner (System.in);
		System.out.println("Cuantos lanzamientos quieres hacer?");
		int veces = scanner.nextInt();
		moneda(veces);
		
	}
	public static void moneda(int veces) {
		int cara= 0;
		int cruz= 0;
		for( int i = 0; i<veces; i++) {
			float random = ((float)Math.random()); //0-0,9
			//int numeroAleatorio2 = (Math.random() < 0.5) ? 0 : 1; // ? se llama operador ternario
			if( random  <0.5 ) {
				cara++;
			}
			else{
				cruz++;
			} System.out.println(random);
		}
		System.out.println(  cara + "caras y " + cruz + "cruces");
	}
}
