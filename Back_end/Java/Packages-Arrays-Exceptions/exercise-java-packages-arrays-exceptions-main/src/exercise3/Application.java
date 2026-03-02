package exercise3;
import java.util.Scanner;

public class Application {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        System.out.println("Enter Sentence");
        int oldest_age = 0;

        while(true) {
            String age = input.nextLine();
            try {
                if (age.isBlank()) {
                    throw new IllegalArgumentException("Empty input");
                }
                else{
                    int validAge = Integer.parseInt(age);
                    if(validAge > oldest_age){
                        oldest_age = validAge;
                    }
                }
            } catch (IllegalArgumentException e) {
                System.out.println(oldest_age);
                break;
            }
        }}}


