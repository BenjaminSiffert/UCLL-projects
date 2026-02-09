# Properties

Up to now, we have worked with attributes that were either **public**, or **private attributes accessed through getters and setters**. This leads to different ways of interacting with an object, depending on how its attributes are defined. The example below illustrates this situation.

```python
class Tea:
    def __init__(self, name, temperature):
        self.name = name
        self.set_temperature(temperature)
        
    def get_temperature(self):
        return self.__temperature
    
    def set_temperature(self, value):
        if(value <= 0 or value >= 100):
            raise ValueError("Tea water must be liquid")            
        self.__temperature = value
        
        
green = Tea("Green", 80)

# Retrieving the attribute's value
print(green.name)
print(green.get_temperature())

# Changing the attribute's value
green.name = "Green tea"
green.set_temperature(82)
```

We define a `Tea` class that receives two parameters in its constructor: `name` and `temperature`. The `name` is stored as a **public attribute**, while `temperature` is stored as a **private attribute**. As a result, retrieving the value of `name` uses a different syntax than retrieving the value of `temperature`. The same applies when modifying these attributes.

If we later decide that `name` should also become a private attribute, this introduces additional overhead. Not only do we need to add getters and setters to the class itself, but we must also update **every place in the code** where `name` is accessed or modified so that it uses these methods instead.

This difference in access style makes code harder to maintain and more error-prone as a project grows. Python provides a more elegant solution to this problem: **properties**, which allow us to keep a clean and consistent interface while still enforcing encapsulation and validation logic.


## Using Properties

In this updated version of the `Tea` class, we introduce **properties** to manage access to the `temperature` attribute. Although `temperature` is still stored internally as a private attribute (`__temperature`), it can now be accessed and modified using **attribute syntax**, just like a public variable.

```python
class Tea:
    def __init__(self, name, temperature):
        # Public attribute: can be accessed and modified directly
        self.name = name

        # Calls the property setter below (validation is still applied)
        self.temperature = temperature
        

    # Getter for the temperature property
    # Allows access using attribute syntax (tea.temperature)
    @property
    def temperature(self):
        return self.__temperature
    

    # Setter for the temperature property
    # Adds validation logic before updating the value
    @temperature.setter
    def temperature(self, value):
        if value <= 0 or value >= 100:
            raise ValueError("Tea water must be liquid")
        self.__temperature = value



green = Tea("Green", 80)

# Reading a public attribute
print(green.name)

# Reading a property (calls the getter behind the scenes)
print(green.temperature)

# Updating a public attribute
green.name = "Green Tea"

# Updating a property (calls the setter behind the scenes)
green.temperature = 82

```

The `@property` decorator defines a getter method that is accessed as `green.temperature`, without parentheses. The `@temperature.setter` decorator defines the corresponding setter, which is automatically called when a new value is assigned to the property. This allows us to include validation logic while keeping the external interface simple and consistent.

From the outside, there is no longer a visible difference between working with the public attribute `name` and the controlled attribute `temperature`. Both can be read and updated using the same syntax, even though `temperature` is protected by validation rules behind the scenes.

This approach avoids the overhead of explicit getter and setter method calls, improves readability, and makes future changes safer. If we later decide to add validation or make `name` private as well, we can do so without changing how the attribute is used elsewhere in the code.
