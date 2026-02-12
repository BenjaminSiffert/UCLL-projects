import classes.User;

public class Main_class_null {

    public static void main(String[] args) {
        User nobody = null;
        User noname; // variable can not be used because it is not initialized
        if (nobody == null)
            System.out.println("NoBody is null");
        nobody.setAge(2); // throws NullPointerException
    }
}
