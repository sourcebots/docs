---
title: Basic Movement
---

The aim of this tutorial is to get a motor turning with your kit. To complete this tutorial, you'll need the following:

* The [power board](/kit/power-board)
* A [motor board](/kit/motor-board)
* The [Raspberry Pi](/kit/pi)
* The battery (charged, of course)
* 2 large (7.5mm) green _CamCon_ connectors to plug the power board and motor board together
* 2 lengths of a suitable gauge of wire for powering the motor board from the power board (one should be black/grey)
* A motor (see specification below)
* A small (5mm) green _CamCon_ connector to plug the motor and motor board together
* 2 lengths of a suitable thickness of wire for your motor
* 2 Micro USB cables
* The Raspberry Pi power cable

You'll also need these, which aren't provided with your kit:

* The memory stick
* A soldering Iron
* Some solder wire
* Wire strippers
* A small slotted/flat blade screwdriver (for the _CamCon_ screws)

You should be familiar with the setup for most of the above now from the [kit assembly tutorial](/tutorials/kit-assembly/), so it's just the motor-related parts that need explaining.

## Motor Specification
There is a certain specification the motor(s) you use must meet. The criteria are as follows:

* 12V motor
* A stall current of less than 10A (this is the current limit for the [motor boards](/kit/motor_board)

{{% notice note %}}
When designing your robot you should bear in mind that while each motor board can deliver 10A on each output, all the power needs to go through the power board, which has its own [limiting per output](/kit/power-board/#specification).
{{% /notice %}}

## Connecting a Motor
To plug the motor into the kit, you'll need to solder an appropriate gauge of wire to the terminals on the motor, and connect the other ends to the _CamCon_ connector. Like so:

![Motor connected to CamCon](/img/assembly/motor_and_camcon.png)

{{% notice tip %}}
You may want to insulate the motor's terminals with some insulation tape (or heat shrink tubing if you've got it) like in the image above.
{{% /notice %}}

Now you need to connect the motor to one of your motor boards. You'll need to connect the following:

* Your motor into the motor 0 socket on the motor board
* The micro USB cable from the motor board to the USB hub

This is almost ready, but the motor board also needs the power that it will be delivering to the motor. This is done by connecting together the two larger _CamCon_ connectors, using the other two lengths of wire. Be sure that the cable connects the positive motor rail output ("+") of the power board to the positive power input of the motor board, and likewise for the ground ("-") output. See the [power board](/kit/power_board) and [motor board](/kit/motor_board) documentation to see which is which.

{{% notice tip %}}
You must always use black or grey for ground (0V) connections (and only for these), so that it's clear where these are.
{{% /notice %}}

You can now connect this into the power board on one end, and the motor board power connection on the other.

## Some Code

The example program we'll write will do a number of things with the motor: forwards and backwards, and different power settings, for example. Let's begin. To start off with, we'll just make a motor move forwards, then backwards, and then repeat.

### Forwards & Backwards

Doing this is actually very easy; the only thing you need to realise is that a positive number is forwards and a negative number is backwards.

{{% notice warning %}}
The actual direction of travel of a motor, when mounted on a robot, will depend on its orientation and the way in which the wires are connected to the motor board. If the motor appears to be going in the wrong direction, just swap the motor's positive and negative wires over.
{{% /notice %}}

Here's the code:

```python
from robot import Robot
import time

r = Robot()

while True:
    r.motor_board.m0 = 0.5
    time.sleep(3)

    r.motor_board.m0 = 0
    time.sleep(1.4)

    r.motor_board.m0 = -0.5
    time.sleep(1)

    r.motor_board.m0 = 0
    time.sleep(4)
```

You're familiar with the first few lines; in fact, the only lines you may not be familiar with are the `r.motor_board...` lines. For a comprehensive reference to the `motor` object, see [`motor` API](/api/motor-board) page.
But, to summarise:

So, `r.motor_board.m0 = 0.5` sets the target power of the motor connected to output 0 on the first [motor board](/kit/motor_board) plugged in to a USB hub to half speed forwards (i.e. a duty-cycle of 0.5 forwards). As you would expect, then, `-0.5` will put the this motor into reverse at half power.
`r.motor_board.m0 = 0` will brake the motor and stop it.

So, if you put the above code on your robot, you should be able to see a motor spin forwards, stop, spin backwards, stop, and then repeat...

{{% notice note %}}
If you find that the motor doesn't turn when you run the above code, check that you've got all the cables connected to the right places, in particular note that the motor board has _two_ outputs.
{{% /notice %}}

### Changing the Speed

Now we're going to modify the program to vary the speed of the motor. Our aim is to do the forwards and backwards bit (as above), but, before we loop round again, ramp the power up to 70%, then down to -70%, and then back to 0 (all in steps of 10%). Here's the code:

```python
from robot import Robot
import time

r = Robot()

while True:

    r.motor_board.m0 = 0.5
    time.sleep(3)

    r.motor_board.m0 = 0
    time.sleep(1.4)

    r.motor_board.m0 = -0.5
    time.sleep(1)

    r.motor_board.m0 = 0
    time.sleep(4)

    # ^^ code from before ^^

    # power up to 0.7 (from 0.1)
    for pwr in range(10, 80, 10):
        r.motor_board.m0 = pwr / 100.0
        time.sleep(0.1)

    # power down from 0.7 (to 0.1)
    for pwr in range(70, 0, -10):
        r.motor_board.m0 = pwr / 100.0
        time.sleep(0.1)

    # set power to 0 for a second
    r.motor_board.m0 = 0
    time.sleep(1)

    # power up to -0.7 (from -0.1)
    for pwr in range(-10, -80, -10):
        r.motor_board.m0 = pwr / 100.0
        time.sleep(0.1)

    # power down to -0.1 (from -0.7)
    for pwr in range(-70, 0, 10):
        r.motor_board.m0 = pwr / 100.0
        time.sleep(0.1)

    # set power to 0 for a second
    r.motor_board.m0 = 0
    time.sleep(1)
```

## Next Steps

From here, you should be able to make your robot move about in a controlled manner. See if you can make your robot drive forwards to a given point, stop, turn around and then return to its starting point.

