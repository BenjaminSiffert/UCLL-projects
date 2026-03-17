package be.ucll.unit.service;

import be.ucll.model.User;
import be.ucll.repository.UserRepository;
import be.ucll.service.UserService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.util.List;

public class ServiceTest {
        @Test
        public void
        givenRepository_whenCallingAllUsers_allUsersFromRepositoryArePresent() {
            UserRepository repository = new UserRepository();
            UserService service = new UserService(repository);

            List<User> result = service.getAllUsers();

            Assertions.assertEquals(repository.getUsers().size(), result.size());
            Assertions.assertTrue(repository.getUsers().containsAll(result));
        }

}
