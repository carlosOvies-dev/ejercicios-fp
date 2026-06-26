/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author carlosmo
 */
public class Persona {
    private String nombre;
    private String apellidos;
    public Persona(String nombre,String apellidos) {
    this.nombre= nombre;
    this.apellidos=apellidos;
    }

    public String getNombre() {
        return nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    @Override
    public String toString() {
        return  "nombre=" + nombre + ", apellidos=" + apellidos ;
    }
    
}
