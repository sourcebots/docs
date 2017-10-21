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

If you already have a board instance, and want to get its serial number, you can use the `serial` property.
