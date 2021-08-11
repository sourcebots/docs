---
title: Simulator
weight: 3
---

To test out your robot code, you can use our Simulator. This gives you a realistic environment to run your code, against a dummy robot, without the need for a physical arena. This simulator is currently only available on Windows.

## Installation

### Prerequisites

You need to download and install Webots R2021b (the download is around 0.5 GB). This is the platform we run our simulation in.

### Python Version

You will also need Python 3.9 installed.

There are a small number of [external libraries](/api#included-libraries) which will be available to your robot code during the competition. For local development you will need to install these yourself.

{{% notice warning %}} If you are installing python on Windows, you will need to add python to PATH otherwise Webots will not be able to find the python installation {{% /notice %}}

### Installing the simulation

 1.   Download the simulation, and unzip it somewhere on your computer.
 2.   Using the Webots IDE, open the `worlds/Arena.wbt` file.

You may receive a warning about your computer’s GPU not being good enough, which can be ignored

### Changing your version of Python

If Webots is picking up the incorrect version of Python, you’ll need to change it. This can be done using Tools > Preferences > General > Python command. You’ll need to ensure a matching version of Python is installed.


## Overview

Within the Webots IDE, there are a few different panels:

- In the centre of your screen is the 3D simulated view of the arena
- On the left is a tree hierarchy of all elements in this “world”
- At the bottom is the console, where output from your robot code will be displayed
- At the top are your general controls which include the time controls. Press the centre play button to run the simulation at normal speed.

## Other robots

There is another robot in the arena, in its starting zone. By default, this robot will not move.

To control the other robot, you will need to provide its code:

Create the robot code in `zone-1/robot.py`. Your code at `robot.py` will be used for zone 0, though you are encouraged to move your code to `zone-0/robot.py` when running multiple robots. Robots which do not have any robot code in their `zone-x` directory will not do anything.

``` plain
.
├── competition-simulator
│   ├── controllers
│   │   ├── example_controller
│   │   └── sr_controller
│   ├── ...
│   └── worlds
└── robot.py
```

## Time

In the simulated environment, time advances only at the pace that the simulator is run. The relation between this time and the real passage of time depends on a couple of factors: the speed the simulation is configured to run at and the ability of the computer running the simulation to process it fast enough.

You can configure and observe the speed the simulator is running at from the toolbar in Webots:
![alt text](https://www.studentrobotics.org/docs/images/content/simulator/speed-toolbar.png)

Here the simulation has run for 13.28 seconds, but is currently paused (the speed multiplier shows 0.00×). You could choose to step a single time increment, run the simulator at real speed (▶), or run the simulator at various faster speeds (▶▶ and ▶▶▶).

These differences mean that your code will need to use a different mechanism to find the current time or to sleep within the simulation. Find out more by heading over to the programming docs on time.

## Useful Links
- [Camera Controls](https://www.cyberbotics.com/doc/guide/the-3d-window#navigation-in-the-scene)
- [Graphics Settings](https://www.cyberbotics.com/doc/guide/preferences#opengl)
