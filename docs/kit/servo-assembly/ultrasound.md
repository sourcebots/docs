---
title: Ultrasound
---

Ultrasound sensors are a useful way of measuring distance. Ultrasound sensors communicate with the kit using two wires. A signal is sent to the sensor on the _trigger_ pin, and the length of a response pulse on the _echo_ pin can be used to calculate the distance.

{{% notice warning %}}
Ultrasound should only be considered accurate up to around two metres, beyond which the signal can become distorted and produce erroneous results.
{{% /notice %}}

## Wiring up the sensor
The sensor has four pin connections: ground, 5V (sometimes labelled _vcc_), _trigger_ and _echo_. Most ultrasound sensors will label which pin is which. The ground and 5V should be wired to the ground and 5V pins of the Arduino respectively. The trigger and echo pins should be attached to two different digital IO pins. Take note of these two pins, you'll need them to [use the sensor](../../../api/arduino#ultrasound-sensors).

{{% notice tip %}}
If the sensor always returns a distance of zero, it means the _trigger_ and _echo_ pins are connected the wrong way! Either change the pin numbers in the code, or swap the connections.
{{% /notice %}}
