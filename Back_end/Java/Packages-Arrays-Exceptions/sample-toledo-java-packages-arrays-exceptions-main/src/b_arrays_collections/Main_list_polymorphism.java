package b_arrays_collections;

import b_arrays_collections.classes.Bicycle;
import b_arrays_collections.classes.Car;
import b_arrays_collections.classes.Vehicle;

import java.util.ArrayList;
import java.util.List;

public class Main_list_polymorphism {
    public static void main(String[] args) {
        List<Vehicle> vehicles = new ArrayList<>();
        vehicles.add(new Car());
        vehicles.add(new Bicycle());

        for (Vehicle vehicle : vehicles) {
            vehicle.travel();
        }
    }
}
