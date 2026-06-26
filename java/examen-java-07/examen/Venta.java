package examen;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Venta {
	private String codigo;
	private Date fecha;
	private String producto;
	private int cantidad;
	private double precioUnitario;
	private static int contadorVentas=0;
	
	
	public Venta(String codi,Date fecha,String pro,int cant,double prec) {
		this.codigo=codi;
		this.fecha= fecha;
		this.producto=pro;
		this.cantidad=cant;
		this.precioUnitario=prec;
	}
	
	public void registrarVenta() {
		
		try(DataOutputStream herramienta = new DataOutputStream(new FileOutputStream("ventas.dat",true))){
			
			herramienta.writeUTF(codigo);
			herramienta.writeLong(fecha.getTime());
			herramienta.writeUTF(producto);
			herramienta.writeInt(cantidad);
			herramienta.writeDouble(precioUnitario);
			
			contadorVentas++;
		}catch(IOException i){
			
		}
	}
	
	public static List<Venta> listarVentas(){
		List<Venta> ventas = new ArrayList<>();
		int cont=0;
		try (DataInputStream herramienta = new DataInputStream(new FileInputStream("ventas.dat"))){
			
			while(cont<contadorVentas) {
			String codigo =herramienta.readUTF();
			Long fecha= herramienta.readLong();
			Date f = new Date(fecha);
			String productos = herramienta.readUTF();
			int cantidad = herramienta.readInt();
			double precioUnitario = herramienta.readDouble();
			
			ventas.add(new Venta(codigo, f, productos, cantidad, precioUnitario));
			
			cont++;
			}
			
		}catch(IOException i) {
			
		}
		return ventas;
	}
	
	
	
	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public Date getFecha() {
		return fecha;
	}

	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}

	public String getProducto() {
		return producto;
	}

	public void setProducto(String producto) {
		this.producto = producto;
	}

	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public double getPrecioUnitario() {
		return precioUnitario;
	}

	public void setPrecioUnitario(double precioUnitario) {
		this.precioUnitario = precioUnitario;
	}

	@Override
	public String toString() {
		return "Venta [codigo=" + codigo + ", fecha=" + fecha + ", producto=" + producto + ", cantidad=" + cantidad
				+ ", precioUnitario=" + precioUnitario + "]";
	}
	
	
}
