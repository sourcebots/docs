---
title: Python API
---

## Setup
The following two lines are required to setup the robot.

```python
from robot import Robot

r = Robot()
```

This will setup your robot and allow it to send and receive data from the robot's various boards. Once this has been setup, this object can be used for most of the functions of the robot.

### Start Button
So your robot doesn't start moving as soon as the robot is finished setting up, the code is paused after setup until the _Start Button_ on the power board is pressed. There is a green LED next to the start button when the robot is finished setting up and the start button can be pressed.

### Logs
So you can see what your robot did, what it didn't do, and any errors it raised, a log file is saved on the USB drive. The file is saved to `log.txt` in the root of the USB. Be careful, this log is cleared each time the robot is setup, so save it off the USB if you need to keep hold of it!
