---
title: Ultrasound
---

Ultrasound sensors are a useful way of measuring distance when objects are too close for the [webcam](/api/webcam) to detect, or if they don't have markers. Ultrasound sensors communicate primarily over two pins. A signal is sent to the sensor on the _trigger_ pin, and the length of a response pulse on the _echo_ pin can be used to calculate the distance.

{{% notice warning %}}
Ultrasound should only be considered accurate up to around two metres, beyond that the signal can become distorted and produce erroneous results.
{{% /notice %}}

## Wiring up the sensor
The sensor has four pin connections: ground, 5V, _trigger_ and _echo_. Most ultrasound sensors will label which pin is which. The ground and 5V should be wired to the ground and 5V pins of the Arduino respectively. The trigger and echo pins should be attached to two different digital IO pins. Take note of these two pins, you'll need them to [use the sensor](/api/servo-assembly/ultrasound).

{{% notice tip %}}
If the sensor always returns a distance of zero, it means the _trigger_ and _echo_ pins are connected the wrong way! Either change the pins in the code, or swap the connectors.
{{% /notice %}}
