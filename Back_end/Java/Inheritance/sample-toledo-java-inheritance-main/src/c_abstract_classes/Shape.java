package c_abstract_classes;


public abstract class Shape {
    String color;

    public Shape(String color) {
        this.color = color;
    }

    // Abstract method (no implementation)
    protected abstract double calculateArea();

    // Concrete method
    public void displayColor() {
        System.out.println("Color: " + color);
    }
}