---
title: Servos
---

From the servo assembly, you can control the attached servos. By default, servos will be unpowered when your robot starts, and can freely rotate. Once you set a value, they then fix to that rotation. This also happens when you turn off your robot, or unplug your USB stick.

## Querying servos

The servo assembly can interface with multiple servos connected to it.

```python
servo_one = r.servo_board.servos[1]
```

{{% notice tip %}}
Servo can be connected to any port, you don't have to start at 0!
{{% /notice %}}

## Controlling Servos

Servos can be controlled using the `position` parameter. This should be set to a value between -1 and 1.  

```python
servo_one.position = 0.65
print(servo_one.position)
>>> 0.65
```

{{% notice tip %}}
When `position` is set to 0, the servo loses power and can freely rotate. The same state they're in at start-up.
{{% /notice %}}


