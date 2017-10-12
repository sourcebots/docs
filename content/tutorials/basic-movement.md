---
title: Basic Movement
---

The aim of this tutorial is to get a motor turning with your kit.
To complete this tutorial, you'll need the following:

* The [power board](/docs/kit/power_board)
* The battery (charged, of course)
* The cable to connect the battery to the power board
* A [motor board](/docs/kit/motor_board)
* 2 large (7.5mm) green _CamCon_ connectors to plug the power board and motor board together
* 2 lengths of a suitable gauge of wire for powering the motor board from the power board (one should be black/grey)
* A motor (see specification below)
* A small (5mm) green _CamCon_ connector to plug the motor and motor board together
* 2 lengths of a suitable gauge of wire for your motor
* A Micro USB cable
* A USB hub
* A standard USB cable
* The memory stick
* A soldering Iron
* Some solder wire
* Wire strippers
* A small slotted/flat blade screwdriver (for the _CamCon_ screws)

You should be familiar with the setup for most of the above now, so it's just
the motor-related parts that need explaining.


Motor Specification
-------------------

There is a certain specification the motor(s) you use must meet.
The criteria are as follows:

* 12V motor
* A stall current of less than 10A (this is the current limit for the [motor boards](/docs/kit/motor_board))

<div class="info">
    When designing your robot you should bear in mind that while each motor board can deliver 10A on each output,
    all the power needs to go through the power board, which is fused at 15A.
    This means that across all the outputs for all the motors,
    you can only draw up to 15A at any time.
</div>

Connecting a Motor
------------------

To plug the motor into the kit,
 you'll need to solder an appropriate gauge of wire to the terminals on the motor,
 and connect the other ends to the _CamCon_ connector.
Like so:

![Motor connected to CamCon]({{ site.baseurl }}/images/content/kit/motor_and_camcon.png)

<div class="info">You may want to insulate the motor's terminals with some insulation tape (or heat shrink tubing if you've got it) like in the image above.</div>

Now you need to connect the motor to one of your motor boards.
You'll need to connect the following:

* Your motor into the motor 0 socket on the motor board
* The micro USB cable from the motor board to the USB hub
* The standard USB cable from the USB hub to the power board

This is almost ready, but the motor board also needs the power that it will be delivering to the motor.
This is done by connecting together the two larger _CamCon_ connectors, using the other two lengths of wire.
Be sure that the cable connects the positive motor rail output ("+") of the power board to the positive power input of the motor board, and likewise for the ground ("-") output &mdash;
 see the [power board](/docs/kit/power_board) and [motor board](/docs/kit/motor_board)
 documentation to see which is which.

<div class="info">
    You must always use black or grey for ground (0V) connections (and only for these), so that it's clear where these are.
</div>

You can now connect this into the power board on one end, and the motor board power connection on the other.

Some Code
--------

