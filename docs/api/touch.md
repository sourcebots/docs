---
title: Touch Sensors
weight: 7
---

![Touch sensor](/img/api/touch-sensor.png?width=600px)
 
Microswitches, or touch sensors, are used to measure when something is touching the sensor.

## Reading the touch sensor
 
The touch sensors will be connected to a specific pin in the Arduino, typically wired in such a way that the pin's voltage is changed when the switch is pressed by an object.

To read this, you need to read the digital value of the correct pin. You can get the correct pin number by looking at [the documentation for the robot](/robots/), then writing the code like so:

``` python
# Get if something is touching the touch sensor.
is_touching = r.arduino.pins[pin].digital_state # True or False
```