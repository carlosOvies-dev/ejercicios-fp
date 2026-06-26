package CLaseMates;

import java.awt.Color;

public class Cuentas {
	public static void main(String[] args) {
		Mates.suma(8, 9);
		Mates.suma(8, 9);
		Mates.suma(8, 9);
		Mates.suma(8, 9);
		Mates.suma(8, 9);
		Mates.suma(8, 9);
		Mates.suma(8, 9);
		System.out.println(Mates.aleatorioDel1Al10());
		System.out.println(Mates.cuantasSumas());
		Triangulo t1 = new Triangulo(2.0f,3.5f,4.2f,Color.BLUE);
		Triangulo t2 = new Triangulo();
		System.out.println(t1.calcularArea());
		System.out.println(Triangulo.calcularArea(2.35f, 6.7f, 4.5f));
	}
}
