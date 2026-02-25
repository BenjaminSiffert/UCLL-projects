package b_arrays_collections.classes;

public class Car implements Vehicle {

    @Override
    public void travel() {
        System.out.println("The car drives home");
    }

    public void fueling() {
        System.out.println("The car filled up with 20l.");
    }
}
