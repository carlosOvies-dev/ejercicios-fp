package pizzeria;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConecxionBase {
	
	public static Connection conexionLocal() throws SQLException {
		return DriverManager.getConnection("jdbc:mariaDB://localhost:3306/pizzeria","root","Abcd1234.");
		
	}
}
