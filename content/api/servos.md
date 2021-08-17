---
title: Servos
---

{{% notice note %}}
Servos only apply to the [physical robot](/robots/physical/).
{{% /notice %}}

You can control attached servo motors from the [arduino](../arduino/). By default, servos will be unpowered when your robot starts, and can freely rotate when turned by hand. Upon setting a value, they will hold the corresponding position. They will become unpowered again when you turn off your robot, unplug your USB stick, or set their position to the special value `None`.

## Querying servos

The servo assembly can interface with up to sixteen servos connected to it.

```python
servo_one = r.arduino.servos[1]
```

{{% notice tip %}}
Servo can be connected to any port, you don't have to start at 0!
{{% /notice %}}

## Controlling servos

Servos can be controlled using the `position` parameter. This should be set to a value between -1 and 1.

```python
servo_one.position = 0.65
print(servo_one.position)
>>> 0.65
```

{{% notice tip %}}
When `position` is set to `None`, the servo loses power and can freely rotate. This is the same state they're in at start-up.
{{% /notice %}}
