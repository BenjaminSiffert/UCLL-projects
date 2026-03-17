package be.ucll.domain;

import java.util.Objects;

public class User {

    private String name;
    private int age;

    public User(String name, int age) {
        setAge(age);
        setName(name);
    }

    public int getAge() {
        return this.age;
    }

    public void setAge(int age) {
        if (age >= 0) {
            this.age = age;
        }
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        if (name == null || name.isBlank()) {
            throw new RuntimeException("Name can not be empty");
        }
        this.name = name;
    }

    public String toString() {
        return "User " + this.getName() + " is " + this.getAge() + " years old.";
    }

    public boolean equals(User otherUser) {
        return this.name.equals(otherUser.getName()) && this.age == otherUser.getAge();
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 41 * hash + Objects.hashCode(this.name);
        hash = 41 * hash + this.age;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final User other = (User) obj;
        if (this.age != other.age) {
            return false;
        }
        return Objects.equals(this.name, other.name);
    }
}
