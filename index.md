This is the documentation tutorial showing how to use the robot's API.

[See the api reference.](Reference)
## Setup

The following two lines of python code are required to setup the robot.

```python
from robot import Robot

robot = Robot()
```

This will initialize the robot's api calls and allow it to send and receive data from the robot's various boards.

Once this has been setup, this object can be used for most of the functions of the robot.

## Power Boards

As with the motor boards, the serial number of the power board is needed. Once you have this you can obtain access to a power board as follows:

```python
power_boards = robot.power_boards
# gets a dictionairy of the connected power boards
main_board = power_boards['POWER']
# get the power board with that serial number
```

This power board object has two functions, power_on() and power_off() these turn the power on and off to the connected boards respectivley.

```python
main_board.power_on()
# powers on the connected boards

main_board.power_off()
# powers off the connected boards
```

## Motor Boards
in order to use a motor board, you will first have to read the serial number off the motor boards:

Once this is done, the motors and their boards are accessed
as follows:

```python
motor_boards = robot.motor_boards
# a dictionairy of the avaliable motor boards
board_one = motor_boards['mOtOr']
# Selects the board with that serial number
```

This board object has a property object for each of the motors connected to it. These are mapped to the m1 and m0 variables.

It is a good idea to assign the left and right motor object to memorable variables, similar to the following

```python
left_motor = robot.motor_boards['mOtOr'].m0
right_motor = robot.motor_boards['mOtOr'].m1
```
These Motor objects have a property called voltage, which can be read and set like any other variable.

Note that this number has been normalised to be between -1 and 1 and is not the actual voltage being applied to the motor.

So setting the voltage of the motors works like this:

```python
left_motor.voltage  = 1
right_motor.voltage = 1
```
and these value can then be read like that:
```python
left_motor.voltage
# 1

right_motor.voltage
# 1
```

The motor board would then apply full power to both motors.

In addition to the numeric values, there are two text constants that can be used. Robot.BRAKE and Robot.COAST.
Robot.BRAKE is an alias for 0 (full stop), while Robot.COAST stops the application of power to the motors.

## Ruggeduino (Servo Boards)

get a dictionairy of connected servo boards with the serial numbers as keys:

```python
servo_boards = robot.servo_boards
# get a dictionairy of the servo boards
board_one = servo_boards['S3rv0']
# get a single board by serial number
```
Once you have a single servo board you can get the list of servos connected to that board and read and set the position of that servo:

```python
servo_one = board_one.ports[1]
# get the second element of the list of ports
```

The position of the selected servo can then be set and read as followings:
```python

servo_one.position = 65

position = servo_one.position
# 65
```

## Cameras (Vision Boards)

As always, a dictionairy of the avaliable cameras is obtained, then an inidivual camera is obtained using the serial number, as follows:
```python
cameras = robot.cameras
camera_one = cameras['camera']
```

Once you have a camera object you can check what markers it can see by using its see() command, this will return a list of marker objects.
```python
markers = camera_one.see()
```
These marker objects have properties and some helper functions, see their entry in the reference for a complete list.

