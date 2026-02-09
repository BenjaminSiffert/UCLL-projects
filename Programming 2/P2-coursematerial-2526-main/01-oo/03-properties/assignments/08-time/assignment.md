## Task

We want to keep track of time of days, i.e. a time between 00:00:00 and 23:59:59.
Write a class `Time` that represents such a time of day.

* It must keep track of hours, minutes and seconds.
* The value of `hours` must be between 0 and 23.
* The value of `minutes` and `seconds` must be between 0 and 59.
* The constructor takes three parameters `hours`, `minutes` and `seconds` and uses them to initialize the object's attributes.
* The values of `hours`, `minutes` and `seconds` must be settable and gettable.
* A getter should always be before its brother setter, think about it why.
* Rely on properties to guard `hours`, `minutes` and `seconds` against invalid values.

A short example:

```text
>>> time = Time(0, 0, 0)
>>> time.hours = 8
>>> time.hours = -1
ValueError
>>> time.hours = 24
ValueError
```
