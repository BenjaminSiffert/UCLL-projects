package c_exceptions.domain;

public class User {

    private String name;

    // Since setAge can throw a checked exception, we need to decide:
    // do we handle it here with try catch or do we say that the constructor can also throw it?
    public User(String name, int age) throws OwnException {
        setName(name);
    }

    public User() {
    }

    public String getName() {
        return name;
    }

    // Checked exceptions need to be added to the method signature
    public void setName(String name) throws OwnException {
        if (name == null || name.isBlank()) {
            throw new OwnException("Name", "Name can not be empty");
        }
        this.name = name;
    }
}
