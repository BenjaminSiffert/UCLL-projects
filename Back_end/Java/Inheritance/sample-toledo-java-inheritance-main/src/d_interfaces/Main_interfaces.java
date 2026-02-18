package d_interfaces;

public class Main_interfaces {
    public static void main(String[] args) {
        Vehicle myCar = new Car();         // Upcasting to interface type
        Vehicle myBike = new Bicycle();

        myCar.travel();  // Output: The car drives on the road.
        myBike.travel(); // Output: The bicycle pedals along the path.

        Car myCarAsCar = (Car) myCar; // Downcasting to implementing type
    }
}


