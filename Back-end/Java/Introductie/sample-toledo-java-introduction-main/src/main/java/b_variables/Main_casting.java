package main.java.b_variables;

public class Main_casting {

    public static void main(String[] args) {
        // casting numerical variables
        int number4 = (int) 3.2;
        double number5 = (double) 2;

        System.out.println(number4); // returns 3
        System.out.println(number5); // returns 2.0
        System.out.println((double) number4 + number5); // returns 5.0

        // casting string to number
        int number6 = Integer.parseInt("3");
        double number7 = Double.parseDouble("3.0");

        // string to boolean
        boolean valueTrue = Boolean.parseBoolean("true");
        
        // int number8 = Integer.parseInt("this won't work"); // throws error
    }
}
