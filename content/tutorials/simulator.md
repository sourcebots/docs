---
title: Simulator
---

To test out your robot code, you can use our Simulator. This gives you a realistic environment to run your code, against a dummy robot, without the need for a physical arena. This simulator is currently only available on Windows.

## Installation

1. [Download the Simulator](https://drive.google.com/file/d/16cGGOMruRT4f_5V_DPKOLaJuP82h7NGP/view?usp=sharing), and extract it into a directory.
2. Edit the existing `test.py`.
3. Run `run.bat`. This will launch 2 windows: The simulator itself, and a terminal which will hold the output of your application.

## Changing your version of Python

If webots is picking up the incorrect version of Python, you’ll need to change it. This can be done using Tools > Preferences > General > Python command. You’ll need to ensure a matching version of Python is installed. If you are experiencing issues then please talk to a demonstrator. 

## Overview

Within the Webots IDE, there are a few different panels:

- In the centre of your screen is the 3D simulated view of the arena
- On the left is a tree hierarchy of all elements in this “world”
- At the bottom is the console, where output from your robot code will be displayed
- At the top are your general controls which include the time controls. Press the centre play button to run the simulation at normal speed.

## Time

In the simulated environment, time advances only at the pace that the simulator is run. The relation between this time and the real passage of time depends on a couple of factors: the speed the simulation is configured to run at and the ability of the computer running the simulation to process it fast enough.

You can configure and observe the speed the simulator is running at from the toolbar in webots:
![alt text](https://www.studentrobotics.org/docs/images/content/simulator/speed-toolbar.png)

Here the simulation has run for 13.28 seconds, but is currently paused (the speed multiplier shows 0.00×). You could choose to step a single time increment, run the simulator at real speed (▶), or run the simulator at various faster speeds (▶▶ and ▶▶▶).

These differences mean that your code will need to use a different mechanism to find the current time or to sleep within the simulation. Find out more by heading over to the programming docs on time.
