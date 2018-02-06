---
title: Python API
weight: 1
---

Programming your robot is done in [Python](https://www.python.org/), specifically version {{% python_patch_version %}}. You can learn more about Python from their [docs](https://docs.python.org/{{% python_minor_version %}}/), and our [whirlwind tour](/tutorials/python-whirlwind-tour).

## Setup
The following two lines are required to complete initialisation of the kit:

```python
from robot import Robot

r = Robot()
```

Once this has been done, this `Robot` object can be used to control the robot's functions.

The remainder of the tutorials pages will assume your `Robot` object is defined as `r`.

## Running your code
Your code needs to be put on a USB drive in a file called `main.py`. On insertion into the robot, this file will be executed. The file is directly executed off your USB drive, with your drive as the working directory.

To stop your code running, you can just remove the USB drive. This will also
stop the motors and any other peripherals connected to the kit.

You can then reinsert the USB drive into the robot and it will run your
`main.py` again (from the start). This allows you to make changes and test them
quickly.

{{% notice info %}}
If this file is missing or incorrectly named, your robot won't do anything. No log file will be created.
{{% /notice %}}

## Start Button
After the robot has finished starting up, it will wait for the _Start Button_ on the power board to be pressed before continuing with your code, so that you can control when it starts moving. There is a green LED next to the start button which flashes when the robot is finished setting up and the start button can be pressed.

## Logs
A log file is saved on the USB drive so you can see what your robot did, what it didn't do, and any errors it raised. The file is saved to `log.txt` in the top-level directory of the USB drive.

{{% notice warning %}}
The previous log file is deleted at the start of each run, so copy it elsewhere if you need to keep hold of it!
{{% /notice %}}

## Serial number
All kit boards have a serial number, unique to that specific board, which can be read using the `serial` property:

```python
r.power_board.serial
>>> 'P1'
r.servo_board.serial
>>> 'S1'
r.motor_board.serial
>>> 'M1'
```
