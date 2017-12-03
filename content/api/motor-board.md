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
left_motor = r.motor_board.m0
right_motor = r.motor_board.m1
```

## Powering Motors
Motor power is controlled using PWM with 100% power being a duty cycle of 1. You set the power with an integer value between `-1` and `1` inclusive (where a negative value puts the motor in reverse).
The field to change the output power is `voltage`.

{{% notice info %}}
This number is not the actual voltage being applied to the motor.
{{% /notice %}}

```python
left_motor.voltage  = 1
right_motor.voltage = -1
```

and these value can then be read back:
```python
left_motor.voltage
>>> 1

right_motor.voltage
>>> -1
```

{{% notice warning %}}
Setting `voltage` to an incorrect value will raise an exception and your robot will crash.
{{% /notice %}}  

### Special Values

In addition to the numeric values, there are two text constants that can be used. `robot.BRAKE` and `robot.COAST`. 

#### `robot.BRAKE`
`robot.BRAKE` will stop the motors from turning, and thus stop your robot as quick as possible.

{{% notice tip %}}
`robot.BRAKE` does the same as setting your robots power to `0`.
{{% /notice %}}  

```python
from robot import BRAKE

r.motor_board.m0.voltage = BRAKE
```

#### `robot.COAST`
`robot.COAST` will stop applying power to the motors. This will mean they continue moving under the momentum they had before. 


```python
from robot import COAST

r.motor_board.m1.voltage = COAST
```

{{% notice warning %}}
Changing motor speed by more than 1 in a single operation (e.g. `-1` to `0`, `1` to `-1` etc) will likely trigger the current protection and your robot will shut down with a distinct beeping noise.
{{% /notice %}} 

