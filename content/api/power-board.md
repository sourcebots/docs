---
title: Power Board
---

The power board can be accessed using the `power_board` property of the `Robot` object.

```python
main_board = r.power_board
```

## Power outputs
The power board's six outputs can be turned on and off using the `power_on` and `power_off` functions respectively.

{{% notice note %}}
`power_on` is called when you setup your robot, so this doesn't need to be called manually. The ports will come on automatically as soon as your robot is ready, before the start button is pressed.
{{% /notice %}}

```python
r.power_board.power_off()
r.power_board.power_on()
```

{{% notice warning %}}
Because the motor board is powered through these power outputs, whilst the power is off, you won't be able to control your motors. This will register as a missing board and your code will break if you try and control them.
{{% /notice %}}

## Buzzing :bee:
The power board has a piezo buzzer which can buzz.

The `buzz` function accepts multiple parameters, depending on what you want to play. The first argument is the duration of the beep, in seconds. The later arguments are either the note you want to play, or the frequency of the buzzer (in Hz). You have to specify which of note or frequency you're passing using a keyword argument, your code will fail otherwise.

Theoretically, the piezo buzzer will buzz at any provided frequency, however humans can only hear between [20Hz and 20000Hz](https://en.wikipedia.org/wiki/Hearing_range#Humans).

{{% notice tip %}}
Calling `buzz` is non-blocking. Meaning it doesn't actually wait for the piezo to stop buzzing before continuing with your code. If you want duration to wait for the buzzing to stop, add a `sleep` afterwards!
{{% /notice %}}


```python
# Buzz for half a second in D.
r.power_board.buzz(0.5, note='d')

# Buzz for 2 seconds at 400Hz
r.power_board.buzz(2, frequency=400)

# Will fail!
r.power_board.buzz(2, 400)
```

{{% notice warning %}}
Passing an invalid note will raise a `KeyError`. You can see all the supported notes by looking at the power boards `BUZZ_NOTES` variable by printing it (`print(r.power_board.BUZZ_NOTES)`), or [looking at the source](https://github.com/sourcebots/robot-api/blob/master/robot/power.py)
{{% /notice %}}

## Start Button
You can manually wait for the start button to be pressed, not only at the start.

```python
r.power_board.wait_start()
```

This may be useful for debugging, but be sure to remove it in the competition, as your robot can't be interacted with!
