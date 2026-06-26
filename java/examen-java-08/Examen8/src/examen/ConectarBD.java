package examen;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConectarBD {
	private static ConectarBD miBase;
	private Connection conexion;
	
	private ConectarBD() throws SQLException {
		String servidor="C:\\Users\\dam1prog31\\Desktop\\examen\\Libros.db";
		conexion = DriverManager.getConnection( "jdbc:sqlite:C:\\Users\\dam1prog31\\Desktop\\examen\\Libros.db");
		
	}
	
	public static ConectarBD iniciar() throws SQLException {
		if(miBase == null) {
			return miBase = new ConectarBD();
		}
		return miBase;
	}
	
	public Connection getConexion() {
		return conexion;
	}
	
	public void cerrarConexion() throws SQLException {
		if (miBase != null) {
			conexion.close();
			miBase= null;
		}
	}
}
