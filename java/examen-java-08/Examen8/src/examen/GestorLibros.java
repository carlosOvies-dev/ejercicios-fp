package examen;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class GestorLibros {
	
	public static void main(String[] args) {
		
		try {
			insertarLibro("a","lucas",LocalDate.now());
			System.out.println(librosDisponibles());
			eliminarLibro(5);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void insertarLibro(String titulo, String autor, LocalDate fecha) throws SQLException {
		ConectarBD c = ConectarBD.iniciar();
		Connection base = null;
		try {
			
			 base = c.getConexion();
			PreparedStatement consulta = base.prepareStatement("insert into libros(titulo,autor,fecha_publicación,prestado) values(?,?,?,?)");
			consulta.setString(1, titulo);
			consulta.setString(2, autor);
			consulta.setDate(3, Date.valueOf(fecha));
			consulta.setBoolean(4, false);
		
			consulta.executeUpdate();
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		} finally {
			c.cerrarConexion();
		}
	
	}
	public static List<Libro> librosDisponibles() throws SQLException {
		ConectarBD c = ConectarBD.iniciar();
		Connection base = null;
		
		List<Libro> noPrestado = new ArrayList<>();
		try {
			 base = c.getConexion();
			 
				PreparedStatement consulta = base.prepareStatement("select * from libros");
				ResultSet resultado = consulta.executeQuery();
				
				while(resultado.next()) {
					
					Libro leido = new Libro();
					leido.setId(resultado.getInt(1));
					leido.setTitulo(resultado.getString(2));
					leido.setAutor(resultado.getString(3));
					leido.setFecha(resultado.getDate(4).toLocalDate());
					leido.setPrestado(resultado.getBoolean(5));
					if(leido.isPrestado()==false) {
						noPrestado.add(leido);
					}
				
				}
		}catch(SQLException s) {
			s.printStackTrace();
		}finally {
			c.cerrarConexion();
		}
		return noPrestado;
	}
	  public static List<Libro> buscarLibros(String autor, int añoMinimo) throws SQLException{
		  ConectarBD c = ConectarBD.iniciar();
			Connection base = null;
			List<Libro> buscados = new ArrayList<>();
			try {
				 base = c.getConexion();
					PreparedStatement consulta = base.prepareStatement("select * from libros where fecha_publicación > ?");
					consulta.setDate(1,Date.valueOf( LocalDate.of(añoMinimo, 1, 1)));
					ResultSet resultado = consulta.executeQuery();
					while(resultado.next()) {
						Libro leido = new Libro();
						leido.setId(resultado.getInt(1));
						leido.setTitulo(resultado.getString(2));
						leido.setAutor(resultado.getString(3));
						leido.setFecha(resultado.getDate(4).toLocalDate());
						leido.setPrestado(resultado.getBoolean(5));
						buscados.add(leido);
					}
	  } catch(SQLException s) {
		  s.printStackTrace();
	  }finally {
		  c.cerrarConexion();
	  }
			return buscados;
}
	  public static void prestarLibro(int idLibro) throws SQLException {
		  ConectarBD c = ConectarBD.iniciar();
			Connection base = null;
			try {
				
				 base = c.getConexion();
				PreparedStatement consulta = base.prepareStatement("set prestado on libros where id = ?");
				consulta.setInt(1, idLibro);
				consulta.executeUpdate();
	  }catch(SQLException s) {
		  s.printStackTrace();
	  }finally {
		c.cerrarConexion();
	}
			

}
	  public static void eliminarLibro(int idLibro) throws SQLException {
		  ConectarBD c = ConectarBD.iniciar();
			Connection base = null;
			try {
				
				 base = c.getConexion();
				PreparedStatement consulta = base.prepareStatement("delete from libros where id = ?");
				consulta.setInt(1, idLibro);
				consulta.executeUpdate();
	  }catch(SQLException s) {
		  s.printStackTrace();
	  }finally {
		  c.cerrarConexion();
	  }

}
	  public static void insertarLibros(List<Libro> libros) throws SQLException {
		  ConectarBD c = ConectarBD.iniciar();
			Connection base = null;
			try {
				base.setAutoCommit(false);
				 base = c.getConexion();
				 for (Libro l : libros) {
				PreparedStatement consulta = base.prepareStatement("insert into libros(titulo,autor,fecha_publicación,prestado) values(?,?,?,?)");
				consulta.setString(1, l.getTitulo());
				consulta.setString(2, l.getAutor());
				consulta.setDate(3, Date.valueOf(l.getFecha()));
				consulta.setBoolean(4, false);	
				consulta.executeUpdate();
				
				 }
				 
				 base.commit();
			} catch (SQLException e) {
				base.rollback();
				e.printStackTrace();
			} finally {
				base.setAutoCommit(true);
				c.cerrarConexion();
			}
	  }

	  
}