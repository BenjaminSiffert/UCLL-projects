## Task

Create a class `Money` that represents a certain `amount` of money in a certain `currency`:

```python
>>> money = Money(10, "EUR")
>>> money.amount
10

>>> money.currency
"EUR"
```

We want to be able to add `Money`s together, but only if their currencies match.

```python
>>> Money(10, "EUR") + Money(20, "EUR")
Money(30, "EUR")

>>> Money(10, "EUR") + Money(20, "USD")
RuntimeError("Mismatched currencies!")
```

Same for subtraction:

```python
>>> Money(30, "EUR") - Money(10, "EUR")
Money(20, "EUR")

>>> Money(30, "EUR") - Money(10, "USD")
RuntimeError("Mismatched currencies!")
```

Finally, we also want to be able to multiply a `Money` with a number.
Notice that we are *not* multiplying two `Money`s together, but a `Money` with an `int` or `float`.

```python
>>> Money(20, "EUR") * 5
Money(100, "EUR")
```
