package be.ucll.repository;

import java.util.ArrayList;
import java.util.List;

import be.ucll.domain.User;

public class UserRepository {

    private List<User> userRepository = new ArrayList<>();

    public UserRepository() {
        User amelia = new User("Amelia", 44);
        User ben = new User("Ben", 15);
        User charles = new User("Charles", 65);
        User diana = new User("Diana", 13);
        addUser(amelia);
        addUser(ben);
        addUser(charles);
        addUser(diana);

    }

    public List<User> getAllUsers() {
        return userRepository;
    }

    public List<User> getUsersWithAgeOlderThan(int age) {
        // List<User> users = new ArrayList<User>();
        // for (User user : userRepository) {
        //     if (user.getAge() > age) {
        //         users.add(user);
        //     }
        // }
        // return users;

        return userRepository.stream().filter(user -> user.getAge() > age).toList();
    }

    public boolean addUser(User user) {
        return userRepository.add(user);
    }

}
