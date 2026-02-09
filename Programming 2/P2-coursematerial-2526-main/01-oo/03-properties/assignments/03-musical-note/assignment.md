## Task

Define a class `MusicalNote`.
It must have two readonly properties: `name` and `pitch`.

```text
>>> note = MusicalNote('a4', 440)

>>> note.name
a4

>>> note.pitch
440

>>> note.name = 'b4'
AttributeError: can't set attribute

>>> note.pitch = 450
AttributeError: can't set attribute
```
