package ejercicio;

public class Combate {
	private Pokemon[] equipo1;
	private int contador1;
	private Pokemon[] equipo2;
	private int contador2;
	
	public Combate() {
		this.equipo1= new Pokemon[3];
		this.contador1=0;
		this.equipo2= new Pokemon[3];
		this.contador2=0;
	}
	
	public void crearEquipo1(Pokemon pokemon) {
		if(this.contador1<equipo1.length) {
			equipo1[contador1]=pokemon;
			contador1++;
		}else {
			System.out.println("el equipo esta lleno");
		}
	}
	public void crearEquipo2(Pokemon pokemon) {
		if(this.contador2<equipo2.length) {
			equipo2[contador2]=pokemon;
			contador2++;
		}else {
			System.out.println("el equipo esta lleno");
		}
	}
	public void mostrarequip1() {
	
	Pokemon aux=null;
		for(int i=0;i<contador1;i++) {
			
			aux = equipo1[i];
			 System.out.println(aux.toString());
	}
	}
		public void mostrarequip2() {
			
			Pokemon aux=null;
				for(int i=0;i<contador2;i++) {
					
					aux = equipo2[i];
					 System.out.println(aux.toString());
			}
	}
	
	public void fight() {
		Pokemon peleador1= null;
		Pokemon peleador2=null;
		int muertos1=0;
		int muertos2=0;
		while(muertos1==3 || muertos2==3) {
		for(int i=0;i<contador1;i++) {
			int random=(int)(Math.random()*contador1);
			if(equipo1[random].getVida()!=0) {
				peleador1= equipo1[random];
				 break;
			}
			 
		}
		for(int i=0;i<contador2;i++) {
			int random=(int)(Math.random()*contador2);
			if(equipo2[random].getVida()!=0) {
				peleador2= equipo2[random];
				 break;
			}
		}
		boolean muerto = false;
		while(muerto=false)
		peleador1.enfrentar(peleador2);
		if(peleador2.getVida()==0) {
			muerto=true;
			muertos2++;
		}else {
			peleador2.enfrentar(peleador1);
			if(peleador1.getVida()==0) {
				muerto=true;
				muertos1++;
			}
		}
	}
		//pokemon aux=null
		for(int i =0;i<equipo1.length;i++) {
		System.out.println("1"+	equipo1[i].toString());
		}
		for(int i =0;i<equipo2.length;i++) {
			System.out.println(	"2"+equipo2[i].toString());
			}
		
	}
}
