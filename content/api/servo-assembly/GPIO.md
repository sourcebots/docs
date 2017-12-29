---
title: GPIO
---

You can use the GPIO _(General Purpose Input/Output)_ pins for anything, from microswitches to LEDs. GPIO is only available on pins 2 to 12, because pins 0 and 1 are reserved for communication with the rest of our kit.

## Pin mode
GPIO pins have four different modes. A pin can only have one mode at a time, and some pins aren't compatible with certain modes. These pin modes are represented by an [enum](https://docs.python.org/3/library/enum.html) which needs to be imported before they can be used.

```python
from robot import PinMode
```

{{% notice note %}}
The input modes closely resemble those of an Arduino. More information on them can be found in [their docs](https://www.arduino.cc/en/Tutorial/DigitalPins).
{{% /notice %}}


### `PinMode.INPUT`
In this mode, the digital state of the pin (whether it is high or low) can be read.

### `PinMode.INPUT_PULLUP`
Same as `PinMode.INPUT`, but with an internal [pull-up resistor](https://learn.sparkfun.com/tutorials/pull-up-resistors) enabled.

### `PinMode.OUTPUT_HIGH`
Sets the pin to a high output (+5V).

### `PinMode.OUTPUT_LOW`
Sets the pin to a low output (0V).


## Setting the pin mode

```python
from robot import PinMode

r.servo_board.gpios[3].mode = PinMode.INPUT_PULLUP
```

## Reading a pin state

To read the state of a pin, simply call `read()`, which will return either `PinValue.HIGH` or `PinValue.LOW`. Like `PinMode`, the `PinValue` enum must be imported.

```python
from robot import PinMode, PinValue

r.servo_board.gpios[3].read() == PinValue.HIGH
>>> True
```

{{% notice warning %}}
Calling `read()` will raise an exception if the pin's mode hasn't been set to an input type beforehand.
{{% /notice %}}

# Analogue pins

Certain sensors output analogue signals rather than digital ones, and so have to be read differently. The servo assembly has six analogue inputs, of which four (analogue pins 4 and 5) are reserved for communication between the Arduino and the servo shield.

{{% notice info %}}
Analogue signals can have any voltage, while digital signals can only take on one of two voltages.
You can read more about digital vs analogue signals [here](https://learn.sparkfun.com/tutorials/analog-vs-digital).
{{% /notice %}}

To read the value of an analogue pin, call `read_analogue()` on the servo board. This will give you the value of all analogue pins.

```python
r.servo_board.read_analogue()["a0"]
>>> 1.569
```

{{% notice info %}}
The values are the voltages read on the pins, between 0 and 5.
{{% /notice %}}
