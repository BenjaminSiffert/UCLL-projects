package main.java.b_variables;

public class Main_number {

    public static void main(String[] args) {
        // variable assignments
        int a = 7;
        // a = "some text"; // invalid assignment
        String word = "abc";
        // word = true; // invalid assignment

        // numerical result depends on variable type
        int number1 = 3;
        int number2 = 2;
        double number3 = 2.0;

        System.out.println(number1 / number2);   // returns 1
        System.out.println(number1 / number3);  // returns 1.5
        System.out.println(number1 % number2); // returns 1
    }
}
