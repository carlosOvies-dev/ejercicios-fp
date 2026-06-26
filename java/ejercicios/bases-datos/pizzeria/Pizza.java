package pizzeria;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Pizza {
	private int numPizza;
	private int idTipoPizza;
	private int numUnidades;
	private List<String> ingredientes;
	private int idPedidoPizza;
	private double precio;
	
	public Pizza(int numPizza, int idTipoPizza, int unidades,Connection conexion) throws PizzaDesconocidaException, SQLException {
		 if(!validar(conexion,idTipoPizza)) {
			 throw new PizzaDesconocidaException();
		 }
		this.idTipoPizza=idTipoPizza;
		this.numPizza=numPizza;
		this.numUnidades=unidades;
		if(idTipoPizza==9) {
			this.precio= 12;
		this.ingredientes= new ArrayList<>();
		}else {
			
		this.precio= precioUnidad(conexion,idTipoPizza);
		}
	}
	
	
	public boolean validar(Connection con, int idTipoPizza) throws SQLException {
		Statement consulta = con.createStatement();
		ResultSet resultado = consulta.executeQuery("SELECT id FROM tipopizza WHERE idTipoPizza ="+idTipoPizza);
		return resultado.next();
	}
	
	public double precioUnidad(Connection con, int idTipoPizza) throws SQLException {
		Statement consulta = con.createStatement();
		ResultSet resultado = consulta.executeQuery("SELECT precio FROM tipopizza WHERE idTipoPizza ="+idTipoPizza);
		if(resultado.next()) {
			return resultado.getDouble("precio");	
		}else {
		throw new SQLException("No se encontro la pizza");	
		}
		
	}
	
	public void guardar(Connection con, int idPedido) throws SQLException {
		Statement transaccion = con.createStatement();
	    transaccion.executeUpdate("Insert into pizzas (idPedido,numPizza,idTipoPizza,numUnidades) values("+idPedido+","+numPizza+","+idTipoPizza+","+numUnidades+")");
		
		if(idTipoPizza==9) {
			int contadorIngredientes=1;
			for(String i : ingredientes) {
				
			 transaccion.executeUpdate("Insert into ingredientespizzas (idPedido,numpizza,numingrediente,ingrediente) values("+idPedido+","+numPizza+","+contadorIngredientes+",'"+i+"')");	
						contadorIngredientes++;
			}
			
		}
		
	}
	
	
	public void añadirIngredientes(String ing) {
		this.ingredientes.add(ing);
	}

	public int getNumPizza() {
		return numPizza;
	}


	public void setNumPizza(int numPizza) {
		this.numPizza = numPizza;
	}


	public int getIdTipoPizza() {
		return idTipoPizza;
	}


	public void setIdTipoPizza(int idTipoPizza) {
		this.idTipoPizza = idTipoPizza;
	}


	public int getNumUnidades() {
		return numUnidades;
	}


	public void setNumUnidades(int numUnidades) {
		this.numUnidades = numUnidades;
	}


	public int getIdPedidoPizza() {
		return idPedidoPizza;
	}


	public void setIdPedidoPizza(int idPedidoPizza) {
		this.idPedidoPizza = idPedidoPizza;
	}


	public double getPrecio() {
		return precio;
	}


	public void setPrecio(double precio) {
		this.precio = precio;
	}
	
	
}
