package b_polymorphism;

public class Main_polymorphism {

    public static void main(String[] args) {

        // Polymorphism
        Engine mercedesEngine = new Engine("0x25z8", "Mercedes", "Nice red car", 521);
        Part volkswagenPart = new Engine("5r789r", "Volkswagen", "Fast", 684);

        // Engine peugeotEngine = new Part("125t87", "Peugeot", "silent");
        Part mercedesPart = mercedesEngine;
        // Engine volkswagenEngine = volkswagenPart;
        // Part mercedesPart = (Part) mercedesEngine;
        Engine volkswagenEngine2 = (Engine) volkswagenPart;
        System.out.println(volkswagenPart.printAllInfo());
        System.out.println(volkswagenEngine2.printAllInfo());

        // Try the following experiments (starting from the given code every time)
        // 1. comment out printAllInfo in Engine, how does the code change?
        // 2. comment out printAllInfo in Part, why does the code not compile?
        // 3. play with the casts in the code above, can you explain why the output changes in the way it does?

    }

}
