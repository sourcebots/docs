# Documentation

This is the documentation showing how to use the robot's API.

## Setup

The following two lines of python code are required to setup the robot.

```python
from robot import Robot

robot = Robot()
```

This will initialize the robot's api calls and allow it to send and receive data from the robot's various boards.

Once this has been setup, you can use this variable for pretty much every function of the robot.

## Motor Boards
in order to use a motor board, you will have to read the serial number off the motor board.

## Power Board

## Servos (Ruggeduino)

## Vision
You can call a list of markers that are currently visible to the robot by calling the robot object's see method. This list can them be iterated over in a for each loop. See example below
```python
markers = robot.see()
for m in markers:
  print(m.type)
```
### Markers
Makers, which are done using april tags are their own objects within the system. When the see method is called, a list of Marker objects are created, these have the following properties:
