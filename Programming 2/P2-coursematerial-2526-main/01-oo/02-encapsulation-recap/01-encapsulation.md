# ENCAPSULATION
Encapsulation is the practice of hiding information inside a ["black box"](https://en.wikipedia.org/wiki/Black_box) so that other developers working with the code don't have to worry about it.

## ENCAPSULATION IN Object-Oriented Programming (OOP)
In the context of object-oriented programming, we can practice good encapsulation by using [private](https://docs.python.org/3/tutorial/classes.html#tut-private) and public members. The idea is that if we want the users of our class to know that something exists and to interact with it directly, we make it public. If they don't need to use a certain method or property, we make that private to keep the usage instructions for our class simple.

## ENCAPSULATION IN PYTHON
To enforce encapsulation in Python, developers prefix properties and methods that they intend to be private with a double underscore.

```python
class Wall:
    def __init__(self, height):
        # this stops us from accessing the __height
        # property directly on an instance of a Wall
        self.__height = height

    def get_height(self):
        return self.__height
```

In the example above, we don't want users of the `Wall` class to be able to change its height. We make the `__height` property private and expose a public `get_height` method so that users can still read the height of a wall without being tempted to update it. This will stop developers from being able to do something like:

```python
# front_wall is an instance of a Wall
front_wall.__height = 10 # this results in an error

```

Python is a very dynamic language, and that makes it difficult for the interpreter to enforce some of the safeguards. That's why encapsulation in Python is achieved mostly by [convention](https://en.wikipedia.org/wiki/Coding_conventions) rather than by force.

Prefixing methods and properties with a double underscore is a strong suggestion to the users of your class that they shouldn't be touching that stuff. If a developer wanted to break convention, there are ways to get around the double underscore rule.

```python
class Wall:
    def __init__(self, height):
        # this warns developers to not
        # access the `__height` property directly
        self.__height = height

    def get_height(self):
        return self.__height

```
