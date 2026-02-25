package exercise1;
import java.util.List;
import java.util.Scanner;

public class Application {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Enter Sentence");
        List<String> list = List.of(input.nextLine().split(" "));
        for (String word : list) {
            if (word.contains("av")) {
                System.out.println(word);
            }
        }
    }
}

