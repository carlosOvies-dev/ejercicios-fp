package CorredoresEntrenamiento;

import java.time.LocalDate;

public class Entrenamiento {
	private LocalDate fecha;
	private double kilometros;
	private int minutos;
	
	public Entrenamiento(int año,int mes,int dia,double km,int minutos) {
		this.fecha = LocalDate.of(año, mes, dia);
		this.kilometros=km;
		this.minutos=minutos;
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public double getKilometros() {
		return kilometros;
	}

	public void setKilometros(double kilometros) {
		this.kilometros = kilometros;
	}

	public int getMinutos() {
		return minutos;
	}

	public void setMinutos(int minutos) {
		this.minutos = minutos;
	}

	@Override
	public String toString() {
		return "Entrenamiento [fecha=" + fecha + ", kilometros=" + kilometros + ", minutos=" + minutos + "]";
	}
	
	
}
