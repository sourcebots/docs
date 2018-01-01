---
title: Ultrasound
---

The servo assembly has support for measuring distances using [ultrasound sensors](/kit/servo-assembly/ultrasound), which can provide finer distance measurement than the [vision system](/api/vision).

## Reading a distance
Assuming you wired the _trigger_ pin to pin 6, and the _echo_ pin to pin 7, you can query the distance from the sensor using:

```python
r.servo_board.read_ultrasound(6, 7)
>>> 0.524
```

{{% notice info %}}
The returned distance is in metres. 
{{% /notice %}}

