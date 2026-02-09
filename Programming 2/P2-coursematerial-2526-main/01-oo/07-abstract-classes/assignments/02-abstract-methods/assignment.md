
## Task

The exercise is a bit of a puzzle and focuses on the actual rules regarding abstract classes and methods.
Copy the code from `startercode.py` to `student.py`.
Make the necessary classes and method abstract.

A summary of the rules to follow:

* Pick a class.
* Determine which methods it contains, i.e., the methods it defines itself, and the ones it inherits.
  Let's call this set of methods D.
* Determine which methods are called on `self` within the class.
  Let's call this set of methods C.
* If C contains methods not in D, it means there are "holes", in which case we need to add `@abstractmethod` declarations and make the class abstract.

A quick example:

```python
class A:
    def f(self):
        self.h()

    def g(self):
        self.f()

class B:
    def h(self):
        pass
```

We start with class `A`.
It defines methods named `f` and `g`.
It calls `f` and `h` on itself.
This means that `h` is missing from `A`: we need to make it abstract and add a declaration for `h`:

```python
class A(ABC):
    def f(self):
        self.h()

    def g(self):
        self.f()

    @abstractmethod
    def h(self):
        ...
```

Next comes `B`.
It has methods `f`, `g` (both inherited) and `h`.
It doesn't call methods on itself, so there are no "holes".
Nothing needs to be changed to `B`.
