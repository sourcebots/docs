---
title: Compass
weight: 10
---

The forklift robot has a compass unit. This allows [robots](/robots/) to determine the direction it's facing in the arena.

```python
# Get the heading of the robot.
heading = r.compass.get_heading() # Radians
```

When called, the `get_heading` method will return the heading of the robot in radians as a float. The heading is in the range 0 to tau (2π), where 0 is the robot facing directly North, and values increasing clockwise.
