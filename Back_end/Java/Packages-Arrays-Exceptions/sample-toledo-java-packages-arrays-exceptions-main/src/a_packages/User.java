package a_packages;

public class User {

    // Package declaration on top of the class
    // If you try to move this class to another package the compiler will throw an error!

    public String name;             // public
    private int age;                // private
    protected String address;       // protected
    boolean isStudent;              // package-private

    public User(String name, int age, String address, boolean isStudent) {
        this.name = name;
        this.age = age;
        this.address = address;
        this.isStudent = isStudent;
    }
}
