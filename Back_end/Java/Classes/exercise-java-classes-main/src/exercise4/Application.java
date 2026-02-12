package exercise4;

public class Application {

    public static void main(String[] args) {
        Flat flat1 = new Flat(3,50, 100);
        Flat flat2 = new Flat(4,70, 90);

        System.out.println(flat1.priceDifference(flat2));
    }
}
