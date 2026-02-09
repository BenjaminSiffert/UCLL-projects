## Task

Create a class `Duration` that can be used as follows:

```python
>>> duration = Duration.from_seconds(60)
>>> duration.seconds
60

>>> duration.minutes
1

>>> duration = Duration.from_hours(1)
>>> duration.minutes
60

>>> duration.seconds
3600
```

We want the following members:

* Static factory methods named `from_seconds`, `from_minutes` and `from_hours`.
* Readonly properties named `seconds`, `minutes` and `hours`.

Note: the reason we named the factory functions `from_unit()` instead of just `unit()` is that we wanted to be able to name our properties after the units.
Sadly, we cannot have static methods and properties with the same name inside one class.
