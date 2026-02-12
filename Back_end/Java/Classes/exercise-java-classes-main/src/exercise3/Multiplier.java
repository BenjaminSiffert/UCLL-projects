package exercise3;

public class Multiplier {
    private int number;

    public Multiplier(int number){
        this.number = number;
    }

    public int multiply(int multiplier){
        number = this.number * multiplier;
        return number;
    }

    public int getNumber() {
        return number;
    }
}
