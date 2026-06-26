package examen;

import java.time.LocalDate;

public class Libro {
	private int id;
	private String titulo;
	private String autor;
	private LocalDate fecha;
	private boolean prestado;
	
	public Libro() {
		
	}
	public Libro(int id,String titulo,int año,int mes,int dia,boolean prestado) {
		this.id=id;
		this.titulo=titulo;
		this.fecha= LocalDate.of(año, mes, dia);
		this.prestado=prestado;
	}
	public Libro(String titulo,int año,int mes,int dia,boolean prestado) {
		
		this.titulo=titulo;
		this.fecha= LocalDate.of(año, mes, dia);
		this.prestado=prestado;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public LocalDate getFecha() {
		return fecha;
	}
	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}
	public boolean isPrestado() {
		return prestado;
	}
	public void setPrestado(boolean prestado) {
		this.prestado = prestado;
	}
	@Override
	public String toString() {
		return "Libro [id=" + id + ", titulo=" + titulo + ", autor=" + autor + ", fecha=" + fecha + ", prestado="
				+ prestado + "]";
	}
	
	
}
