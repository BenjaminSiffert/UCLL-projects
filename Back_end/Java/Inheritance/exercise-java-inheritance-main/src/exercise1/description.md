# Teacher and Student

Create a class `Person`, you should be able to use the class as follows:

```java
Person eddy = new Person("Eddy Merckx", "Binkomstraat 1, 3391 Meensel-Kiezegem");
Person tom = new Person("Tom Boonen", "Boonenstraat 15 2560 Mol");
System.out.println(eddy);
System.out.println(tom);
```

Returns

```console
Eddy Merckx
    Binkomstraat 1, 3391 Meensel-Kiezegem
Tom Boonen
    Boonenstraat 15 2560 Mol
```

## Student

Create a class `Student` that inherits from `Person`. When created, the class starts with 0 credits,
each time the student studies, its credits go up. You should be able to use the class as follows:

```java
Student ollie = new Student("Ollie", "Naamsestraat 25, 3000 Leuven");
System.out.println(ollie);
System.out.println("Study credits " + ollie.credits());
ollie.study();
System.out.println("Study credits "+ ollie.credits());
```
returns as output

```console
Ollie
    Naamsestraat 25, 3000 Leuven
Study credits 0
Study credits 1
```

The class `Student` inherits the method `toString()` from the class `Person`. Now in `Student`, write its own
`toString()` method so that you can use the class as follows:

```java
Student ollie = new Student("Ollie", "Naamsestraat 25, 3000 Leuven");
System.out.println(ollie);
ollie.study();
System.out.println(ollie);
```

Returns as output:

```console
Ollie
    Naamsestraat 25, 3000 Leuven
    Study credits 0
Ollie
    Naamsestraat 25, 3000 Leuven
    Study credits 1
```

## Teacher

Create a class `Teacher` that inherits from `Person`. You should be able to use the class as follows:

```java
Teacher eddy = new Teacher("Eddy Merckx", "Binkomstraat 1, 3391 Meensel-Kiezegem", 1200);
Teacher tom = new Teacher("Tom Boonen", "Boonenstraat 15 2560 Mol", 2400);
System.out.println(eddy);
System.out.println(tom);
```

returns as output:

```console
Eddy Merckx
    Binkomstraat 1, 3391 Meensel-Kiezegem
    salary 1200 euro/month
Tom Boonen
    Boonenstraat 15 2560 Mol
    salary 2400 euro/month
```