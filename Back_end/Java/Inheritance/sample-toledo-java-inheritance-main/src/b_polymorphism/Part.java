package b_polymorphism;

public class Part {

    private String identifier;
    private String producer;
    private String description;

    public Part(String identifier, String producer, String description) {
        this.identifier = identifier;
        this.producer = producer;
        this.description = description;
    }

    public String getIdentifier() {
        return identifier;
    }

    public String getProducer() {
        return producer;
    }

    public String getDescription() {
        return description;
    }

    public String printAllInfo() {
        return "I am a part";
    }
}
