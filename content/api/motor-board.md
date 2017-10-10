---
title: Motor Board
---

If there is only one motor board connected, you can use `r.motor_board` to get the object representing it.
```python
# a single connected motor board
motor_board = r.motor_board
```

If there is more than one, there is a dictionary of all of them indexed by serial number.
```python
# Selects the motor board by serial number
motor_board = r.motor_boards['SERIAL']
```

This board object has a property object for each of the motors connected to it. These are mapped to the `m1` and `m0` variables.

It is a good idea to assign the left and right motor object to memorable variables, similar to the following:
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