<div class="warning">
    You might want to ensure the motor won't take the kit anywhere when you
    press the run button when testing some of the below code (unless it's in a robot, of course).
</div>

The example program we'll write will do a number of things with the motor:
forwards and backwards, and different power settings, for example.
Let's begin.

To start off with, we'll just make a motor move forwards, then backwards, and then repeat.


### Forwards & Backwards

Doing this is actually very easy; the only thing you need to realise is that a positive number is forwards and a negative number is backwards.

<div class="warning">
    The actual direction of travel of a motor, when mounted on a robot,
    will depend on its orientation and the way in which the wires are connected to the motor board.
    If the motor appears to be going in the wrong direction,
    just swap the motor's positive and negative wires over.
</div>

Here's the code:

~~~~~ python
from sr.robot import *
import time

R = Robot()

while True:

    R.motors[0].m0.power = 50
    time.sleep(3.0)

    R.motors[0].m0.power = 0
    time.sleep(1.4)

    R.motors[0].m0.power = -50
    time.sleep(1)

    R.motors[0].m0.power = 0
    time.sleep(4)
~~~~~

You're familiar with the first few lines; in fact, the only lines you may not be familiar with are the `R.motors[0]...` lines.
For a comprehensive reference to the `motor` object, see the `sr.robot` module's [`motor`](/docs/programming/sr/motors/) page.
But, to summarise:

<div class="info">
    `R.motors[0].m0.power = x` will set the power of the motor connected to output 0 (the `m0` part)
    on the first [motor board](/docs/kit/motor_board) (the `motors[0]` part)
    plugged in to a USB hub to `x`, where `x` is a value between `-100` and `100`,
    inclusive &mdash; in other words: `-100` &le; `x` &le; `100`.
</div>

So, `R.motors[0].m0.power = 50` sets the target power of the motor connected to output 0 on the first [motor board](/docs/kit/motor_board)
 plugged in to a USB hub to 50% forwards (i.e. a duty-cycle of 0.5 forwards).
As you would expect, then, `R.motors[0].m0.power = -50` will put the this motor into reverse at 50% power.
`R.motors[0].m0.power = 0` will output no power to the motor and stop it.

So, if you put the above code on your robot,
 you should be able to see a motor spin forwards, stop, spin backwards, stop, and then repeat...

<div class="info">
    If you find that the motor doesn't turn when you run the above code,
     check that you've got all the cables connected to the right places,
     in particular note that the motor board has _two_ outputs.
</div>

### Changing the Speed

Now we're going to modify the program to vary the speed of the motor.
Our aim is to do the forwards and backwards bit (as above), but, before we loop round again,
 ramp the power up to 70%, then down to -70%, and then back to 0 (all in steps of 10%).

Here's the code:

~~~~~ python
from sr.robot import *
import time

R = Robot()

while True:

    R.motors[0].m0.power = 50
    time.sleep(3.0)

    R.motors[0].m0.power = 0
    time.sleep(1.4)

    R.motors[0].m0.power = -50
    time.sleep(1)

    R.motors[0].m0.power = 0
    time.sleep(4)

    # ^^ code from before ^^

    # power up to 70 (from 10)
    for pwr in range(10, 80, 10):
        R.motors[0].m0.power = pwr
        time.sleep(0.1)

    # power down from 70 (to 10)
    for pwr in range(70, 0, -10):
        R.motors[0].m0.power = pwr
        time.sleep(0.1)

    # set power to 0 for a second
    R.motors[0].m0.power = 0
    time.sleep(1)

    # power "up" to -70 (from -10)
    for pwr in range(-10, -80, -10):
        R.motors[0].m0.power = pwr
        time.sleep(0.1)

    # power "down" to -10 (from -70)
    for pwr in range(-70, 0, 10):
        R.motors[0].m0.power = pwr
        time.sleep(0.1)

    # set power to 0 for a second
    R.motors[0].m0.power = 0
    time.sleep(1)

~~~~~

Again, as you've seen most of that before, it shouldn't be too difficult to get your head around.
The `for` loop may be new, however.
The [`for`](http://docs.python.org/tutorial/controlflow.html#for-statements)
 loop accepts a Python `list` (a `list`, when `print`ed, appears in square brackets like so: `[1, 2, 3]`).
For a comprehensive introduction to to `list`s, have a look at [this WikiBooks article](http://en.wikibooks.org/wiki/Python_Programming/Lists).
The `for` loop will iterate over the `list` (i.e. take each element in turn)
 and make it available in the loop's body as the variable after the the `for` keyword.
Here's an example:

~~~~~ python
for i in [1, 2, 3]:
	print i
~~~~~

The above would output:

~~~~~ not-code
1
2
3
~~~~~

Then there's the [`range()`](http://docs.python.org/library/functions.html#range) function.
The `range()` function returns a `list` with its contents dependent on the arguments passed to it.
The Python documentation explains it quite nicely:

> `range([start], stop[, step])` (note: the square brackets here mean 'optional')
>
> If the `step` argument is omitted, it defaults to `1`. If the `start` argument is
> omitted, it defaults to `0`. The full form returns a list of plain integers
> `[start,  start + step, start + 2 *  step, ...]`. If `step` is positive, the last
> element is the largest `start + i * step` less than `stop`; if `step` is negative,
> the last element is the smallest `start + i * step` greater than `stop`.

So, based on that, `range(3)` would return the list `[0, 1, 2]` because it is shorthand for `range(0, 3, 1)`.
From the quote, you can see that this would return a list starting from `0`,
 and finishing with the integer one less than `3`, hence the `[0, 1, 2]`.

So, taking `range(10, 80, 10)`, for example, would output `10` as the first element,
 then `20, 30, ...` up until `x=10+i*10` for some `i` where `i` ensures `x < stop` (which, in this case, is `80`).
So, the `80` I've used could equally have been `77` or even `71` and the outputted `list` would still be `[10, 20, 30, 40, 50, 60, 70]`.

Putting all of that together should mean you understand the above code.
You might want to run the code on your kit to see if it does what you expect it to.


Next Steps
----------

From here, you should be able to make your robot move about in a controlled manner.
See if you can make your robot drive forwards to a given point, stop, turn around and then return to its starting point.

You might also like to see if you can make the larger code example above more concise by creating functions for the repetitive parts.
[This](http://www.tutorialspoint.com/python/python_functions.htm) tutorial seems good if you're interested.

