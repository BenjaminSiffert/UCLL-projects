# Sensor

Review the given interface `Sensor`.

## Standard Sensor

Create a class `StandardSensor` that implements `Sensor`.

A default sensor is always on, the methods `setOn` and `setOff` do nothing. 
The standard sensor has a constructor with one integer parameter. 
The method `read` returns the number passed to the constructor.

An example:

```java
public static void main(String[] args) {
    StandardSensor ten = new StandardSensor(10);
    StandardSensor minusFive = new StandardSensor(-5);

    System.out.println(ten.read());
    System.out.println(minusFive.read());

    System.out.println(ten.isOn());
    ten.setOff();
    System.out.println(ten.isOn());
}
```

```console
10
-5
true
true
```

## Temperature Sensor

Create a class `TemperatureSensor` that implements `Sensor`.

The temperature sensor can be turned on and off via the methods `setOn` and `setOff`.
The temperature sensor starts disabled. When the sensor is on and the `read` method is called, the sensor returns a random number between 
-30 and 30. If the sensor is off and the method `read` is called, the method throws an `IllegalStateException`.

(Check out the built-in class `Random` to return a random number.)

## Average Sensor

Create a class `AverageSensor` that implements `Sensor`.

An average sensor has multiple sensors. In addition to the methods of the `Sensor` interface, the class also has a method
`public void addSensor(Sensor toAdd)` that can be used to add a sensor.

An average sensor is on if all its sensors are on:
* when calling `setOn`, all sensors must be turned on
* when calling `setOff` all sensors must be turned off

The `read` method returns the average of all `read` methods of the sensors (round down). If this method is called
while the sensor is off or no sensors are added it will throw an `IllegalStateException`.

An example:

```java
public static void main(String[] args) {
    Sensor leuven = new TemperatureSensor();
    leuven.setOn();
    System.out.println("temperature in Leuven " + leuven.read() + " degrees Celsius");

    Sensor heverlee = new TemperatureSensor();
    Sensor kesselLo = new TemperatureSensor();

    AverageSensor regionLeuven = new AverageSensor();
    regionLeuven.addSensor(leuven);
    regionLeuven.addSensor(heverlee);
    regionLeuven.addSensor(kesselLo);

    regionLeuven.setOn();
    System.out.println("temperature in region Leuven " + regionLeuven.read() + " degrees Celsius");
}
```

```console
temperature in Leuven 11 degrees Celsius
temperature in region Leuven 8 degrees Celsius
```

### All readings

Add to the class `AverageSensor` a method `public int[] readings()`. This method should return the result of all measurements performed.

An example:

```java
public static void main(String[] args) {
    Sensor leuven = new TemperatureSensor();
    Sensor heverlee = new TemperatureSensor();
    Sensor kesselLo = new TemperatureSensor();

    AverageSensor regionLeuven = new AverageSensor();
    regionLeuven.addSensor(leuven);
    regionLeuven.addSensor(heverlee);
    regionLeuven.addSensor(kesselLo);

    regionLeuven.setOn();
    System.out.println("temperature in region Leuven " + regionLeuven.read() + " degrees Celsius");
    System.out.println("temperature in region Leuven " + regionLeuven.read() + " degrees Celsius");
    System.out.println("temperature in region Leuven " + regionLeuven.read() + " degrees Celsius");

    System.out.println("readings: " + regionLeuven.readings());
}
```

```console
temperature in region Leuven -10 degrees Celsius
temperature in region Leuven -4 degrees Celsius
temperature in region Leuven 5 degrees Celsius

readings: [-10, -4, 5]
```