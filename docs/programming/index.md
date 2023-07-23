# Programming

Programming your robot is done in [Python](https://www.python.org/),
specifically version 3.9.6. You can learn more about Python from their
[docs](https://docs.python.org/3/), and our whirlwind tour.

Each board has an API which allows its various functionality to be controlled.

## Setup

The following two lines are required to complete initialisation of the
kit:

``` python
from sbot import *

r = Robot()
```

Once this has been done, this `Robot` object can be used to control the
robot's functions.

The remainder of the tutorials pages will assume your `Robot` object is
defined as `r`.

## Running your code

Your code needs to be put on a USB drive in a file called `robot.py`. When connected to the robot, this file will be executed. The file is directly executed off your USB drive, with your drive as the working directory.

!!! tip
    If this file is missing or incorrectly named, your robot won't do anything. No log file will be created.

To stop your code running, you can just remove the USB drive. This will also stop the motors and any other peripherals connected to the kit.

You can then reinsert the USB drive into the robot, and it will run your `main.py` again (from the start). This allows you to make changes and test them quickly.

## Logs

A log file is saved to your USB so you can see what your robot did,
what it didn't do, and any errors it raised. The file is saved to log.txt in the top-level directory of the USB drive.

!!! warning
    The previous log file is deleted at the start of each run, so copy it elsewhere if you need to keep hold of it!

## Running Code before pressing the start button

If you want to do things before the start button press, such as setting up servos or motors, you can pass `wait_start` to the `Robot` constructor. You will then need to wait for the start button manually.

```python
r = Robot(wait_start=False)

# Do your setup here

r.wait_start()
```

## Debug mode

It is possible to run your robot in "Debug Mode".

In "Debug Mode", your robot will print more information about what it is doing.

```python
from sbot import Robot
r = Robot(debug=True)
```

!!! info
    Debug mode is quite verbose. It will print a lot of information that you will not need.

## Included Libraries

Python already comes with plenty of [built-in
libraries](https://docs.python.org/3.9/py-modindex.html) to use. We
install some extra ones which may be of use:

- [numpy 1.25.0](https://pypi.org/project/numpy/1.25.0/)
- [matplotlib 3.7.1](https://pypi.org/project/matplotlib/3.7.1/)
- [pandas 2.0.3](https://pypi.org/project/pandas/2.0.3/)
- [scipy 1.11.1](https://pypi.org/project/scipy/1.11.1/)

!!! tip
    If you would like an extra library installed, go and ask a volunteer to see if we can help.

*[API]: Application Programming Interface
