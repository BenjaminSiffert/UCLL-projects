package exercise1;

public class Account {

    private String name;
    private double balance;

    public Account(String name, double balance) {
        this.name = name;
        this.balance = balance;
    }

    public void withdraw(double amount) {
        balance = balance - amount;

        if (balance > 0) {
            balance = 0;
        }
    }

    public void deposit(double amount) {
        balance = balance + amount;
    }

    public double balance() {
        return balance;
    }

    @Override
    public String toString() {
        return name + ": " + balance;
    }
}
