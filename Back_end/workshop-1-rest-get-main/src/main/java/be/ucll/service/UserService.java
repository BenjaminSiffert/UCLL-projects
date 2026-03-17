package be.ucll.service;

import be.ucll.model.User;
import be.ucll.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UserService {

    private UserRepository userRepository;

    @Autowired
    public UserService(UserRepository userRepository ){
        this.userRepository = userRepository;
    }
    public List<User> getAllUsers() {
        return userRepository.getUsers();
    }
    public List<User> getUsersByName(String name){
        if (name == null || name.isBlank()){
            return getAllUsers();
        };
        List<User> result = userRepository.getUsersByName(name);
        if(result.isEmpty()){
            throw new RuntimeException("No user with that name found");
        }
        return result;
    }
    public List<User> getAllAdultUsers(){return userRepository.usersOlderThan(18);}
    public List<User> getUsersBetweenAge(int min, int max){
        if(max - min < 0 || max - min >150){
            throw new RuntimeException("Invalid range");
        }
        return userRepository.getUsersBetweenAge(min, max);
    }
    public User addUser(User user){
        if(userRepository.userExists(user.getEmail())){
            throw new RuntimeException("Users already exists");
        }
        return userRepository.save(user);
    }
}
