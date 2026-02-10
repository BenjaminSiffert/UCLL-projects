package main.java.b_variables;

public class Main_string {

    public static void main(String[] args) {
        String name = "Alfa";
        String text = "My name is ";
        System.out.println(text + name);
        int age = 23;
        System.out.println("I am " + age + " years old");
        // formatted output
        System.out.printf("My name is %s and I am %d years old", name, age);
    }
}
