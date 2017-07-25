# Robot API Tutorial
This is the documentation tutorial showing how to use the robot's API.

[See the API reference.](reference)

## Setup
The following two lines are required to setup the robot.

```python
from robot import Robot

robot = Robot()
```

This will initialize the robot's API calls and allow it to send and receive data from the robot's various boards.

Once this has been setup, this object can be used for most of the functions of the robot.

## Power Boards
```python
# get a dictionary of the connected power boards
power_boards = robot.power_boards

# get the power board by serial number
main_board = power_boards['POWER']

# get the first power board
main_board = power_boards[0]
```

This power board object has two functions, `power_on()` and `power_off()` these turn the power on and off to the connected boards respectively.

`power_on()` is called during initialization, so this isn't needed.

## Motor Boards
In order to use a motor board, you will first have to read the serial number off the motor boards:

Once this is done, the motors and their boards are accessed as follows:
```python
# a dictionary of the available motor boards
motor_boards = robot.motor_boards

# Selects the motor board by serial number
board_one = motor_boards['mOtOr']
```

This board object has a property object for each of the motors connected to it. These are mapped to the `m1` and `m0` variables.

It is a good idea to assign the left and right motor object to memorable variables, similar to the following
```python
left_motor = robot.motor_boards['mOtOr'].m0
right_motor = robot.motor_boards['mOtOr'].m1
```

These `Motor` objects have a property called `voltage`, which is used to set the power of the motors, between -1 and 1.

Note that this number is not the actual voltage being applied to the motor.

So setting the voltage of the motors works like this:
```python
left_motor.voltage  = 1
right_motor.voltage = 1
```

and these value can then be read like that:
```python
left_motor.voltage
# >>> 1

right_motor.voltage
# >>> 1
```

The motor board would then apply full power to both motors.

In addition to the numeric values, there are two text constants that can be used. `robot.BRAKE` and `robot.COAST`.
`robot.BRAKE` is an alias for 0 (full stop), while `robot.COAST` stops the application of power to the motors.

## Ruggeduino (Servo Boards)

get a dictionary of connected servo boards with the serial numbers as keys:
```python
# get a single board by serial number
board_one = servo_boards['S3rv0']
```

Once you have a single servo board you can get the list of servos connected to that board and read and set the position of that servo:
```python
# get the second element of the list of ports
servo_one = board_one.ports[1]
```

The position of the selected servo can then be set and read as followings:
```python
servo_one.position = 65

position = servo_one.position
# 65
```

## Cameras (Vision Boards)
As always, a dictionary of the available cameras is obtained, then an individual camera is obtained using the serial number, as follows:

```python
cameras = robot.cameras
camera_one = cameras['camera']
```

Once you have a camera object you can check what markers it can see by using its `see()` command, this will return a list of marker objects.
```python
markers = camera_one.see()
```

Once you've got a marker object, you can check its id number against the predefined lists to see what type of marker it is:
```python
eg_marker = markers[0]
eg_marker.id
# >>> 34
eg_marker.id in robot.WALL
# >>> false
eg_marker.id in robot.TOKEN
# >>> true
eg_maker.id in robot.SILVER_TOKEN
# >>> true
```
