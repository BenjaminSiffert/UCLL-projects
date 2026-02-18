package exercise2;

public class B extends A {

    public void foo( double a ) {
        foo( 5 );
        System.out.println("a2");
    }

    public void foo( int a ) {
        super.foo(a);
        System.out.println("a3");
    }

    public void foo( int a, int b ) {
        super.foo(a);
        System.out.println("a4");
    }
}
