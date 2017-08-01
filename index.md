# Robot API Tutorial
This is the documentation tutorial showing how to use the robot's API.

[See the API reference.](reference)

## Setup
The following two lines are required to setup the robot.

```python
from robot import Robot

r = Robot()
```

This will setup your robot and allow it to send and receive data from the robot's various boards. Once this has been setup, this object can be used for most of the functions of the robot.

### Start Button
So your robot doesn't start moving as soon as the robot is finished setting up, the code is paused after setup until the _Start Button_ on the power board is pressed. There is a green LED next to the start button when the robot is finished setting up and the start button can be pressed.

### Logs
So you can see what your robot did, what it didn't do, and any errors it raised, a log file is saved on the USB drive. The file is saved to `log.txt` in the root of the USB. Be careful, this log is cleared each time the robot is setup, so save it off the USB if you need to keep hold of it!

## Power Boards
```python
# get the first power board
main_board = r.power_board

# get the power board by serial number
main_board = r.power_boards['SERIAL']

# get the first power board
main_board = r.power_boards[0]
```

This power board object has two functions, `power_on()` and `power_off()` these turn the power on and off to the connected boards respectively.

`power_on()` is called during initialisation, so this doesn't need to be called manually.

## Motor Boards

If there is only one motor board connected, you can use `r.motor_board` to get the object representing it.
```python
# a single connected motor board
motor_board = r.motor_board
```

If their is more than one, there is a dictionary of all of them indexed by serial number.
```python
# Selects the motor board by serial number
motor_board = r.motor_boards['SERIAL']
```

This board object has a property object for each of the motors connected to it. These are mapped to the `m1` and `m0` variables.

It is a good idea to assign the left and right motor object to memorable variables, similar to the following
```python
left_motor = r.motor_board.m0
right_motor = r.motor_board.m1
```

These `Motor` objects have a property called `voltage`, which is used to set the power of the motors, between -1 and 1.

Note that this number is not the actual voltage being applied to the motor.

So setting the voltage of the motors works like this:
```python
left_motor.voltage  = 1
right_motor.voltage = 1
```

and these value can then be read back:
```python
left_motor.voltage
>>> 1

right_motor.voltage
>>> 1
```

The motor board would then apply full power to both motors.

In addition to the numeric values, there are two text constants that can be used. `robot.BRAKE` and `robot.COAST`. `robot.BRAKE` is an alias for 0 (full stop), while `robot.COAST` stops the application of power to the motors.

```python
from robot import BRAKE

left_motor.voltage = BRAKE
```

## Servo Assembly

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

By default, servos will be un-powered when your robot starts, and can freely rotate. Once you set a value, they then fix to that rotation. This also happens when you turn off your robot, or unplug your USB.

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

You can use the GPIO pins to read and write individual pins of the servo assembly. These cann be used for anything, from microswitches to LEDs.

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
