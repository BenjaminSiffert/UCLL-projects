package exercise1;

public class Person {
    private String name;
    private String adres;

    public Person( String name, String adres){
        this.name = name;
        this.adres = adres;
    }

    public String getName() {
        return name;
    }

    public String getAdres() {
        return adres;
    }
    @Override
    public String toString() {
        return (this.getName() + '\n' + "      " + this.getAdres() + "\n" + "--------------" );
    }
}
