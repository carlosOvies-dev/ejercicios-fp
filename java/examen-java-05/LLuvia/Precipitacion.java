package LLuvia;

import java.time.LocalDate;

public class Precipitacion {
	private LocalDate fecha;
	private int mm2;
	
	public Precipitacion(int año,int mes,int dia,int mm2) {
		this.fecha= LocalDate.of(año, mes, dia);
		this.mm2=mm2;
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	public int getMm2() {
		return mm2;
	}

	public void setMm2(int mm2) {
		this.mm2 = mm2;
	}

	@Override
	public String toString() {
		return "Precipitacion [fecha=" + fecha + ", mm2=" + mm2 + "]";
	}
	
}
