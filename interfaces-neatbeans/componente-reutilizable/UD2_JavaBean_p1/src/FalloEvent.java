
import java.util.EventObject;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Carlos Maroño Ovies
 */
public class FalloEvent extends EventObject{
    private String fallo;
    public FalloEvent(Object source, String fallo) {
        super(source);
        this.fallo=fallo;
    }

    public String getFallo() {
        return fallo;
    }
    
    
    
}
