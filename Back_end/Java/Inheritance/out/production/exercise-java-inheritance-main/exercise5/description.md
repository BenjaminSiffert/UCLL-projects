# Packable

Look at the given interface `Packable`.

## Book and CD

Create two implementations for the interface `Packable`:
- `Book` with constructor `Book(String author, String title, double weight)`
- `CD` with constructor `CD(String artist, String nameCD, int publication year)`
    - Each CD weighs 0.1 kg

Usage of the classes looks like this:

```java
Book book1 = new Book("Fyodor Dostoevsky", "Crime and Punishment", 2);
Book book2 = new Book("Robert Martin", "Clean Code", 1);
Book book3 = new Book("Kent Beck", "Test Driven Development", 0.5);

CD cd1 = new CD("Pink Floyd", "Dark Side of the Moon", 1973);
CD cd2 = new CD("Wigwam", "Nuclear Nightclub", 1975);
CD cd3 = new CD("Rendezvous Park", "Closer to Being Here", 2012);

System.out.println(book1);
System.out.println(book2);
System.out.println(book3);
System.out.println(cd1);
System.out.println(cd2);
System.out.println(cd3);
```

returns

```console
Fyodor Dostoevsky: Crime and Punishment
Robert Martin: Clean Code
Kent Beck: Test Driven Development
Pink Floyd: Dark Side of the Moon (1973)
Wigwam: Nuclear Nightclub (1975)
Rendezvous Park: Closer to Being Here (2012)
```

## Box

Create a class `Box`:
- Any object that implements `Packable` can be placed in a box
- A box has room for up to 3 packable objects
- The maximum allowed weight for a box is given when constructing the object
  - The weight of all objects in the box must never exceed the maximum weight
- Create a private method `weight()` to calculate the weight of the contents

Usage of the class looks like this:

```java
Box box = new Box(3);

box.add(new Book("Fyodor Dostoevsky", "Crime and Punishment", 2)) ;
box.add(new Book("Robert Martin", "Clean Code", 0.9));
box.add(new CD("Pink Floyd", "Dark Side of the Moon", 1973));

System.out.println(box);
```

Returns

```console
Box: 3 items, total weight 3.0 kg
```

## Box in Box

Now let `Box` also implement `Packable`. What can you do extra now? Try this out in the main method!
