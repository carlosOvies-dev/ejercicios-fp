package ejercicio;

public class Normal extends Pokemon{
	private int pisoton;
	private int agarre;
	private String tipo;
	public Normal(String nombre, int vida, int lvl) {
		super(nombre, vida, lvl);
		this.setTipo("normal");
	}

	@Override
	public void enfrentar(Pokemon contrario) {
		int vida=contrario.getVida();
		contrario.setVida(vida-atacar()*1);
		
	}

}
