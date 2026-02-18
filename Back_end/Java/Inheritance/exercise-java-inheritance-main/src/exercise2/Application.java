package exercise2;

public class Application {

    public static void main(String[] args) {
        A a = new B();
        B b = new B();

        // 1
        System.out.println("Output of a.foo(4): ");
        a.foo(4);

        // 2
        System.out.println("\n\rOutput of b.foo(3.6): ");
        b.foo(3.6);

        // 3
        System.out.println("\n\rOutput of b.foo(4, 4): ");
        b.foo(4, 4);

        System.out.println("\n\rOutput of a.foo(4, 4): ");
        a.foo(4, 4);

        System.out.println("\n\rOutput of b.foo(4.1, 4.2: ");
        b.foo(4.1, 4.2);

        System.out.println("\n\rOutput of a.foo(4.1, 4.2): ");
        a.foo(4.1, 4.2);

        // If you change B.foo(int a, int b) to accept doubles instead of ints (and then also A.foo(int a)),
        //   how does this change the outcome of 3 above?
        // Why?
    }
}
