import classes.User;

public class Main_class_equality {

    public static void main(String[] args) {

        // equality
        String first = "first";
        String second = "first";
        System.out.println(first == second);
        System.out.println(first.equals(second));

        User amelia1 = new User("Amelia", 44);
        User amelia2 = new User("Amelia", 44);

        System.out.println("Amelia1 is equal to Amelia2?");
        System.out.println(amelia1 == amelia2);
        System.out.println(amelia1.equals(amelia2));

    }
}
