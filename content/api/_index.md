---
title: Python API
weight: 1
---

## Setup
The following two lines are required to setup the robot.

```python
from robot import Robot

r = Robot()
```

This will setup your robot and allow it to send and receive data from the robot's various boards. Once this has been setup, this object can be used for most of the functions of the robot.

The remainder of the tutorials pages will assume your robot is defined as `r`.

## Where to put your code
Your code needs to be put on a USB drive in a file called `main.py`. On insertion, this file will be executed. The file is directly executed off your USB drive, with your drive as the working directory.

{{% notice warning %}}
If this file is missing or incorrectly named, your robot won't do anything. No log file will be created.
{{% /notice %}}

## Start Button
So your robot doesn't start moving as soon as the robot is finished setting up, the code is paused after setup until the _Start Button_ on the power board is pressed. There is a green LED next to the start button when the robot is finished setting up and the start button can be pressed.

## Logs
So you can see what your robot did, what it didn't do, and any errors it raised, a log file is saved on the USB drive. The file is saved to `log.txt` in the root of the USB.

{{% notice warning %}}
The log file is deleted on each run, so save it (Ideally off the USB) if you need to keep hold of it!
{{% /notice %}}

## Serial Number
All kit boards have a serial number, unique to that specific board, which can be read using the `serial` property:

```python
r.power_board.serial
>>> 'P1'
r.serial_board.serial
>>> 'S1'
r.motor_board.serial
>>> 'M1'
```
