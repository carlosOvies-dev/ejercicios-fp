/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author Carlos Maroño Ovies
 */
public class Alfombra {
    private String modelo;
    private String cor;
    private double ancho;
    private double alto;

    public Alfombra(String modelo, String cor, double ancho, double alto) {
        this.modelo = modelo;
        this.cor = cor;
        this.ancho = ancho;
        this.alto = alto;
    }

    public String getModelo() {
        return modelo;
    }

    public String getCor() {
        return cor;
    }

    public double getAncho() {
        return ancho;
    }

    public double getAlto() {
        return alto;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public void setCor(String cor) {
        this.cor = cor;
    }

    public void setAncho(double ancho) {
        this.ancho = ancho;
    }

    public void setAlto(double alto) {
        this.alto = alto;
    }

     @Override
    public String toString() {
        // Formato para la JList, como pide la práctica 
        return "MODELO " + modelo + " - COR " + cor;
    }
    
}
