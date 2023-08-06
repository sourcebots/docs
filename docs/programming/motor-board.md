# Motor Board API

The kit can control multiple motors simultaneously. One Motor Board can
control up to two motors.

## Accessing the Motor Board

If there is exactly one motor board attached to your robot, it can be
accessed using the `motor_board` property of the `Robot` object.

``` python
my_motor_board = robot.motor_board
```

!!! warning
    If there is more than one motor board on your kit, you *must* use the `motor_boards` property. `robot.motor_board` *will cause an error*. This is because the kit doesn't know which motor board you want to access.

Motor boards attached to your robot can be accessed under the
`motor_boards` property of the `Robot`. The boards are indexed by their
serial number, which is written on the board.

``` python
my_motor_board = robot.motor_boards["SRO-AAD-GBH"]
my_other_motor_board = robot.motor_boards["SR08U6"]
```

## Controlling the Motor Board

This board object has an array containing the motors connected to it,
which can be accessed as `motors[0]` and `motors[1]`. The Motor Board is
labelled so you know which motor is which.

``` python
my_motor_board.motors[0]
my_motor_board.motors[1]
```

## Powering motors

Motor power is controlled using [pulse-width modulation
(PWM)](https://en.wikipedia.org/wiki/Pulse-width_modulation). You set
the power with a fractional value between `-1` and `1` inclusive, where
`1` is maximum speed in one direction, `-1` is maximum speed in the
other direction and `0` causes the motor to brake.

``` python
my_motor_board.motors[0].power = 1
my_motor_board.motors[1].power = -1
```

These values can also be read back:

``` python
>>> my_motor_board.motors[0].power
1

>>> my_motor_board.motors[1].power
-1
```

!!! warning
    Setting a value outside of the range `-1` to `1` will raise an exception and your code will crash.

!!! warning
    Sudden large changes in the motor speed setting (e.g. `-1` to `0`, `1` to `-1` etc.) will likely trigger the over-current protection and your robot will shut down with a distinct beeping noise and/or a red light next to the power board output that is powering the motor board.

### Special values

In addition to the numeric values, there are two special constants that
can be used: `BRAKE` and `COAST`. In order to use these, they must be
imported from the `sbot` module like so:

``` python
from sbot import BRAKE, COAST
```

#### `BRAKE`

`BRAKE` will stop the motors from turning, and thus stop your robot as
quick as possible.

!!! note
    `BRAKE` does the same as setting the power to `0`.

``` python
from sbot import BRAKE

my_motor_board.motors[0].power = BRAKE
```

#### `COAST`

`COAST` will stop applying power to the motors. This will mean they
continue moving under the momentum they had before.

``` python
from sbot import COAST

my_motor_board.motors[1].power = COAST
```
