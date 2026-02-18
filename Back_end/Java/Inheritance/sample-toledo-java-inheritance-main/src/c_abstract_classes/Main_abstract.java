package c_abstract_classes;

public class Main_abstract {
    public static void main(String[] args) {
        Circle circle = new Circle("red", 5);
        System.out.println(circle.calculateArea());
        circle.displayColor();
    }
}
