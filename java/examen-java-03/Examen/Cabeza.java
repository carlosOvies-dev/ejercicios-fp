package Examen;

public class Cabeza {
	private String marca;
	private double alto;
	private double ancho;
	private String matricula;
	private String nif;
	private double autonomia;
	private boolean radio;
	private Viaje[] viajes;
	private int contador;
	
	public Cabeza(String marca, double alto,double ancho,String matricula,String nif,double autonomia,boolean radio) {
		this.marca=marca;
		this.alto=alto;
		this.ancho=ancho;
		this.matricula=matricula;
		this.nif=nif;
		this.autonomia=autonomia;
		this.radio=radio;
		this.viajes=null;
		this.contador =0;
	}
	
	public void setMarca(String marca) {
		this.marca= marca;
	}
	public void setAlto(Double alto) {
		this.alto= alto;
	}
	public void setAncho(double ancho) {
		this.ancho=ancho;
	}
	public void setMatricula(String matricula) {
		this.matricula=matricula;
	}
	public void setNif(String nif) {
		this.nif=nif;
	}
	public void setAutonomia(double a) {
		this.autonomia=a;
	}
	public void setRadio(boolean r) {
		this.radio=r;
	}
	public String getMarca() {
		return marca;
	}
	public double getAlto() {
		return alto;
	}
	public double getAncho() {
		return ancho;
	}
	public String getMatricula() {
		return matricula;
	}
	public String getNif() {
		return nif;
	}
	public double getAutonomia() {
		return autonomia;
	}
	public boolean radio() {
		return radio;
	}
	public void eliminarViajes() {
		this.viajes = null;
		contador = 0;
	}
	public void crearViaje(Viaje v) {
	/*El array Viaje lo estamos inicializando entonces tenemos que ponerle un tamaño*/	
		
		if (viajes==null) {
			this.viajes= new Viaje[100000];
		} 
	/*Se seguiran añadiendo viajes mientras el contador sea inferior al array viajes*/	
		if( contador<viajes.length) {
			viajes[contador++]= v;
		}
	}
	public double numKms(int año ,int mes) {
		double suma=0;
		for(int i = 0; i<contador;i++) {
		/*Estamos buscando el año que sea igual al que metemos por parametro*/	
			if(viajes[i].getAño()==año && viajes[i].getMes()==mes) {
				suma+=viajes[i].getKmsRealizados();
			}
		}
		return suma;
		
	}
	public double numKms(int año) {
		double suma=0;
		for(int i = 0; i<contador;i++) {
		/*Estamos buscando el año que sea igual al que metemos por parametro*/	
			if(viajes[i].getAño()==año ) {
				suma+=viajes[i].getKmsRealizados();
			}
		}
		return suma;
	}
}
