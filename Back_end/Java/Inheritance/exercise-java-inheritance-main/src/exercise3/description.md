# Animals

Create an abstract class `Animal`:
- The class has a constructor that takes the animal's name as an argument
- The class has a method `public void sleep()` that prints "\<name-animal\> sleeps"
- The class has a method `public void eat()` that prints "\<name-animal\> eats"
- The class has a method `public String getName()` that returns the animal's name

## Dog

Create a class `Dog` that inherits from `Animal`.
  - The class has a constructor that takes the dog's name as an argument
  - The class has a constructor with no arguments that names the dog "Dog"
  - The class has a method `public void bark()` that prints "\<name-animal\> barks"
  - The methods `sleep` and `eat` are unchanged from `Animal`

Usage of the class looks like this:

```java
Dog dog = new Dog();
dog.bark();
dog.eat();

Dog amaretto = new Dog("Amaretto");
amaretto.bark();
```

returns as output

```console
Dog barks
Dog eats
Amaretto barks
```

## Cat

Create a class `Cat` that inherits from `Animal`.
  - The class has a constructor that takes the name of the cat as an argument
  - The class has a constructor with no arguments that names the cat "Cat"
  - The class has a method `public void meow()` that prints "\<name-animal\> meows"
  - The methods `sleep` and `eat` are unchanged from `Animal`

Usage of the class looks like this:

```java
Cat cat = new Cat();
cat.meow();
cat.eat();

Cat garfield = new Cat("Garfield");
garfield.meow();
```

returns as output

```console
Cat meows
Cat eats
Garfield meows
```

## Can Make Sound

Create an interface `CanMakeSound`
  - The interface has one method `void createSound()`
  - `Dog` and `Cat` must implement the interface via the methods created earlier

Try out your classes by working with the interface as a type in the main method.