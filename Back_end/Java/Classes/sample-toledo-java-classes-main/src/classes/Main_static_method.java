package classes;

public class Main_static_method {

    public static void main(String[] args) {

        // static method calls
        User julie = new User("Julie", 24);
        User emma = new User("Emma", 8);

        System.out.println(User.sameName(julie, emma));
        System.out.println(Math.max(2, 5));
        System.out.println(Math.sqrt(4));
    }
}
