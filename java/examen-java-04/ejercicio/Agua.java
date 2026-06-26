package ejercicio;

public class Agua extends Pokemon{
	private int buceo;
	private int acuaJet;
	private String tipo;
	
	public Agua(String nombre, int vida, int lvl) {
		super(nombre, vida, lvl);
		this.setTipo("agua");
		this.buceo=5;
		this.acuaJet=10;
	}
	
	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	@Override
	public void enfrentar(Pokemon contrario) {
		int vida=0;
		if(this.getTipo().equals(contrario.getTipo())) {
			vida=contrario.getVida();
			contrario.setVida(vida-atacar()/2);
		}
		if(contrario.getTipo().equals("fuego")) {
			vida=contrario.getVida();
			contrario.setVida(vida-atacar()*2);
		}
		if(contrario.getTipo().equals("normal")) {
			vida=contrario.getVida();
			contrario.setVida(vida-atacar()*1);
		}
		
	}

	
	
}
