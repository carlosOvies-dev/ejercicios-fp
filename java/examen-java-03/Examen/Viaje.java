package Examen;

public class Viaje {
	public int dia;
	private int mes;
	private int año;
	private String ciudadOrigen;
	private String ciudadDestino;
	private String identificadorRemolque;
	private double kmsRealizados;
	
	/*public Viaje(int d, int m, int a, String o,String destino,String i, double k) {
		this.dia = d;
		this.mes =m;
		this.año =a;
		this.ciudadOrigen=o;
		this.ciudadDestino=destino;
		this.identificadorRemolque=i;
		this.kmsRealizados=k;
	}*/
	public void setDia(int d) {
		this.dia=d;
		
	}
	public void setMes(int m) {
		this.mes=m;
		
	}
	public void setAño(int a) {
		this.año=a;
		
	}
	public void setCiudadOrigen(String o) {
		this.ciudadOrigen= o;
		
	}
	public void setCiudadDestino(String d) {
		this.ciudadDestino= d;
		
	}
	public void setIdentificadorRemolque(String i) {
		this.identificadorRemolque= i;
	}
	public void setKmsRealizados(int k) {
		this.kmsRealizados = k;
	}
	
	public int getDia() {
		return dia;
		
	}
	public int getMes() {
		return mes;
		
	}
	public int getAño() {
		return año;
		
	}
	public String getCiudadOrigen() {
		return ciudadOrigen;
		
	}
	public String getCiudadDestino() {
		return ciudadDestino;
		
	}
	public String getIdentificadorRemolque() {
		return identificadorRemolque;
	}
	public double getKmsRealizados() {
		return kmsRealizados ;
	}
}
