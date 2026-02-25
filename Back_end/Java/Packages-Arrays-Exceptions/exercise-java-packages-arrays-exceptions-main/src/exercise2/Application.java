package exercise2;
import java.util.List;
import java.util.Scanner;

public class Application {

    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Enter Sentence");
        List<String> list = List.of(input.nextLine().split(" "));
        System.out.println(list.getLast());
        Scanner newinput = new Scanner(System.in);
        System.out.println("Enter Another Sentence");
        List<String> newlist = List.of(newinput.nextLine().split(" "));
        System.out.println(newlist.getLast());

    }
}