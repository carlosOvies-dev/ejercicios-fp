
import java.util.EventObject;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Carlos Maroño Ovies
 */
public class ExitoEvent extends EventObject{
    private Datos dato;
    public ExitoEvent(Object source,Datos dato) {
        super(source);
        this.dato=dato;
    }

    public Datos getDato() {
        return dato;
    }
    
    
}
