package main.java.c_controlStructures;

import java.time.LocalDate;

public class Main_logical_operators {

    public static void main(String[] args) {
        int birth = 1933, death = 2010;
        int today = LocalDate.now().getYear(); // returns the current year as int

        System.out.println("Is the year of death after the year of birth and before the present day?");
        System.out.println(death > birth && death < today);

        System.out.println("Is the year of death either before the year of birth or after the present year?");
        System.out.println(death < birth || death > today);

        System.out.println("Is the year of birth NOT before the year of death?");
        System.out.println(!(birth < death));
    }
}
