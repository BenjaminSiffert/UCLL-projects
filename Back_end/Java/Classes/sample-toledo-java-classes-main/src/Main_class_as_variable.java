import classes.User;

public class Main_class_as_variable {

    public static void main(String[] args) {

        // variable with a primitive type
        int m = 5;
        int n = m;
        System.out.printf("a=%s; b=%s\n", m, n); // result: a=5; b=5.
        n = 15;
        System.out.printf("a=%s; b=%s\n", m, n); // result: a=5; b=15.

        // variables with class as their type
        User maria = new User("Maria", 25);
        User nathan = maria;
        System.out.printf("Maria: %s; Nathan: %s\n", maria.getAge(), nathan.getAge());
        // result: Maria: 5; Nathan: 5
        nathan.setAge(105);
        System.out.printf("Maria: %s; Nathan: %s\n", maria.getAge(), nathan.getAge());
        // result: Maria: 105; Nathan: 105

    }
}
