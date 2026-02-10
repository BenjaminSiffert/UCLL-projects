package main.java.d_methods;

public class Main_methods {

    public static void main(String[] args) {
        printNumberThree();
        printNumber(5);
        printSumOfNumbers(2, 7);
        int sum = getSumOfNumbers(4, 11);
        System.out.println(sum);
        String sign = getSign(-8);
        System.out.println(sign);
    }

    // method without parameter, without return value
    public static void printNumberThree() {
        System.out.println("The number is 3");
    }

    // method with parameter, without return value
    public static void printNumber(int number) {
        System.out.println("The number as paramater is " + number);
    }

    // method with 2 parameters, without return value
    public static void printSumOfNumbers(int number1, int number2) {
        System.out.println(number1 + number2);
    }

    // method with 2 parameters, with return value
    public static int getSumOfNumbers(int number1, int number2) {
        return number1 + number2;
    }

    // method with 1 parameter and multiple return values
    public static String getSign(int number) {
        if (number < 0)
            return "-";
        else return "+";
    }
}
