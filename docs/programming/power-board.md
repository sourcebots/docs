# Power Board API

The power board can be accessed using the `power_board` property of
the `Robot` object.

```python
my_power_board = robot.power_board
```

## Power outputs

The six outputs of the power board are grouped together as `power_board.outputs`.

The power board's six outputs can be turned on and off using the
`power_on` and `power_off` functions of the group respectively.

!!! tip
    `power_on` is called when you set up your robot, so
    this doesn't need to be called manually. The ports will come on
    automatically as soon as your robot is ready, before the start button is
    pressed.

```python
robot.power_board.outputs.power_off()
robot.power_board.outputs.power_on()
```

You can also get information about and control each output in the group.
An output is indexed using the appropriate `PowerOutputPosition`.

```python
from sbot import PowerOutputPosition

robot.power_board.outputs[PowerOutputPosition.H0].is_enabled = True
robot.power_board.outputs[PowerOutputPosition.L3].is_enabled = False

boolean_value = robot.power_board.outputs[PowerOutputPosition.L2].is_enabled

current_amps = robot.power_board.outputs[PowerOutputPosition.H1].current
```

!!! warning
    The motor and servo boards are powered through these
    power outputs, whilst the power is off, you won't be able to control
    your motors or servos. They will register as a missing board and your code will
    break if you try and control them.

## Battery Sensor

The power board has some sensors that can monitor the status of your battery.
This can be useful for checking the charge status of your battery.

```python
battery_voltage = robot.power_board.battery_sensor.voltage
battery_current_amps = robot.power_board.battery_sensor.current
```

## Buzzing 🐝

The power board has a piezo sounder which can buzz.

The `buzz` function accepts two parameters. The first argument is the duration of the beep, in seconds.
The second argument is either the note you want to play, or the frequency of the buzzer (in Hertz).

Theoretically, the piezo buzzer will buzz at any provided frequency,
however humans can only hear between [20Hz and
20000Hz](https://en.wikipedia.org/wiki/Hearing_range#Humans).

The `Note` enum provides notes in [scientific pitch notation](https://en.wikipedia.org/wiki/Scientific_pitch_notation) between
`C6` and `C8`. You can play other tones by providing a frequency.

!!! tip
    Calling `buzz` is non-blocking, which means it doesn't
    actually wait for the piezo to stop buzzing before continuing with your
    code. If you want to wait for the buzzing to stop, add a
    `sleep` afterwards! If you send more than 32 beeps to the robot too
    quickly, your power board will crash!

```python
from sbot import Note

# Buzz for half a second in D6.
robot.power_board.piezo.buzz(0.5, Note.D6)

# Buzz for 2 seconds at 400Hz
robot.power_board.piezo.buzz(2, 400)
```

## Start Button

You can manually wait for the start button to be pressed, not only at
the start.

```python
robot.wait_start()
```

This may be useful for debugging, but be sure to remove it in the
competition, as you won't be allowed to touch the start button after a match has begun!
