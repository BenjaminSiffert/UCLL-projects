public class Student{
    private  String naam;
    private int leeftijd;
    private String reeks;

    public Student(String naam, int leeftijd, String reeks){
        this.naam = naam;
        this.leeftijd = leeftijd;
        this.reeks = reeks;
    }
    
    public String getNaam(){
            return this.naam;
    }
    public int getleeftijd(){
            return this.leeftijd;
    }
    public String getReeks(){
            return this.reeks;
    }

    public void setNaam(String naam) {
        this.naam = naam;
    }

    public void setLeeftijd(int leeftijd) {
        this.leeftijd = leeftijd;
    }

    public void setReeks(String reeks) {
        this.reeks = reeks;
    }
    
}
