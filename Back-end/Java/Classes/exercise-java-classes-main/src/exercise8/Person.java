package exercise8;

public class Person {

    private String name;
    private Person mother;
    private Person father;

    public Person(String name, Person mother, Person father) {
        this.name = name;
        this.mother = mother;
        this.father = father;
    }

    public boolean isSiblingOf(Person person) {
        // Return "true" if this object is the sibling of the person given as a parameter
        return false;
    }

    public boolean isGrandparentOf(Person person) {
        // Return "true" if this object is the grandparent of the person given as a parameter
        return false;
    }

    public boolean isGrandchildOf(Person person) {
        // Return "true" if this object is the grandchild of the person given as a parameter
        return false;
    }
}
