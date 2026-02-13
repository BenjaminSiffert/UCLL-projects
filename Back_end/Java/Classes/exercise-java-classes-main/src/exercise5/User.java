package exercise5;

public class User {
    private String firstName;
    private String lastName;
    private int age;

    public User(String firstName, String lastName, int age) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
    }
    public User(String firstName, String lastName){
        this.firstName =firstName;
        this.lastName = lastName;
        age = 0;
    }

    public int age(int age) {
        return this.setAge(age + 1);
    }

    public int getAge() {
        return age;
    }

    public int setAge(int age) {
        this.age = age;
        return age;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String toString() {
        return "First name: " + getFirstName() + "  Last name: "+ getLastName()+ "  age: " + getAge();
    }
}