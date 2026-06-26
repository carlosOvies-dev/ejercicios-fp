package eje2;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class Libro {
	private static int contador=0;
	private String titulo;
	private String autor;
	private String isbn;
	private int paginas;
	private double precio;
	
	public Libro() {
		
	}
	
	public Libro(String titulo,String autor,String isbn,int paginas,double precio) {
		this.titulo=titulo;
		this.autor=autor;
		this.isbn=isbn;
		this.paginas=paginas;
		this.precio=precio;
	}
	public void guardarLibro() {
		try (DataOutputStream escribir = new DataOutputStream(new FileOutputStream("libros.data",true))){
			escribir.writeUTF(getTitulo());
			escribir.writeUTF(getAutor());
			escribir.writeUTF(getIsbn());
			escribir.writeInt(getPaginas());
			escribir.writeDouble(getPrecio());
			contador++;
			
			
		}catch(IOException i) {
			i.printStackTrace();
		}
		
		
	}
	
	public static void leer(String titulo) {
		Libro leido = new Libro();
		try (DataInputStream leer = new DataInputStream(new FileInputStream("libros.data"))){
			for(int i=0;i<Libro.contador;i++) {
			leido.setTitulo(leer.readUTF());
			leido.setAutor(leer.readUTF());
			leido.setIsbn(leer.readUTF());
			leido.setPaginas(leer.readInt());
			leido.setPrecio(leer.readDouble());
			
			if(leido.getTitulo().equals(titulo)) {
				System.out.println( leido);
			}
			
			}
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	
	}
	
	
	
	
	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public int getPaginas() {
		return paginas;
	}

	public void setPaginas(int paginas) {
		this.paginas = paginas;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	@Override
	public String toString() {
		return "Libro [titulo=" + titulo + ", autor=" + autor + ", isbn=" + isbn + ", paginas=" + paginas + ", precio="
				+ precio + "]";
	}
	
	
}
