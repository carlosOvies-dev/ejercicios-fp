package barajaEspañola;

public class Probar {
	public static void main(String[] args) {
		Baraja española = new Baraja();
		
		System.out.println(española);
		System.out.println(española.size());
		española.mezclar3();
		System.out.println(española);
	}
}
