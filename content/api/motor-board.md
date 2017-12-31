---
title: Motor Board
---

The kit can control multiple motors simultaneously. One Motor Board can control up to two motors.

## Accessing Motor Boards
If there is only one motor board connected, you can use `r.motor_board` to interface with it.
```python
motor_board = r.motor_board
```

When you have more than one Motor Board connected to your kit, they can be accessed based upon their serial number. Assuming your motor board has the serial number `SERIAL`:

```python
motor_board = r.motor_boards['SERIAL']
```

This board object has attributes for each of the motors connected to it, named `m0` and `m1`. The boards are labelled so you know which motor is which.

```python
r.motor_board.m0
r.motor_board.m1
```

## Powering motors
Motor power is controlled using [pulse-width modulation (PWM)](https://en.wikipedia.org/wiki/Pulse-width_modulation). You set the power with a fractional value between `-1` and `1` inclusive, where `1` is maximum speed in one direction, `-1` is maximum speed in the other direction and `0` causes the motor to brake.

```python
r.motor_board.m0  = 1
r.motor_board.m1 = -1
```

These values can also be read back:
```python
r.motor_board.m0
>>> 1

r.motor_board.m1
>>> -1
```

{{% notice warning %}}
Setting a value outside of the range `-1` to `1` will raise an exception and your code will crash.
{{% /notice %}}

### Special values

In addition to the numeric values, there are two special constants that can be used: `robot.BRAKE` and `robot.COAST`.

#### `robot.BRAKE`
`robot.BRAKE` will stop the motors from turning, and thus stop your robot as quick as possible.

{{% notice tip %}}
`robot.BRAKE` does the same as setting the power to `0`.
{{% /notice %}}

```python
from robot import BRAKE

r.motor_board.m0 = BRAKE
```

#### `robot.COAST`
`robot.COAST` will stop applying power to the motors. This will mean they continue moving under the momentum they had before.


```python
from robot import COAST

r.motor_board.m1 = COAST
```

{{% notice warning %}}
Changing the motor speed by more than 1 in a single operation (e.g. `-1` to `0`, `1` to `-1` etc.) will likely trigger the current protection and your robot will shut down with a distinct beeping noise.
{{% /notice %}}
