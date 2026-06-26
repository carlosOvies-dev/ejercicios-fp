package Examen2;

abstract class Producto {
	private String nombre;
	private String fecha;
	private String descripcion;
	private Licencia licencia;
	
	public Producto(String nombre,String fecha,String descripcion) {
		this.descripcion=descripcion;
		this.fecha=fecha;
		this.licencia=null;
		this.nombre=nombre;
		
	}
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getFecha() {
		return fecha;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Licencia getLicencia() {
		return licencia;
	}

	public void setLicencia(Licencia licencia) {
		this.licencia = licencia;
	}

	public abstract void comprar(String comprador);
	
}
