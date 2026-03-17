package be.ucll.domain;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class User {

    private String name;
    private int age;
    private List<Integer> membershipYears = new ArrayList<Integer>();
    private String email;
    private String password;

    public User(String name, int age, String email) {
        setAge(age);
        setName(name);
        setEmail(email);
        this.password = null;
    }
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        if(getAge() < 18){
            throw new RuntimeException("Only adults can have a password");
        }
        else if(password.length() < 3 || password.isBlank()){
            throw new RuntimeException("Password must have at least 3 characters");
        }
        else{
        this.password = password;
    }}
    public String getEmail() {
        return email;
    }

    private void setEmail(String email) {
        if (!email.contains("@") || !email.contains(".")) {
            throw new RuntimeException("Email must contain dot and @.");
        }
        this.email  = email;
    }
    public int getAge() {
        return this.age;
    }

    public void setAge(int age) {
        if (age < 0 || age >150) {
            throw new RuntimeException("Age must be positive and not more than 150");
        }
        this.age = age;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        if (name == null || name.isBlank()) {
            throw new RuntimeException("Name can not be empty");
        }
        this.name = name;
    }

    public int countYearsOfMembership() {
        return membershipYears.size();
    }

    public void addMembershipYear(int year) {
        membershipYears.add(year);
    }
    public boolean isPasswordCorrect(String password){
        return Objects.equals(this.password, password);

        }
    @Override
    public String toString() {
        return "User " + getName() +"(" + getEmail() + ") is "+ getAge() + " years old.";
    }

    public int countMembershipYearsAfter1999() {
        int result = 0;
        for (Integer year : membershipYears) {
            if (year > 1999) {
                result++;
            }
        }
        return result;
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
