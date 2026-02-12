package classes;

public class Main_class_toString {

    public static void main(String[] args) {

        // constructor
        User amelia = new User("Amelia", 44);

        System.out.println(amelia.toString());
        System.out.println(amelia); // toString is called automatically when printing a class

        // Try to comment out the toString method in class User to see the default one in action
    }
}
