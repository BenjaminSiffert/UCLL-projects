package be.ucll.unit.domain;

import be.ucll.domain.User;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UserTest {

    private String validNameAmelia;
    private int validAgeAmelia;

    @BeforeEach
    public void setUp() {
        validNameAmelia = "Amelia";
        validAgeAmelia = 44;
    }

    // constructor
    // happy case
    @Test
    void givenValidValues_whenCreatingUser_thenUserIsCreatedWithThoseValues() {
        // when
        User amelia = new User(validNameAmelia, validAgeAmelia);

        // then
        assertNotNull(amelia);

        assertEquals(validNameAmelia, amelia.getName());
        assertEquals(validAgeAmelia, amelia.getAge());
    }

    // constructor
    // unhappy case
    // invalid negative age
    @Test
    void givenInvalidNegativeAge_whenCreatingUser_thenUserIsCreatedWithAge0() {
        // when
        User amelia = new User(validNameAmelia, -5);
        // then
        assertNotNull(amelia);
        assertEquals(validNameAmelia, amelia.getName());
        assertEquals(0, amelia.getAge());
    }

    // constructor
    // unhappy case
    // empty name throws error
    @Test
    void givenValidAgeAndEmptyName_whenCreatingUser_thenDomainExceptionIsThrown() {
        // given 
        String emptyName = "";

        // when
        // then
        Exception ex = assertThrows(RuntimeException.class, () -> new User(emptyName, validAgeAmelia));
        assertEquals("Name can not be empty", ex.getMessage());
    }
}
