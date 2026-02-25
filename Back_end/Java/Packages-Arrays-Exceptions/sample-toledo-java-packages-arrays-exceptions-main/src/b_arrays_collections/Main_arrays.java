package b_arrays_collections;

public class Main_arrays {
    public static void main(String[] args) {
        int[] numbers = new int[3];
        numbers[0] = 5;
        numbers[1] = -3;
        numbers[2] = 1;
        System.out.println("First number: " + numbers[0]);
        System.out.println("Last number: " + numbers[numbers.length - 1]);
        //System.out.println("Array Index Out Of Bounds Exception: " + numbers[10]);
        // Throws Error

        double[] doubles = {1.5, 2.7, 3.8};

        // for loop using indices
        for (int i = 0; i < doubles.length; i++) {
            System.out.println(doubles[i] + " ");
        }
        // short loop with forEach
        for (double number : doubles) {
            System.out.println(number);
        }

        // array as parameter
        add3(numbers);
        for (int number : numbers)
            System.out.print(number);
        System.out.printf("\n");
    }

    public static void add3(int[] numbersAsParameter) {
        for (int j = 0; j < numbersAsParameter.length; j++) {
            numbersAsParameter[j] = numbersAsParameter[j] + 3;
        }
    }
}
