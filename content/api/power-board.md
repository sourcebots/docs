---
title: Power Board
---

As there is only one power board, it is not accessed like a list like motors for example:

```python
main_board = r.power_board
```

## Power Outputs
The power boards 6 outputs can be turned on and off using the `power_on` and `power_off` functions respectively.

```python
r.power_board.power_off()
```

{{% notice note %}}
`power_on` is called when you setup your robot, so this doesn't need to be called manually. The ports will come on automatically as soon as your robot is ready, before the start button is pressed.
{{% /notice %}}

## Buzzing :bee:

The power board has a piezo buzzer which can buzz.

The `buzz` function accepts multiple parameters, depending on what you want to play. The first argument is the duration of the beep, in seconds. The later arguments are either the note you want to play, or the buzzers frequency (in Hz).

Theoretically, the piezo buzzer will buzz at any provided frequency, however humans can only hear between [20Hz and 20000Hz](https://en.wikipedia.org/wiki/Hearing_range#Humans).  

{{% notice info %}}
To help prevent possible errors, you must specify which argument you're passing. Simply calling `buzz(2, 'c')` will raise a `TypeError`
{{% /notice %}}


```python
# Buzz for half a second in D.
r.power_board.buzz(0.5, note='d')

# Buzz for 2 seconds at 400Hz
r.power_board.buzz(2, frequency=400)
```

{{% notice warning %}}
Passing an invalid note will raise a `KeyError`. You can see all the supported notes by looking at the power boards `BUZZ_NOTES` variable: `print(r.power_board.BUZZ_NOTES)`
{{% /notice %}}


