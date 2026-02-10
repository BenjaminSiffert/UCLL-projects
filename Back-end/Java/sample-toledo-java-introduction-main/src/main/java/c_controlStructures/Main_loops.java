package main.java.c_controlStructures;

public class Main_loops {

    public static void main(String[] args) {
        // while loop
        int i = 0;
        while (i < 5) {
            System.out.println(i);
            i++;
        }

        // do while loop
        int j = 0;
        do {
            System.out.println(j);
            j++;
        }
        while (j < 5);

        // for loop
        String text = "Hello World";
        for (int c = 0; c < text.length(); c++) {
            System.out.println(text.charAt(c));
        }
    }
}
