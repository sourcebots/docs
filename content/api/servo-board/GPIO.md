---
title: GPIO
---

You can use the GPIO pins to read and write individual pins of the servo assembly. These can be used for anything, from microswitches to LEDs. GPIO is only available on pins 2 to 12, because pins 0 and 1 are reserved for communication with our kit.

## Pin Mode
GPIO pins support 4 different modes, allowing it to work in 4 different ways. A pin can only have 1 mode at a time, and certain pins aren't compatable with certain modes. These Pin modes are stored in an [enum](https://docs.python.org/3/library/enum.html) which needs to be imported to use.

```python
from robot import PinMode
``` 

{{% notice note %}}
The input modes closely resemble those of an Arduino. More infromation on them can be found in [their docs](https://docs.python.org/3/library/enum.html)
{{% /notice %}}


### `PinMode.INPUT`
Allows reading the value from the pin

### `PinMode.INPUT_PULLUP`
Allows reading the value from the pin using the built-in pullup resistor.

### `PinMode.OUTPUT_HIGH`
Set the pin to high output. Equivalent to `PinValue.HIGH`

### `PinMode.OUTPUT_LOW`
Set the pin to low output. Equivalent to `PinValue.LOW`


## Setting the pin mode

```python
from robot import PinMode

r.servo_board.gpio[3].mode = PinMode.INPUT_PULLUP
```

## Reading a pin value

To read the value of a pin, simply call `read()`. This will return either `PinValue.HIGH` or `PinValue.LOW`, which have to be imported to use.

```python
from robot import PinMode

r.servo_board.gpio[3].read() == PinValue.HIGH
>>> True
```

{{% notice warning %}}
Calling `read()` will raise an exception if the pins mode hasn't been set to an input type beforehand.
{{% /notice %}}

# Analogue Pins

Certain sensors output analogue signals rather than digial ones, so have to be read differently. The servo assembly has 4 analogue inputs.

To read the value of an analogue pin, call `read_analogue()` on the servo board. This will give you the value of all analogue pins.

```python
r.servo_board.read_analogue()["a0"]
>>> 1.569
``` 

{{% notice info %}}
The values are the voltage read on the pins, between 0 and 5.
{{% /notice %}}
