package a_packages;

public class Main_packageprivate {

    public static void main(String[] args) {
        User johnny = new User("Johnny", 32, "Somewhere around town", false);

        // Works, name is public
        System.out.println(johnny.name);

        // Does not work, age is private
        // System.out.println(johnny.age);

        // Works, isStudent is package-private
        // This will stop working if the classes are in separate packages
        System.out.println(johnny.isStudent);

        // Works, protected is actually not only for subclasses, but is also visible in the same package
        // Best to forget this and to only use protected if you want visibility in subclasses
        System.out.println(johnny.address);
    }
}
