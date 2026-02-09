# Abstract Properties

Similarly to abstract methods, it's also possible to have abstract properties.

```python
class Foo:
    @property
    @abstractmethod
    def my_property(self):
        # ...

    @my_property.setter
    @abstractmethod
    def my_property(self, value):
        # ...
```

> You might notice that `@abstractproperty` exists, but it's been [deprecated](https://docs.python.org/3/library/abc.html#abc.abstractproperty).
> This means you shouldn't use it because it's been replaced by something else (`@abstractmethod`) and it might disappear in a future version of Python.

