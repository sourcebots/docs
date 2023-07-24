# Basic movement

The example program we'll write will do a number of things with the motor: forwards and backwards, and different power settings, for example. Let's begin. To start off, we'll just make a motor move forwards, then backwards, and then repeat.

## Forwards & backwards

Doing this is actually very easy; the only thing you need to realise is that a positive number is forwards and a negative number is backwards.

!!! tip
    The actual direction of travel of a motor, when mounted on a robot, will depend on its orientation and the way in which the wires are connected to the motor board. If the motor appears to be going in the wrong direction, just swap the motor's positive and negative wires over.

Here's the code:

```python
from sbot import Robot

robot = Robot()

while True:
    robot.motor_boards[0].m0.power = 0.5
    robot.motor_boards[0].m1.power = 0.5
    robot.sleep(3)

    robot.motor_boards[0].m0.power = 0
    robot.motor_boards[0].m1.power = 0
    robot.sleep(1.4)

    robot.motor_boards[0].m0.power = -0.5
    robot.motor_boards[0].m1.power = -0.5
    robot.sleep(1)

    robot.motor_boards[0].m0.power = 0
    robot.motor_boards[0].m1.power = 0
    robot.sleep(4)
```

You're familiar with the first few lines; in fact, the only lines you may not be familiar with are the `robot.motor_boards...` lines. For a comprehensive reference to the `motor` object, see [`motor` API](../programming/motor-board.md) page.
But, to summarise:

`robot.motor_boards.m0.power = 0.5` sets the target power of the motor connected to output 0 on the first [motor board](../kit/motor-board.md) to half speed forwards (i.e. a duty-cycle of 0.5 forwards). As you would expect, then, `-0.5` will put the this motor into reverse at half power.
`robot.motor_boards.m0.power = 0` will brake the motor and stop it.

So, if you put the above code on your robot, you should be able to see a motor spin forwards, stop, spin backwards, stop, and then repeat...

!!! info
    If you find that the motor doesn't turn when you run the above code, check that you've got all the cables connected to the right places, in particular note that the motor board has _two_ outputs.

## Changing the speed

Now we're going to modify the program to vary the speed of the motor. Our aim is to do the forwards and backwards bit (as above), but, before we loop round again, ramp the power up to 70%, then down to -70%, and then back to 0 (all in steps of 10%). Here's the code:

```python
from sbot import Robot

robot = Robot()

while True:
    robot.motor_boards[0].m0.power = 0.5
    robot.motor_boards[0].m1.power = 0.5
    robot.sleep(3)

    robot.motor_boards[0].m0.power = 0
    robot.motor_boards[0].m1.power = 0
    robot.sleep(1.4)

    robot.motor_boards[0].m0.power = -0.5
    robot.motor_boards[0].m1.power = -0.5
    robot.sleep(1)

    robot.motor_boards[0].m0.power = 0
    robot.motor_boards[0].m1.power = 0
    robot.sleep(4)

    # ^^ code from before ^^

    # power up to 0.7 (from 0.1)
    for pwr in range(10, 80, 10):
        robot.motor_boards[0].m0.power = pwr / 100.0
        robot.motor_boards[0].m1.power = pwr / 100.0
        robot.sleep(0.1)

    # power down from 0.7 (to 0.1)
    for pwr in range(70, 0, -10):
        robot.motor_boards[0].m0.power = pwr / 100.0
        robot.motor_boards[0].m1.power = pwr / 100.0
        robot.sleep(0.1)

    # set power to 0 for a second
    robot.motor_boards[0].m0.power = 0
    robot.motor_boards[0].m1.power = 0
    robot.sleep(1)

    # power up to -0.7 (from -0.1)
    for pwr in range(-10, -80, -10):
        robot.motor_boards[0].m0.power = pwr / 100.0
        robot.motor_boards[0].m1.power = pwr / 100.0
        robot.sleep(0.1)

    # power down to -0.1 (from -0.7)
    for pwr in range(-70, 0, 10):
        robot.motor_boards[0].m0.power = pwr / 100.0
        robot.motor_boards[0].m1.power = pwr / 100.0
        robot.sleep(0.1)

    # set power to 0 for a second
    robot.motor_boards[0].m0.power = 0
    robot.motor_boards[0].m1.power = 0
    robot.sleep(1)
```

## Next steps

From here, you should be able to make your robot move about in a controlled manner. See if you can make your robot drive forwards to a given point, stop, turn around and then return to its starting point.
