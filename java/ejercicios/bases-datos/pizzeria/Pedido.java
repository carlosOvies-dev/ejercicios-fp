package pizzeria;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Pedido {
	private String telefono;
	private String nombre;
	private String direccion;
	private String cp;
	private String ciudad;
	private List<Pizza> lista;
	private double precioTotal;
	
	public Pedido(String nombre,String telefono,String direc,String cp,String ciudad) {
		this.nombre=nombre;
		this.telefono=telefono;
		this.direccion=direc;
		this.cp=cp;
		this.ciudad=ciudad;
		this.lista= new ArrayList<>();
		this.precioTotal=0;
	}
	
	public void guardar(Connection conn) throws SQLException {
		
		conn.setAutoCommit(false);
		try {
			Statement conectar = conn.createStatement();
			conectar.executeUpdate("INSERT INTO pedidos (telefonocliente,nombrecliente,lineadireccion,cp,ciudad,preciototal) values('"+telefono+"','"+nombre+"','"+direccion+"','"+cp+"','"+ciudad+"',"+precioTotal+")",Statement.RETURN_GENERATED_KEYS);
			ResultSet consulta = conectar.getGeneratedKeys();
			if(consulta.next()) {
				int idDelPedido = consulta.getInt(1);
				for(Pizza p : lista) {
					p.guardar(conn, idDelPedido);
				}
			}
			conn.commit();
		}catch(SQLException S) {
			conn.rollback();
		}finally{
			conn.setAutoCommit(true);
		}
		
	}
	
	
	public void añadirPizza(Pizza pi) {
		lista.add(pi);
		this.precioTotal+=pi.getPrecio()*pi.getNumUnidades();
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getCp() {
		return cp;
	}

	public void setCp(String cp) {
		this.cp = cp;
	}

	public String getCiudad() {
		return ciudad;
	}

	public void setCiudad(String ciudad) {
		this.ciudad = ciudad;
	}

	public List<Pizza> getLista() {
		return lista;
	}

	public void setLista(List<Pizza> lista) {
		this.lista = lista;
	}

	public double getPecioTotal() {
		return precioTotal;
	}

	public void setPecioTotal(double pecioTotal) {
		this.precioTotal = pecioTotal;
	}
	
	
}
