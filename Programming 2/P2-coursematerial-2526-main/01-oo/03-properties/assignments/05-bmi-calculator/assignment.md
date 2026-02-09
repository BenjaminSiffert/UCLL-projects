## Task

Write a class `BMICalculator` that we can use as follows:

```text
>>> calc = BMICalculator(weight_in_kg=80, height_in_m=1.80)

>>> calc.bmi
24.69

>>> calc.category
normal
```

The bmi is computed as follows:

```python
bmi = weight_in_kg / height_in_m**2
```

The category can take one of three values:

* `"underweight"` if `bmi` is less than `18.5`.
* `"normal"` if `bmi` is between `18.5` and `25`.
* `"overweight"` if `bmi` is greater than `25`.
