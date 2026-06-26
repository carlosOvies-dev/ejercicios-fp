package CLaseMates;

public class Mates {
	private static int contador = 0;
	public static int suma(int a, int b) {
		contador++;
		return a + b;
	}
	public static int aleatorioDel1Al10() {
		return (int)(Math.random() * 10) +1;
	}
	public static int cuantasSumas() {
		return contador;
	}
}
