package exercise1;

public class Application {

    public static void main(String[] args) {
        Account account1 = new Account("Bennies account", 100);
        System.out.println(account1.balance());
        account1.deposit(20);
        System.out.println(account1.balance());
        account1.withdraw(40);
        System.out.println(account1.balance());

    }
}
