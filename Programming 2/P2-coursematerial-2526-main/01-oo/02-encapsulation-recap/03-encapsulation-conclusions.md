# Encapsulation conclusions
In the previous exercise, we created a new datastructure `Queue` that had **some** (but not all) of the functionality of `List`. In conclusion:
- A `list` is a general purpose data structure that allows you to access any item you want, and add or remove items anywhere you want.
- A `Queue` is a more limited list, one that enforces a "queueing discipline": only add at the end, only remove at the beginning. In order to do this, it hides the list it internally uses for storage so as to prevent abuse.

## Why encapsulate?
At this point You might ask yourself: "Why do we even want to do that? Why can't we just use List everywhere and just not use the functionality that we don't need (such as `insert`, `pop` etc)?"

The answer to that question is that by making a new class for this use case, you **ensure** that the data structure won't be used in a way it's not supposed to. If some other developer (and this 'other developer' might be future you, who already forgot about half of the coding decisions you made) changes your code later on (which happens all the time in the real world), this developer can't accidentally modify this list in a way they are not supposed to.

## Hiding internals
In general, objects will often hide their internal state (i.e., its attributes) to prevent outsiders from tinkering directly with it.
An attribute can be public if it can take any value, but as soon as you want to limit what can be done with it, you should make it private and only allow access to it indirectly using methods.

A few examples:

* A `Point` class that represents a point with `x`, `y` coordinates does not need to hide its attributes: `x` and `y` are free to have any value they want.
* A `Person` class might want to restrict its `age` to positive values.
  The `age` should then be stored in a private attribute and setting the field should be done using a method (or better, a property) which checks that the new value is indeed positive.
