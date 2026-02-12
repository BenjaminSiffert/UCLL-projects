package exercise3;

public class Application {

    public static void main(String[] args) {
        Multiplier multiplier1 = new Multiplier(3);
        multiplier1.multiply(2);
        System.out.println(multiplier1.getNumber());
    }
}
