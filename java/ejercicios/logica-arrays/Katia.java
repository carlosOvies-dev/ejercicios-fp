
public class Katia {
	public static void main(String[] args) {
	int[] numeros = {2, 4, 3, 5, 7, 8, -1};
	int objetivo = 7;
	encontrados(numeros, objetivo);
	
	}
	public static void encontrados(int[] numeros, int objetivo) {
		int[] parejas = new int[numeros.length * 2];
		int guardado1 = 0;
		int guardado2 = 0;
		int indice = 0;
		for (int i = 0; i<numeros.length; i++) {
			for (int j = 0; j<numeros.length; j++) {
				if (numeros[i] + numeros[j] == objetivo) { 
					guardado1 = numeros[j];
					guardado2 = numeros[i];
					//parejas[indice] = guardado1;
					//parejas[indice + 1] = guardado2;
					//indice++;
					
			}
				
		}System.out.println("Este es el primer guardado: " + guardado1 +"Este es el segundo guardado: " + guardado2);
		parejas[indice]= guardado2;
		parejas[indice + 1]= guardado1;	
		indice = indice +2;
		}
		
		for( int i = 0 ; i<parejas.length; i++){
			System.out.println(parejas[i]);
		}
	}
	}


	
