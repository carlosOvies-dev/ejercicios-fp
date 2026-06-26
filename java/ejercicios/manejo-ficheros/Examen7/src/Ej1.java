import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Ej1 {
public static void main(String[] args) {
		
		String[] correos = {"Ana,López García,ana.lopez@gmail.com,23",
				"Luis,Martínez,luis123@correo.net,30",
				"Carmen,Gómez,carmen@@dominio.com,27"};
		
		String expresion = "([A-Za-z]+),([A-Za-z]+),([A-Za-z0-9.+_]+)@([A-Za-z0-9.-]+)\\.([a-z]{2,}),([0-9]{1,})";
		Pattern copilador = Pattern.compile(expresion);
		
		for(String s : correos) {
			Matcher matcher = copilador.matcher(s);
			if(matcher.matches()) {
			System.out.println("Nombre: "+matcher.group(1));
			System.out.println("Apellidos: "+matcher.group(2));
			
		}
		}
	}
}
