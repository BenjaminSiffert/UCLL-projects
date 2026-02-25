package c_exceptions;

import java.util.ArrayList;
import java.util.List;

public class Main_catch_one_exception {

    public static void main(String[] args) {
        // catch Java Built-in exception
        List<String> names = new ArrayList<>();
        names.add("first");
        try {
            String result = names.get(2);
            System.out.println("result" + result);
        } catch (IndexOutOfBoundsException e) {
            System.out.println("Exception caught: No index 2 in array");
        }
        System.out.println("We go on"); // only executed if no exception is thrown
    }
}
