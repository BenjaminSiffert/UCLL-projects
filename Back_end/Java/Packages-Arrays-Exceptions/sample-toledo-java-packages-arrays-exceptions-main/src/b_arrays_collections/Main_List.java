package b_arrays_collections;

import b_arrays_collections.classes.User;

import java.util.ArrayList;
import java.util.List;

public class Main_List {
    public static void main(String[] args) {
        User amelia = new User("Amelia", 44);
        User ben = new User("Ben", 5);
        User chris = new User("Chris", 15);
        List<User> users = new ArrayList<>();

        users.add(amelia);
        users.add(ben);
        users.add(chris);

        System.out.println("Length of the list:" + users.size());

        // print users whose name contains character 'e'
        for (User user : users) {
            if (user.getName().contains("e"))
                System.out.println(user.getName());
        }

        // List methods
        users.get(0); // get the object at index 0
        users.indexOf(ben); // returns the index of the object ben
        users.contains(amelia); // returns true if the list contains the object amelia
        users.remove(chris); // removes the object chris
        users.add(1, chris); // inserts the object chris at index 1
        users.set(1, amelia); // replaces the element at index 1
        users.isEmpty(); // returns true if this list contains no elements
    }
}
