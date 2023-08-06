# Arduino API

The [Arduino](https://store.arduino.cc/arduino-uno-rev3) provides a
total of 18 pins for either digital input or output (labelled 2 to 13
and A0 to A5), pins A0 to A5 also support analog input.

!!! warning
    Digital pins 0 and 1 are reserved and cannot be used.

## Accessing the Arduino

The Arduino can be accessed using the `arduino` property of the `Robot`
object.

``` python
my_arduino = robot.arduino
```

You can use the GPIO *(General Purpose Input/Output)* pins for anything,
from microswitches to LEDs. GPIO is only available on pins 2 to 13 and
A0 to A5 because pins 0 and 1 are reserved for communication with the
rest of our kit.

## Pin Mode

GPIO pins have different modes. A pin can only have one mode at a
time, and some pins aren't compatible with certain modes. These pin
modes are represented by an
[enum](https://docs.python.org/3/library/enum.html) which needs to be
imported before they can be used.

``` python
from sbot import GPIOPinMode
```

!!! tip
    The input modes closely resemble those of an Arduino.
    More information on them can be found in [their docs](https://www.arduino.cc/en/Tutorial/DigitalPins).

### Setting the pin mode

You will need to ensure that the pin is in the correct pin mode before
performing an action with that pin. You can read about the possible pin
modes below.

``` python
robot.arduino.pins[3].mode = GPIOPinMode.INPUT_PULLUP
```

### Digital Input

Digital inputs can be used to check the state of a pin (whether it is high or low).
This is useful for connecting something such as a micro-switch.

``` python
robot.arduino.pins[4].mode = GPIOPinMode.INPUT

pin_value = robot.arduino.pins[4].digital_value
```

Some external switches may require a pull up resistor.
`GPIOPinMode.INPUT_PULLUP`, is the same as `INPUT` but also enables an internal [pull-up
resistor](https://learn.sparkfun.com/tutorials/pull-up-resistors).

``` python
robot.arduino.pins[4].mode = GPIOPinMode.INPUT_PULLUP

pin_value = robot.arduino.pins[4].digital_value
```

### Digital Output

Digital outputs can be used to set binary values of `0V` or `5V` to the pin.
This can be used to turn an LED on and off for example.

``` python
robot.arduino.pins[4].mode = GPIOPinMode.OUTPUT
robot.arduino.pins[6].mode = GPIOPinMode.OUTPUT

robot.arduino.pins[4].digital_value = True
robot.arduino.pins[6].digital_value = False
```

### Analog Input

Certain sensors output analog signals rather than digital ones, and so
have to be read differently. The Arduino has six analog inputs, which
are labelled `A0` to `A5`.

!!! tip
    Analog signals can have any voltage, while digital signals can only
    take on one of two voltages. You can read more about digital vs analog
    signals [here](https://learn.sparkfun.com/tutorials/analog-vs-digital).

``` python
from sbot import AnalogPins

robot.arduino.pins[AnalogPins.A0].mode = GPIOPinMode.INPUT

pin_value = robot.arduino.pins[AnalogPins.A0].analog_value
```

!!! tip
    The values are the voltages read on the pin, between 0 and 5.

## Ultrasound Sensors

You can also measure distance using an ultrasound sensor from the arduino. Ultrasound sensors return the distance of the closest object in mm.

```python
# Trigger pin: 4
# Echo pin: 5

distance_mm = robot.arduino.ultrasound_measure(4, 5)
```

!!! warning
    The ultrasound sensor can measure distances up to 4 metres. 
    If the ultrasound signal has to travel further than 4m, the sensor will timeout and return 0.
