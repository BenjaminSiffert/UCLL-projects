package classes;

public class Main_class_method {

    public static void main(String[] args) {

        User amelia = new User("Amelia", 44);

        System.out.println("User has name " + amelia.getName() + " and age " + amelia.getAge());

        // method call
        amelia.celebrateBirthday();
        System.out.printf("Amelia has age %s.\n", amelia.getAge());
    }
}
