# Overriding

```python
class Parent:
    def method(self):
        return "Parent.method"

class Child(Parent):
    def other_method(self):
        return "Parent.other_method"
```

Consider the two classes above.

* `Parent` has one method named `method`.
* `Child` has two method: `method` (inherited from `Parent`) and `other_method`.

Let's try something new.
What happens if we write this:

```python
class Parent:
    def method(self):
        return "Parent.method"

class Child(Parent):
    def method(self):
        return "Child.method"
```

Here, `Child` declares a method with exactly the same name as the one in `Parent`.
But is this allowed? The answer is yes. This idea of redefining a method with the same name is called _overriding_ (not overwriting).

What happens is what you would expect happens: the `Child` implementation of `method` "wins".
Take a look at this code:

```python
>>> parent = Parent()
>>> parent.method()
"Parent.method"

>>> child = Child()
>>> child.method()
"Child.method"
```

In this example, one could say that it makes little sense to have `Child` inherit from `Parent` since it overrides all of its parent methods anyway.
Nothing that is inherited survives.
This is true, but there are cases where it still could be useful.

