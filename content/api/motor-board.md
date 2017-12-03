---
title: Motor Board
---

The kit can control multiple motors simultaneously. 1 Motor Board can control up to 2 motors.

## Accessing Motor Boards
If there is only one motor board connected, you can use `r.motor_board` to interface with it.
```python
motor_board = r.motor_board
```

When you have more than one Motor Board connected to your kit, they can be accessed based upon their serial number. Assuming your motor board has the serial number `SERIAL`:

```python
motor_board = r.motor_boards['SERIAL']
```

This board object has a property for each of the motors connected to it. These are mapped to the `m1` and `m0` variables. The boards are labelled so you know which motor is which.

```python
r.motor_board.m0
r.motor_board.m1
```

## Powering Motors
Motor power is controlled using PWM with 100% power being a duty cycle of 1. You set the power with a value between `-1` and `1` inclusive (where a negative value puts the motor in reverse).

```python
r.motor_board.m0  = 1
r.motor_board.m1 = -1
```

and these value can then be read back:
```python
r.motor_board.m0
>>> 1

r.motor_board.m1
>>> -1
```

{{% notice warning %}}
Setting an incorrect value will raise an exception and your robot will crash.
{{% /notice %}}  

### Special Values

In addition to the numeric values, there are two text constants that can be used. `robot.BRAKE` and `robot.COAST`. 

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
