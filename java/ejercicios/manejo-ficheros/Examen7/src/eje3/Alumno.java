package eje3;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;

public class Alumno {
	private String nombre;
	private int edad;
	private String ciclo;
	private List<String> modulos;
	
	public Alumno() {
		
	}
	public Alumno(String nombre,int edad,String ciclo) {
		this.nombre= nombre;
		this.edad=edad;
		this.ciclo=ciclo;
		this.modulos= new ArrayList<>();
	}
	
	public void Guardar() {
		try(DataOutputStream escribir= new DataOutputStream(new FileOutputStream("json.json",true))){
			JSONObject json = new JSONObject(); 
			json.put("nombre", getNombre());
			json.put("edad", getEdad());
			json.put("ciclo", getCiclo());
			for(String s : getModulos()) {
				json.put("modulos", s);
			}
	
		
				
		}catch(IOException i) {
			i.printStackTrace();
		}
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getEdad() {
		return edad;
	}
	public void setEdad(int edad) {
		this.edad = edad;
	}
	public String getCiclo() {
		return ciclo;
	}
	public void setCiclo(String ciclo) {
		this.ciclo = ciclo;
	}
	public List<String> getModulos() {
		return modulos;
	}
	public void setModulos(List<String> modulos) {
		this.modulos = modulos;
	}
	@Override
	public String toString() {
		return "Alumno [nombre=" + nombre + ", edad=" + edad + ", ciclo=" + ciclo + ", modulos=" + modulos + "]";
	}
	
	
}
