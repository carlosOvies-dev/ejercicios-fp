package bidimensional;

import java.util.Scanner;

public class TresEnRaya {
    public static void main(String[] args) {
        String[][] tablero = {
            {"-", "-", "-"},
            {"-", "-", "-"},
            {"-", "-", "-"}
        };
        Scanner scanner = new Scanner(System.in);
        int movimiento = 1;
        boolean ganador = false;

        while (ganador == false && movimiento <= 9) { 
            String jugador = "";

            if (movimiento % 2 != 0) { 
                jugador = "x";
            } else {
                jugador = "o";
            }

            enseñar(tablero);
            movimiento(scanner, tablero, jugador);
            ganador = ganador(tablero, jugador); 
            movimiento++;
        }
    }

    public static void movimiento(Scanner scanner, String[][] tablero, String jugador) {
        while (true) {
            System.out.println("Jugador " + jugador + ", introduce la fila (0, 1 o 2):");
            int posicionFila = scanner.nextInt();
            
            System.out.println("Jugador " + jugador + ", introduce la columna (0, 1 o 2):");
            int posicionColumna = scanner.nextInt();

            if (posicionFila <= 2 && posicionFila >= 0 && posicionColumna <= 2 && posicionColumna >= 0) {
                if (tablero[posicionFila][posicionColumna].equals("-")) {
                    tablero[posicionFila][posicionColumna] = jugador;
                    break;
                } else {
                    System.out.println("Esa casilla no está disponible.");
                }
            } else {
                System.out.println("Coordenadas fuera de límite.");
            }
        }
    }

    public static boolean ganador(String[][] tablero, String jugador) {
        for (int i = 0; i < tablero.length; i++) {
            if ((tablero[i][0].equals(jugador) && tablero[i][1].equals(jugador) && tablero[i][2].equals(jugador)) || 
                (tablero[0][i].equals(jugador) && tablero[1][i].equals(jugador) && tablero[2][i].equals(jugador))) {
                return true;
            }
        }
        
        if ((tablero[0][0].equals(jugador) && tablero[1][1].equals(jugador) && tablero[2][2].equals(jugador)) || 
            (tablero[0][2].equals(jugador) && tablero[1][1].equals(jugador) && tablero[2][0].equals(jugador))) {
            return true;
        } else {
            return false;
        }
    }

    public static void enseñar(String[][] tablero) {
        for (int i = 0; i < tablero.length; i++) {
            for (int j = 0; j < tablero[i].length; j++) {
                System.out.print(tablero[i][j] + " ");
            }
            System.out.println("");
        }
    }
}