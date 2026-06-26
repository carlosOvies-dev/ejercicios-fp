package ejercicio;

public class Fuego extends Pokemon{
	private int ascuas;
	private int bombaIgnea;
	
	
	public Fuego(String nombre, int vida, int lvl) {
		super(nombre, vida, lvl);
		this.ascuas=5;
		this.bombaIgnea=10;
		this.setTipo("fuego");
	}

	@Override
	public void enfrentar(Pokemon contrario) {
		int vida=0;
		if(this.getTipo().equals(contrario.getTipo())) {
			vida=contrario.getVida();
			contrario.setVida(vida-atacar()/2);
		}
		if(contrario.getTipo().equals("agua")) {
			vida=contrario.getVida();
			contrario.setVida(vida-atacar()/4);
		}
		if(contrario.getTipo().equals("normal")) {
			vida=contrario.getVida();
			contrario.setVida(vida-atacar()*2);
		}
		
	}
	@Override
	public int atacar() {
		int ataque=0;
		for(int i=0;i<this.getContador();i++) {
			int random= (int)(Math.random()+this.getContador());
			
			ataque= this.getMov()[random];
			break;
		}
		return ataque;
	}

	
	
	

}
