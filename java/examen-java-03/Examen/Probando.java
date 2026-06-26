package Examen;

public class Probando {
	public static void main(String[] args) {
		Cabeza c = new Cabeza("rf",23.5,34.5,"ascd","1wds3",300,true);
		Viaje v = new Viaje();
		Viaje v1 =new Viaje();
		Viaje v2 = new Viaje();
		
		v.setAño(2023);
		v.setKmsRealizados(347);
		v1.setAño(2024);
		v2.setAño(2023);
		v2.setKmsRealizados(255);
		v.dia=3;
		c.crearViaje(v);
		c.crearViaje(v1);
		c.crearViaje(v2);
		System.out.println(c.numKms(2023));
		
	}
}
