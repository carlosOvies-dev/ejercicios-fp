package examen;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
	public static void main(String[] args) {
		String expresion ="^([\\w.+-]+)@([\\w.-]+)\\.([a-zA-Z]{2,})";
		String correo = "email+alias@subdomain.example.org";
		
		Pattern copilador = Pattern.compile(expresion);
		
		Matcher matcher = copilador.matcher(correo);
		
		if(matcher.matches()) {
			System.out.println(matcher.group(1));
			System.out.println(matcher.group(2));
			System.err.println(matcher.group(3));
		}
		
		
	}
}
