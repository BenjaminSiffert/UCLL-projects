package main.java.c_controlStructures;

public class Main_if_statements {

    public static void main(String[] args) {
        // if else
        int a = 5, b = 20;
        if (a > b) {
            System.out.println("a is greater than b");
        } else {
            System.out.println("a is not greater than b");
        }

        // else if
        int x = 10, z = 20;
        if (x < z)
            System.out.println("To Low!");
        else if (x > z)
            System.out.println("To High!");
        else
            System.out.println("Correct!");

        // switch (alternative syntax for large if-else statements)
        int m = 2;
        switch (m) {
            case 1:
                System.out.println("January");
                break;
            case 2:
                System.out.println("February");
                break;
            default:
                System.out.println("Some other month");
        }
    }
}
