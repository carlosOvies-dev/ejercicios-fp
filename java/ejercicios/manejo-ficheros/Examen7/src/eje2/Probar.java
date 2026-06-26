package eje2;

public class Probar {
	public static void main(String[] args) {
		Libro l = new Libro("amanecer", "Lucas", "asb", 20, 12.5);
		Libro l2 = new Libro("ocaso", "Lucas", "asb", 20, 12.5);
		Libro l3 = new Libro("dia", "Lucas", "asb", 20, 12.5);
		l.guardarLibro();
		l2.guardarLibro();
		l3.guardarLibro();
		Libro.leer("dia");
	}
}
