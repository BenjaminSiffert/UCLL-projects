package main.java.d_methods;

public class Main_parameter_variables {

    public static void main(String[] args) {
        int number = 5;
        System.out.println("Before method call: " + number);
        modifyValue(number);
        System.out.println("After method call: " + number);
    }

    public static void modifyValue(int value) {
        value = value * 2;
        System.out.println("Inside method: " + value);
    }
}

