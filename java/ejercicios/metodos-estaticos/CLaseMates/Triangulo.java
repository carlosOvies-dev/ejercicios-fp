package CLaseMates;

import java.awt.Color;

public class Triangulo {
	private float lado1;
	private float lado2;
	private float lado3;
	private Color color;
	
	public Triangulo(float l1,float l2, float l3, Color c) {
		lado1 = l1;
		lado2 = l2;
		lado3 = l3;
		color = c;
	}
//Este construstor no lo pide el  ejercicio	
	public Triangulo() {
		lado1 = 10;
		lado2 = 22;
		lado3 = 15;
		color = Color.CYAN;
	}
	
	public float getLado1() {
		return lado1;
	}
	public float getLado2() {
		return lado2;
	}
	public float getLado3() {
		return lado3;
	}
	public Color getColor() {
		return color;
	}
	public void setLado1( float l1) {
		 lado1 = l1;
	}
	public void setLado2( float l2) {
		 lado2 = l2;
	}
	public void setLado3( float l3) {
		lado3 = l3;
	}
	public void setColor( Color c) {
		color = c;
	}
	public float calcularArea() {
		float s = (this.lado1 + this.lado2 + this.lado3)/2;
		float area =(float) Math.sqrt(s*(s-this.lado1)*(s-this.lado2)*(s-this.lado3));
		return area;
	}
	public static float calcularArea(float l1,float l2, float l3) {
		float s = (l1 + l2 + l3)/2;
		float area =(float)Math.sqrt(s*(s-l1)*(s-l2)*(s-l3));
		return area;
	}
}
