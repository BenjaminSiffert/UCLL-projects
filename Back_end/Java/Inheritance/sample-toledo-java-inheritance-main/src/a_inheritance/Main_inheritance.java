package a_inheritance;

import java.util.ArrayList;
import java.util.List;

public class Main_inheritance {

    public static void main(String[] args) {
        Engine engine = new Engine("A102", "Motor Company", "A small motor", 2);
        System.out.println(engine.getDescription());
        System.out.println(engine.printAllInfo());
        Wheel wheel = new Wheel("Wheel A", "Motor Company", "A small motor");
        System.out.println(wheel.getDescription());
        List<Part> parts =
                new ArrayList<Part>();
        parts.add(engine);
        parts.add(wheel);

    }

}
