---
title: Ultrasound
---

We noticed many teams used ultrasound sensors to assist the vision system for finer distance measurement. So we've built in the mechanisms for reading and measuring distances using ultrasound right into the kit!

Ultrasound sensors are connected to 2 pins, a _trigger_ pin, and an _echo_ pin. A signal is sent to the sensor on the _trigger_ pin, and the delay on a response on the _echo_ pin can be used to calculate the distance.

{{% notice warning %}}
Ultrasound should only be considered accurate up to around 2 metres, beyond that the signal can become distorted and produce erroneous results. 
{{% /notice %}}

## Reading a distance
Assuming you wired the _trigger_ pin to pin 6, and the _echo_ pin to pinn 7, you can query the distance from the sensor using:

```python
r.servo_board.read_ultrasound(6, 7)
>>> 0.524
```

{{% notice info %}}
The returned distance is in meters. 
{{% /notice %}}

