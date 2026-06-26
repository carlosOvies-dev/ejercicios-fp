
import java.util.List;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Carlos Maroño Ovies
 */
public class Datos {
    private String dni;
    private String nombre;
    private String apellido1;
    private String apellido2;
    private List<Character> carnets;
    private String sexo;
    private String titulacion;

    public Datos() {
    }

    public Datos(String dni, String nombre, String apellido1, String apellido2, List<Character> carnets, String sexo, String titulacion) {
        this.dni = dni;
        this.nombre = nombre;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.carnets = carnets;
        this.sexo = sexo;
        this.titulacion = titulacion;
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

    public void setCarnets(List<Character> carnets) {
        this.carnets = carnets;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public void setTitulacion(String titulacion) {
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

    public List<Character> getCarnets() {
        return carnets;
    }

    public String getSexo() {
        return sexo;
    }

    public String getTitulacion() {
        return titulacion;
    }

    @Override
    public String toString() {
        return  nombre + " " + apellido1 + " " + apellido2 ;
    }
    
    
}
