package c_exceptions;

import java.util.List;

public class Main_catch_multiple_finally {

    public static void main(String[] args) {
        List<String> names = null;
        try {
            String result = names.get(2);
        } catch (IndexOutOfBoundsException e) {
            System.out.println("Exception caught: No index 2 in array");
        } catch (NullPointerException e) {
            System.out.println("List names has no value");
        } finally {
            System.out.println("This text is always printed");
        }
    }

    // These are runtime exceptions
    // you can remove these and your program is still allowed to run, but it can crash
}
