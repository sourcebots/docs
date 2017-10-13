---
title: Servo Assembly
---

The servo assembly contains multiple components. The Arduino powering it allows you to control Servos, Ultrasound sensors, and anything else that accepts digital or analogue signals.

### Servos
get a dictionary of connected servo boards with the serial numbers as keys, or if only one servo board is connected. There is also a function just for the first:
```python
# get the only board connected
board_one = r.servo_board

# get a single board by serial number
board_one = r.servo_boards['S3rv0']
```

Once you have a single servo board you can get the list of servos connected to that board and read and set the position of that servo:
```python
# get the second element of the list of servo ports
servo_one = board_one.servos[1]
```

The position of the selected servo can then be set and read:
```python
servo_one.position = 0.65

servo_one.position
>>> 0.65
```

Note that this value is not in degrees!

By default, servos will be unpowered when your robot starts, and can freely rotate. Once you set a value, they then fix to that rotation. This also happens when you turn off your robot, or unplug your USB.

### Ultrasound
The ultrasound sensor can be used to measure the distance your robot is away from something.

Assuming you've wired up the read (_echo_) and write (_trigger_) pins to 6 and 7:
```python
board = r.servo_board

board.read_ultrasound(7, 6)
>>> 0.524
```

The returned value is in metres.

### GPIO

You can use the GPIO pins to read and write individual pins of the servo assembly. These can be used for anything, from microswitches to LEDs.

To set the value of a pin to high you set its mode to `PinMode.OUTPUT_HIGH`. To set the value to low, set it to `PinMode.OUTPUT_LOW`.

```python
from robot import PinMode

board = r.servo_boards

# Make the pin go high
board.gpio[3].mode = PinMode.OUTPUT_HIGH

# Make the pin go low
board.gpio[3].mode = PinMode.OUTPUT_LOW
```

To read from a pin, you first must set it to `PinMode.INPUT`. If you wish to use the built-in pullup resistor, use `PinMode.INPUT_PULLUP` instead.

```python
board.gpio[3].mode = PinMode.INPUT
```

To read the value of a pin, simply call `read()`.

```python
from robot import PinValue

board.gpio[3].read() == PinValue.HIGH
>>> True
```

*Note that pin 0 and pin 1 should not be used for GPIO, as these are reserved for serial communications with the Pi and attempting to use them will raise errors.*

