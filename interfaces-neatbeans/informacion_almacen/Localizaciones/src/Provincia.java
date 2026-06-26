
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
public class Provincia {
    private String nombre;
    private List<String> localidad;

    public Provincia(String nombre) {
        this.nombre = nombre;
        this.localidad = new ArrayList<>();
    }

    public String getNombre() {
        return nombre;
    }

    public List<String> getLocalidad() {
        return localidad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setLocalidad(List<String> localidad) {
        this.localidad = localidad;
    }
    
    public void añadirLocalidad(String localidad){
        this.localidad.add(localidad);
    }
    
    public void eliminarLocalidad(String localidad){
        this.localidad.remove(localidad);
    }

    @Override
    public String toString() {
        return  nombre ;
    }
    
}
