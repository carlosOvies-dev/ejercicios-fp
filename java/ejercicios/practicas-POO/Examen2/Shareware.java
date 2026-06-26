package Examen2;

public class Shareware extends Producto{

	private int dias;
	public Shareware(String nombre, String fecha, String descripcion,int dias) {
		super(nombre, fecha, descripcion);
		this.dias=dias;
	}

	public int getDias() {
		return dias;
	}

	public void setDias(int dias) {
		this.dias = dias;
	}

	@Override
	public void comprar(String comprador) {
		Licencia l1 = new Licencia(comprador,dias);
		setLicencia(l1);
		
	}

}
