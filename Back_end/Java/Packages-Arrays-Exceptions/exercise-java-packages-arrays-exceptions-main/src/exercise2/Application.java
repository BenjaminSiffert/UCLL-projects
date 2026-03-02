package exercise2;
import java.util.List;
import java.util.Scanner;

public class Application {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Enter Sentence");
        while (true) {
            try {
                String line = input.nextLine();

                if (line.isBlank()) {
                    throw new IllegalArgumentException("Empty input");
                }

                List<String> list = List.of(line.split(" "));
                System.out.println(list.getLast());

            } catch (IllegalArgumentException e) {
                System.out.println("nothing entered");
                break;
            }
        }
    }
}
