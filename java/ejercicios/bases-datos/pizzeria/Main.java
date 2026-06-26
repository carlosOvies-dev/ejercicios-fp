package pizzeria;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Main {
	public static void main(String[] args)  {
		Pedido p = null;
		try {
			Connection conexion = ConecxionBase.conexionLocal();
			Statement herramientaClientes = conexion.createStatement();
			Statement herramientaDirecciones = conexion.createStatement();
			ResultSet consultaClientes = herramientaClientes.executeQuery("SELECT * FROM clientes limit 1");
			
			if(consultaClientes.next()) {
				
				ResultSet consultaDirecciones = herramientaDirecciones.executeQuery("SELECT * FROM direcciones where id ="+consultaClientes.getString("id"));
				if(consultaDirecciones.next()) {
					
					 p = new Pedido(consultaClientes.getString("nombre"), consultaClientes.getString("telefono"),
							consultaDirecciones.getString("lineadireccion") , consultaDirecciones.getString("cp"), 
							consultaDirecciones.getString("ciudad"));
				}
				
			}
			
			
			
			
			
			Pizza pizza1 = new Pizza(1, 1, 2, conexion);
			Pizza pizza2 = new Pizza(2, 3, 4, conexion);
			Pizza pizza3 = new Pizza(3, 2, 3, conexion);
			
			
			p.añadirPizza(pizza3);
			p.añadirPizza(pizza2);
			p.añadirPizza(pizza1);
			
			
			
		} catch(PizzaDesconocidaException pi) {
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
				
		
		
		
	}
}
