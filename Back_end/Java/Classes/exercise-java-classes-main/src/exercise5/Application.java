package exercise5;

public class Application {

    public static void main(String[] args) {
    User user1 = new User("Yessin", "deman" ,  36);
    User user2 = new User("Sam", "Brandweerman");
    user2.age(user2.getAge());
    System.out.println(user1.toString());
    System.out.println(user2.toString());

    }
}
