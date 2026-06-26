package examen;

import java.io.File;
import java.util.Date;

public class Main2 {
	public static void main(String[] args) {
		Conexion c = new Conexion("1.2.3.4", "carlos", "abc123.");
		File fichero = new File("mijson.json");
		c.guardarConfiguracion(fichero);
		
		Conexion leida =Conexion.cargarConfiguracion(fichero);
		
		System.out.println(leida);
		
		//EJERCICIO DE VENTAS
		
		Venta a = new Venta("1234", new Date(),"patatas", 10, 3.75);
		Venta b = new Venta("0987", new Date(),"toma", 8, 3);
		Venta f = new Venta("34565", new Date(),"huev", 5, 2);
		Venta d = new Venta("09384", new Date(),"maiz", 3, 14);
		Venta e = new Venta("2347", new Date(),"carne", 30, 12);
		
		a.registrarVenta();
		b.registrarVenta();
		d.registrarVenta();
		e.registrarVenta();
		f.registrarVenta();
		
		System.out.println(Venta.listarVentas());
		
	}
}
