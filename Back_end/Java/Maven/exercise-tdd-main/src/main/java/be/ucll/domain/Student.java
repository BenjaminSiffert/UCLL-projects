//package be.ucll.domain;

//public class Student extends User {

//    private String studies;
//
//    public Student(String name, int age, String email, String studies) {
//        super(name, age, email);
//        setStudies(studies);
//    }
//
//    public void setStudies(String studies) {
//        if (studies.isBlank()) {
//            throw new RuntimeException("Studies must be non-empty string");
//        }
//        this.studies = studies;
//    }
//
//    public String getStudies() {
//        return this.studies;
//    }
//
//    @Override
//    public String toString() {
//        return super.toString() + "; Studies: " + getStudies();
//    }

//}