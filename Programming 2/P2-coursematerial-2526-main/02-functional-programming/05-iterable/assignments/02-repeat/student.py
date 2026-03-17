def repeat(value):
    while True:
        yield value
iterator = repeat(5)

next(iterator)
