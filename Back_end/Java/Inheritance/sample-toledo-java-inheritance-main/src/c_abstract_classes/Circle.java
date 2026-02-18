package c_abstract_classes;

public class Circle extends Shape {
    double radius;

    public Circle(String color, double radius) {
        super(color);
        this.radius = radius;
    }

    // Implementation of the abstract method
    @Override
    public double calculateArea() {
        return Math.PI * radius * radius;
    }
}
