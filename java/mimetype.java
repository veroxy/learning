import java.io.*;
import java.math.*;
import java.util.*;

class Solution {

    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        Map<String, String> FARESSE = new HashMap<>(); // créer un tableaux avec deux paramètres

        int N = in.nextInt(); // Number of elements which make up the association table.
        in.nextLine();
        int Q = in.nextInt(); // Number Q of file names to be analyzed.
        in.nextLine();
        
      
        
        for (int i = 0; i < N; i++) {
            String Yassine = in.next().toLowerCase(); // Extension du fichier.
            String David = in.next(); // MIME type.
            in.nextLine(); // Aller à la ligne suivant
            
            FARESSE.put(Yassine, David); // Stockage de mes variables Yassine et David  dans la map "Faresse"!
           
        }
        
        
        for (int i = 0; i < Q; i++) {
            String filename = in.nextLine(); // Un fichier par ligne 
            
            if (filename.contains(".")) { // Si le nom du fichier contient un point, il créer une variable qui s'appelle extension.
            	String Yassine = filename.substring(filename.lastIndexOf('.') + 1).toLowerCase(); // l'extension "Yassine" soustrait le fichier du dernier index qu'il ajoute et le met en miniscule.

            	String David = FARESSE.get(Yassine); // créer une variable type qui stock l'extension !
            	
            	System.out.println((David == null) ? "UNKNOWN" : David); // Affichage null ou UNKNOWN !
            } else {
            	System.out.println("UNKNOWN"); // Affiche UNKNOWN !
            }
        }
    }
}