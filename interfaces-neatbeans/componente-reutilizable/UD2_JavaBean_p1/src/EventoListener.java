
import java.util.EventListener;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Carlos Maroño Ovies
 */
public interface EventoListener extends EventListener{
    
    void exitoso(ExitoEvent evento);
    
    void fallido(FalloEvent evento);
    
}
