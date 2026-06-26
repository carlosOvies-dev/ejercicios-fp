package ejercicio;

public class Probar {
	public static void main(String[] args) {
		
		Fuego vulpix = new Fuego("Vulpix", 200, 1);
		Fuego charmander = new Fuego("Charmander", 200, 1);
		Agua squirtel = new Agua("Squirtel",200,1);
		Agua psyduck =new Agua("Psyduck",200,1);
		Normal rattata =new Normal("Rattata", 200, 1);
		Normal meowth = new Normal("Meowth",200,1);
		
		Combate combate= new Combate();
		combate.crearEquipo1(meowth);
		combate.crearEquipo1(vulpix);
		combate.crearEquipo1(squirtel);
		
		combate.crearEquipo2(rattata);
		combate.crearEquipo2(charmander);
		combate.crearEquipo2(psyduck);
		
		combate.fight();
	}
}
