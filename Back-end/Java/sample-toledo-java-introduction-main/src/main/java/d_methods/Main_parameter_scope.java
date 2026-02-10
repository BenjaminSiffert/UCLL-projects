package main.java.d_methods;

public class Main_parameter_scope {

    public static void main(String[] args) {

        int number = 10;
        printDouble(number);

        // System.out.println("Outside method: " + doubled);
        // Error: 'doubled' does not exist here

        // System.out.println("Outside method: " + value);
        // Error: 'value' does not exist here
    }

    public static void printDouble(int value) {
        int doubled = value * 2;
        System.out.println("Inside method: " + doubled);
    }
}
