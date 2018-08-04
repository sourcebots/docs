---
title: Ultrasound
---

The servo assembly has support for measuring distances using [ultrasound sensors](/kit/servo-assembly/ultrasound).

## Reading a distance
Assuming you wired the ultrasound sensor's _trigger_ pin to digital pin 6 on the servo assembly, and the _echo_ pin to pin 7, you can query the distance from the sensor using:

```python
r.servo_board.read_ultrasound(6, 7)
>>> 0.524
```

{{% notice info %}}
The returned distance is in metres.
{{% /notice %}}
