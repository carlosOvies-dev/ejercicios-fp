
import java.util.ArrayList;
import java.util.List;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Carlos Maroño Ovies
 */
public class Persona {
    private String dni;
    private String nombre;
    private String apellido1;
    private String apellido2;
    private String genero;
    private List<Character> permiso;

  
    public Persona(String dni,String nombre,String apel1,String apel2,String genero,List<Character> permisos,String titulacion){
        
        this.dni = dni;
        this.nombre = nombre;
        this.apellido1 = apel1;
        this.apellido2 = apel2;
        this.genero = genero;
        this.permiso = new ArrayList<>();
        this.permiso = permisos;
        this.titulacion = titulacion;
        
    }

    public String getDni() {
        return dni;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellido1() {
        return apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public String getGenero() {
        return genero;
    }
    
  public void setPermiso(List<Character> permiso) {
        this.permiso = permiso;
    }
  

    public List<Character> getPermiso() {
        return permiso;
    }
    private String titulacion;
    
   

    public String getTitulacion() {
        return titulacion;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }


    public void setTitulacion(String titulacion) {
        this.titulacion = titulacion;
    }
    
    
    
}
