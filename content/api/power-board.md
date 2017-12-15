---
title: Power Board
---

As there is only one power board, it is not accessed like a list like motors for example:

```python
main_board = r.power_board
```

## Power Outputs
The power boards 6 outputs can be turned on and off using the `power_on` and `power_off` functions respectively.

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
