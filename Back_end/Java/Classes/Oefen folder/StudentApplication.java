
public class StudentApplication{
    public static void main(String[] args){
        Student student1 = new Student("Arnaud", 19, "1TI-2");
        Student student2 = new Student("Benjamin", 20, "1TI-2");

        System.out.println(student1.getNaam());
        System.out.println(student2.getNaam());

    }
}
