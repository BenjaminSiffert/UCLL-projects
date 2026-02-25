package c_exceptions.domain;

public class OwnException extends Exception {

    private String field;

    public OwnException(String field, String message) {
        super(message);
        this.field = field;
    }

    public String getField() {
        return field;
    }
}
