package Examen2;

public class Suscripcion extends Producto{

	private double precio;
	private int dias;
	public Suscripcion(String nombre, String fecha, String descripcion) {
		super(nombre, fecha, descripcion);
		// TODO Auto-generated constructor stub
	}

	@Override
	public void comprar(String comprador) {
		Licencia l1 = new Licencia(comprador,dias);
		setLicencia(l1);
	}

}
