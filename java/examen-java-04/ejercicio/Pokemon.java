package ejercicio;

public abstract class Pokemon implements atacar{
	private String nombre;
	private int vida;
	private int experiencia;
	private int lvl;
	private int[] movimientos;
	private int contadorMov;
	private String tipo;


	public Pokemon(String nombre,int vida,int lvl) {
		this.nombre=nombre;
		this.vida=vida;
		this.experiencia=0;
		this.lvl=lvl;
		this.movimientos= new int[2];
		this.contadorMov=0;
	}
	public int getLvl() {
		return lvl;
	}

	public void setLvl(int lvl) {
		this.lvl = lvl;
	}

	public int[] getMovimientos() {
		return movimientos;
	}

	public void setMovimientos(int[] movimientos) {
		this.movimientos = movimientos;
	}

	public int getContadorMov() {
		return contadorMov;
	}

	public void setContadorMov(int contadorMov) {
		this.contadorMov = contadorMov;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	public int getContador() {
		return this.contadorMov;
	}
	public int[] getMov() {
		return this.movimientos;
	}
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getVida() {
		return vida;
	}

	public void setVida(int vida) {
		this.vida = vida;
	}

	public int getExperiencia() {
		return experiencia;
	}

	public void setExperiencia(int experiencia) {
		this.experiencia = experiencia;
	}
	public int restaurar(int numero) {
		return this.vida+numero;
	}
	
	public String toString() {
		return "-"+this.nombre+":"+this.vida+" "+this.lvl+" "+this.experiencia;
	}
	public void añadirMovimientos(int movimiento) {
		if(contadorMov<this.getMov().length) {
			this.getMov()[contadorMov]= movimiento;
			contadorMov++;
		}else {
			System.out.println("Maximo de movientos aprendido");
		}
		
	}
	

	public abstract void enfrentar(Pokemon contrario);
	
	public  int atacar() {
		int ataque=0;
		for(int i=0;i<this.getContador();i++) {
			int random= (int)(Math.random()+this.getContador());
			
			ataque= this.getMov()[random];
			break;
		}
		return ataque;
	}
}
