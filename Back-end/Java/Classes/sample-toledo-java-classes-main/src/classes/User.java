package classes;

import java.util.Objects;

public class User {

    private String name;
    private int age;
    private String location;

    public User() {
    }

    public User(String name, int age) {
        setAge(age);
        setName(name);
    }

    public User(String name, int age, String location) {
        this(name, age);
        this.location = location;
    }

    public void setAge(int age) {
        if (age >= 0) {
            this.age = age;
        }
    }

    public int getAge() {
        return this.age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void celebrateBirthday() {
        age++;
        System.out.println("Happy birthday, " + name + "! You are now " + age + " years old.");
    }

    // static method
    public static boolean sameName(User user1, User user2) {
        // if both are null they are the same, otherwise not
        if (user1.getName() == null) {
            return user2.getName() == null;
        }

        // we know that the names are not null, so we can safely compare
        return user1.getName().equals(user2.getName());
    }

    @Override
    public boolean equals(Object o) {
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return age == user.age && Objects.equals(name, user.name) && Objects.equals(location, user.location);
    }

    @Override
    public String toString() {
        return "User has name " + getName() + " and age " + getAge();
    }

    @Override
    public int hashCode() {
        return Objects.hash(name, age, location);
    }
}
