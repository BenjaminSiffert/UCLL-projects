package b_polymorphism;

public class Engine extends Part {

    private int horsepower;

    public Engine(String identifier, String producer, String description, int horsepower) {
        super(identifier, producer, description);
        this.horsepower = horsepower;
    }

    public int getHorsepower() {
        return horsepower;
    }

    public String printAllInfo() {
        return "I am an engine with properties:" + super.getDescription() + " "
                + super.getProducer() + " "
                + super.getIdentifier()
                + horsepower;
    }
}
