package classes;

public class Main_class_constructor {

    public static void main(String[] args) {

        // constructor
        User amelia = new User("Amelia", 44);
        User ben = new User("Ben", 5);
        User zeno = new User();

        System.out.println("Amelia has name " + amelia.getName() + " and age " + amelia.getAge());

        // You cannot access private fields!
        // System.out.println("Amelia has name " + amelia.name + " and age " + amelia.age);
    }
}
