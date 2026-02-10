package main.java.c_controlStructures;

public class Main_relational_operators {

    public static void main(String[] args) {
        int a = 3, c = 6;
        System.out.println("a and c are equal? ");
        System.out.println(a == c);    // returns false
        System.out.println("a+a is equal to c? ");
        System.out.println(a + a == c);    // returns true

        char x = 'x', X = 'X';
        System.out.printf("x becomes before X? %s %n", x < X);

        String first = "first", second = "first";
        System.out.println(first == second);        // bad practice!
        System.out.println(first.equals(second));   // the way you should do`

        String ja = "Ja", va = "Va";
        String sum = ja + va;
        String word = "JaVa";
        System.out.printf("The word %s reads the same as the sum of %s and %s: %s %n", word, ja, va, sum);
        System.out.println("What is the result when comparing sum and word with '=='?");
        System.out.println(sum == word);
        System.out.println("You should compare with '.equals'!");
        System.out.println(sum.equals((word)));
    }
}
