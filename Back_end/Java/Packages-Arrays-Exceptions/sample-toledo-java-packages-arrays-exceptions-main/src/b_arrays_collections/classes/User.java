package b_arrays_collections.classes;

public class User {

    private String name;
    private int age;
    private String location;

    public User() {
    }

    public User(String name, int age) {
        if (age >= 0) {
            this.age = age;
        }
        setName(name);
    }

    public User(String name, int age, String location) {
        this(name, age);
        this.location = location;
    }


    public void setAge(int age) {
        if (age > 0) {
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

    public boolean equals(User otherUser) {
        return this.name.equals(otherUser.getName()) && this.age == otherUser.getAge();
    }

}
