---
title: Servo Assembly
---

The Servo Assembly handles connection to multiple peripherals:

- [GPIO Pins](gpio) (Digital and Analogue)
- [Servos](servos)
- [Ultrasound](ultrasound)

## Getting a servo board instance

Servo boards can be indexed by either their serial number, or an integer.

### Get a single servo board
```python
board = r.servo_board
```

### Get a specific board
```python
board_one = r.servo_boards['S3rv0']
board_one = r.servo_boards[0]
```

{{% notice tip %}}
If you want to get the serial for a board you can use the `serial` property, i.e. `r.servo_boards[0].serial`
{{% /notice %}}
