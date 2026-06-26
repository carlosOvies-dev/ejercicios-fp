
public class katia5 {
	public static void main (String[] args) {
		int[] dado = {1,2,3,4,5,6};
		int objetivo = 8;
		resultados(dado,objetivo);
	}
	public static void resultados(int[] numeros, int objetivo) {
		int guardado1=0;
		int guardado2=0;
		for(int i = 0; i<numeros.length ; i++) {
			for( int j = 0; j<numeros.length; j++) {
				if (numeros[i] + numeros[j]== objetivo) {
					guardado1 = numeros[j];
					guardado2 = numeros[i];
					
				}
			}
			if( guardado1>0 && guardado2>0) {
			System.out.println("Estos son los numeros: " + guardado1 + "+" + guardado2 + "=" + objetivo);
		}
	}
}
}