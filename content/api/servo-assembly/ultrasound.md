---
title: Ultrasound
---

We noticed many teams used ultrasound sensors to assist the vision system for finer distance measurement. So we've built in the mechanisms for reading and measuring distances using ultrasound right into the kit!

## Reading a distance
Assuming you wired the _trigger_ pin to pin 6, and the _echo_ pin to pin 7, you can query the distance from the sensor using:

```python
r.servo_board.read_ultrasound(6, 7)
>>> 0.524
```

{{% notice info %}}
The returned distance is in metres.
{{% /notice %}}
