package be.ucll.unit.domain;

import be.ucll.domain.User;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UserTest {

    // given
    private String validNameAmelia;
    private int validAgeAmelia;
    private String validEmailAmelia;
    private String validPasswordAmelia;

    @BeforeEach
    public void setUp() {
        validNameAmelia = "Amelia";
        validAgeAmelia = 44;
        validEmailAmelia = "amelia.anderson@ucll.be";
        validPasswordAmelia = "iamnotgoingtotellyou";
    }

//     //constructor
//     //happy case
     @Test
     void givenValidValues_whenCreatingUser_thenUserIsCreatedWithThoseValues() {

         User amelia = new User(validNameAmelia,validAgeAmelia, validEmailAmelia);
        assertNotNull(amelia);
         assertEquals(validNameAmelia, amelia.getName());
         assertEquals(validAgeAmelia, amelia.getAge());
         assertEquals(0, amelia.countYearsOfMembership());
         assertEquals(validEmailAmelia, amelia.getEmail());
     }

//     //constructor
//     //unhappy case
//     //invalid negative age
     @Test
     void givenInvalidNegativeAge_whenCreatingUser_thenRuntimeExceptionIsThrown() {
         //when, then
         Exception ex = assertThrows(RuntimeException.class, () -> new User(validEmailAmelia, -5, validEmailAmelia));
         assertEquals("Age must be positive and not more than 150", ex.getMessage());
     }

     //constructor
     //unhappy case
     //invalid email (no @)
     //TIP: go to the Java API to the String class and use the method contains
     @Test
     void givenInvalidEmail_whenCreatingUser_thenRuntimeExceptionIsThrown() {
         //when, then
         Exception ex = assertThrows(RuntimeException.class, () -> new User(validNameAmelia, validAgeAmelia,
                 "amelia.anderson.ucll.be"));
         assertEquals("Email must contain dot and @.", ex.getMessage());
     }

     //isPasswordCorrect
     //happy case
     @Test
     void givenValidUser_whenCheckingPasswordWithCorrectPassword_thenTrueIsReturned() {
         //given
         User amelia = new User(validNameAmelia, validAgeAmelia, validEmailAmelia);
         amelia.setPassword(validPasswordAmelia);
         //when
         boolean correctPassword
                 = amelia.isPasswordCorrect("iamnotgoingtotellyou");
         //then
         assertTrue(correctPassword);
     }

     //isPasswordCorrect
     //unhappy case
     @Test
     void givenValidUser_whenCheckingPasswordWithIncorrectPassword_thenFalseIsReturned() {
         //given
         User amelia = new User(validNameAmelia, validAgeAmelia, validEmailAmelia);
         amelia.setPassword(validPasswordAmelia);
         //when
         boolean correctPassword = amelia.isPasswordCorrect("justguessing");
         //then
         assertFalse(correctPassword);
     }

     // setPassword
     //happy case
     @Test
     void givenValidPasswordAndAdultUser_whenCreatingUser_thenPasswordIsSet() {
         //when
         User amelia = new User(validNameAmelia, validAgeAmelia,
                 "amelia.anderson@ucll.be");
         amelia.setPassword(validPasswordAmelia);
         // then
         assertTrue(amelia.isPasswordCorrect(validPasswordAmelia));
     }

     // setPassword
     //unhappy case
     //invalid password (empty string)
     //TIP: go to the Java API to the String class and use the method isBlank
     @Test
     void givenInvalidPassword_whenCreatingUser_thenRuntimeExceptionIsThrown() {
         //when
         User Amelia = new User(validNameAmelia, validAgeAmelia,
                 "amelia.anderson@ucll.be");
         //then
         Exception ex = assertThrows(RuntimeException.class, () -> Amelia.setPassword("       "));
         assertEquals("Password must have at least 3 characters", ex.getMessage());
     }

     // setPassword
     //unhappy case
     //no adult user
     @Test
     void givenValidPasswordAndNoAdult_whenSettingPassword_thenRuntimeExceptionIsThrown() {
         //when
         User Amelia = new User(validNameAmelia, 5,
                 "amelia.anderson@ucll.be");
         //then
         Exception ex = assertThrows(RuntimeException.class, () -> Amelia.setPassword("       "));
         assertEquals("Only adults can have a password", ex.getMessage());
     }

     //toString
     //happy case
     @Test
     void givenValidUser_whenToString_thenUserObjectisReturnedInStringRepresentation() {
         //given
         User amelia = new User(validNameAmelia, validAgeAmelia, validEmailAmelia);
         //when
         String result = amelia.toString();
         //then
         assertEquals("User Amelia(amelia.anderson@ucll.be) is 44 years old.", result);
     }
}
