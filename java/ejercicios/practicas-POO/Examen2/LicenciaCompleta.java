package Examen2;

public class LicenciaCompleta extends Producto{
	
	private double precio;

	public LicenciaCompleta(String nombre, String fecha, String descripcion, double precio) {
		super(nombre, fecha, descripcion);
		this.precio = precio;
	}

	@Override
	public void comprar(String comprador) {
		// TODO Auto-generated method stub
	
	}
}
