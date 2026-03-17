package be.ucll;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class LibraryApplication {

    public static void main( String[] args ) {
        SpringApplication.run(LibraryApplication.class, args);
//        Book book = new Book("The Hobbit", "J.R.R. Tolkien", "9780261103283", 1937, 5);
//        Book book2 = new Book("Pride and Prejudice", "Jane Austen", "9781529954265", 1813, 15);
//
//        Magazine magazine = new Magazine("National Geographic", "nature lovers", "2049-3630", 2023, 10);
//        Magazine magazine2 = new Magazine("Game Informer", "gaming editorial team", "0176-6996", 2026, 20);
//
//        List<Publication> publications = new ArrayList<>();
//        publications.add(book);
//        publications.add(magazine);
//        publications.add(book2);
//        publications.add(magazine2);
//
//        print(publications);
//
//        // Register some users and loans
//        // ....
//
//        // Print the library again
//        System.out.println("Printing after registering loans: ");
//        print(publications);
//
//        // Return all loans
//        // ....
//
//        // Print the library again
//        System.out.println("Printing after returning loans: ");
//        print(publications);
    }

//    public static void print(List<Publication> publications) {
//        System.out.println("Publications in the library: ");
//        for (Publication publication : publications) {
//            System.out.println(publication);
//        }
//        System.out.println("-----------------------------\n");
//    }
}
