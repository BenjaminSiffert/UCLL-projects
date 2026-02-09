## Task

Copy the starter code to `student.py`.
As you can see, it defines an abstract class `Shape` with abstract properties `perimeter` and `circumference`.
We ask of you to write four classes.

### `Rectangle`

`Rectangle` is a child class of `Shape`.
It should have two readonly properties `length` and `width`.

### `Square`

`Square` is a child class of `Rectangle`.
A `Square` is a special `Rectangle` with `length == width`.
Its constructor should only accept a single parameter `side`.

Even though `Square` inherits the `length` and `width` properties from `Rectangle` it should nonetheless also add its own readonly property `Side`.
It should return the same value as `length` and `width`.

### `Ellipse`

`Ellipse` is another kind of shape.
It should have two readonly properties `major_radius` and `minor_radius`.

Note that there is [no nice formula](https://www.youtube.com/watch?v=5nW3nJhBHL0) for the perimeter of an ellipse.
Have the `perimeter` property raise a `NotImplementedError`.

### `Circle`

A `Circle` is a special kind of ellipse where `major_radius == minor_radius`.
The constructor should therefore only accept a single parameter, which we'll name `radius`.
Also add a readonly property `radius` which returns the same value as `major_radius` and `minor_radius`.

## Formulae

In case you forgot the formulae for area and perimeter:

| Shape | Perimeter | Area |
|-:|:-:|:-:|
| Rectangle | 2 &times; (`width` + `height`) | `width` &times; `height` |
| Square | 4 &times; `side` | `side`<sup>2</sup> |
| Ellipse | ??? | &pi; &times; `minor_radius * major_radius` |
| Circle | 2 &times; &pi; &times; `radius` | &pi; &times; `radius`<sup>2</sup> |
