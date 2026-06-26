package examen;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.Connection;

import org.json.JSONObject;
import org.json.JSONTokener;

public class Conexion {
	private String ip;
	private String usuario;
	private String contraseña;
	
	public Conexion(String ip, String usuario, String contraseña) {
		this.ip=ip;
		this.usuario=usuario;
		this.contraseña=contraseña;
	}

	public void guardarConfiguracion(File fichero) {
		JSONObject formato = new JSONObject();
		formato.put("ip", ip);
		formato.put("usuario", usuario);
		formato.put("contraseñ", contraseña);
		
		try (PrintStream herramienta = new PrintStream(fichero);){
			herramienta.print(formato.toString());
			
			
		}catch( IOException I){
			
		}
	}
	
	public static Conexion cargarConfiguracion(File fichero) {
		
		Conexion con = null;
		
	//Preparameos el archivo para poder leerse	
		try (FileInputStream lector = new FileInputStream(fichero)){
	//Forzado de tipo a los String que estan dentro de fichero		
			JSONTokener herramienta = new JSONTokener(lector);
	//Objeto auxiliar para que coja los valores sacados		
			JSONObject aux = (JSONObject) herramienta.nextValue();
			
			 con = new Conexion(aux.getString("ip"),aux.getString("usuario"),aux.getString("contraseñ"));
			
			
			
			
		} catch(IOException i){
			
		}
		return con;
	}
	
	
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getContraseña() {
		return contraseña;
	}

	public void setContraseña(String contraseña) {
		this.contraseña = contraseña;
	}

	@Override
	public String toString() {
		return "Conexion [ip=" + ip + ", usuario=" + usuario + ", contraseña=" + contraseña + "]";
	}
	
	
}
