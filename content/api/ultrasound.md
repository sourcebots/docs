---
title: Ultrasound Sensors
weight: 7
---
 
Ultrasound sensors can measure distance of objects from the sensor. Ultrasound sensors emit a pulse of very high frequency sound, and measure the time it takes to hear an echo, typically Ultrasound sensors have electronics on the sensor to decide when an echo is received, and reports back a number as the distance in meters.

Ultrasound sensors measure distance in a 18 degree diameter cone in front of the sensor, and report the closest measured distance in that cone. Ultrasound sensors also have a maximum distance. (Ultrasound sensors typically also have a minimum distance too, but we do not simulate that in our simulator).

In our robots, ultrasound sensors are connected to the 'Arduino' board, which is used to read sensors for many different purposes. Keep reading to learn how to take measurements.
 
## Reading the ultrasound sensor
 
The ultrasounds sensors will be connected to a specific pin in the Arduino, and will constantly measure distances. Consult the description of the [robot](../../robots/) to see which pin you should use. The analogue value of the pin will be the measured distance, in metres.

Ultrasound sensors have a maximum range of 2 metres, if objects are further than 2m away from the robot, it will report a distance of 2m.

``` python
# Get the closest distance to the ultrasound sensor is reading.
distance_metres = r.arduino.pins[pin].analogue_value
```