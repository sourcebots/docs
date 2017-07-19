# Documentation

This is the documentation showing how to use the robot's API.

## Setup

The following two lines of python code are required to setup the robot.

```python
from robot import Robot

robot = Robot()
```

This will initialize the robot's api calls and allow it to send and receive data from the robot's various boards.

Once this has been setup, this object can be used for most of the functions of the robot.

## Motor Boards
in order to use a motor board, you will first have to read the serial number off the motor boards:

Once this is done, the motors and their boards are accessed
as follows:

```python
motor_boards = robot.motor_boards()
# Returns a dictionairy of the avaliable motor boards
board_one = motor_boards['s3r1al']
# Selects the board with that serial number
```

This board object has a property object for each of the motors connected to it. These are called at the m0 and m1 functions.

It is a good idea to assign the left and right motor object to memorable variables, similar to the following

```python
left_motor = robot.motor_boards()['s3r1al'].m0()
right_motor = robot.motor_boards()['s3r1al'].m1()
```
These Motor objects have a property called voltage, which can be read by calling it with no arguments and set by calling it with the new voltage as the singular argument.

Note that this number has been normalised to be between -1 and 1 and is not the actual voltage being applied to the motor.

So setting the voltage of the motors works like this:

```python
left_motor.voltage(1)
right_motor.voltage(1)
```
and these value can then be read like that:
```python
left_voltage = left_motor.voltage()
# 1

right_voltage = right_motor.voltage()
# 1
```

The motor board would then apply full power to both motors.

In addition to the numeric values, there are two text constants that can be used. Robot.BRAKE and Robot.COAST.
Robot.BRAKE is an alias for 0 (full stop), while Robot.COAST stops the application of power to the motors.

## Power Boards

As with the motor boards, the serial number of the power board is needed. Once you have this you can obtain access to a power board as follows:

```python
power_boards = robot.power_boards()
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




## Servo Boards (Ruggeduino)

## Cameras (Vision Boards)


