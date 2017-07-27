# Robot API Tutorial
This is the documentation tutorial showing how to use the robot's API.

[See the API reference.](reference)

## Setup
The following two lines are required to setup the robot.

```python
from robot import Robot

r = Robot()
```

This will setup your robot and allow it to send and receive data from the robot's various boards.

Once this has been setup, this object can be used for most of the functions of the robot.

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

## Ruggeduino (Servo Boards)

get a dictionary of connected servo boards with the serial numbers as keys, or if only one servo board is connected. There is also a function just for the first:
```python
# get the only board connected
board_one = r.servo_board

# get a single board by serial number
board_one = r.servo_boards['S3rv0']
```

Once you have a single servo board you can get the list of servos connected to that board and read and set the position of that servo:
```python
# get the second element of the list of ports
servo_one = board_one.ports[1]
```

The position of the selected servo can then be set and read:
```python
servo_one.position = 0.65

servo_one.position
>>> 0.65
```

Note that this value is not in degrees!

By default, servos will be un-powered when your robot starts, and can freely rotate. Once you set a value, they then fix to that rotation.

## Cameras (Vision Boards)
As always, a dictionary of the available cameras is obtained, then an individual camera is obtained using the serial number, or if there is only a single camera connected, then there is a function to get that as follows:

```python
# get the only camera
camera_one = r.camera

# get the camera by serial number
camera_one = r.cameras['SERIAL']
```

Once you have a camera object you can check what markers it can see by using its `see()` command, this will return a list of marker objects.
```python
markers = camera_one.see()
```

Once you've got a marker object, you can check its id number against the predefined lists to see what type of marker it is.
```python
from robot import WALL, TOKEN, SILVER_TOKEN

eg_marker = markers[0]
eg_marker.id
>>> 34
eg_marker.id in WALL
>>> False
eg_marker.id in TOKEN
>>> True
eg_maker.id in SILVER_TOKEN
>>> True
```

You can also do this automatically for all tokens your robot can see.
```python
for marker in r.see():
  if marker.id in TOKEN:
    print("I can see a token!")
```

Or filter what you see so you only get the token markers.
```python
only_token_markers = [marker for marker in r.see() if marker.id in TOKEN]
```
