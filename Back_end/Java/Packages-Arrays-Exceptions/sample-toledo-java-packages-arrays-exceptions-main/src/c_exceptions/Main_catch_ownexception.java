package c_exceptions;

import c_exceptions.domain.OwnException;
import c_exceptions.domain.User;

public class Main_catch_ownexception {

    public static void main(String[] args) {
        User emptyName = null;
        //new User();
        try {
            emptyName.setName("   ");
        } catch (OwnException e) {
            System.out.println("You got an error with message: ");
            System.out.println(e.getMessage());
        }
    }

    // This is a checked exception, you are obliged to catch and handle it
    // You can not remove the try-catch like with runtime exceptions
}
