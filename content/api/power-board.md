---
title: Power Board
---

```python
# get the first power board
main_board = r.power_board

# get the power board by serial number
main_board = r.power_boards['SERIAL']

# get the first power board
main_board = r.power_boards[0]
```

This power board object has two functions, `power_on()` and `power_off()` these turn the power on and off to the connected boards respectively.

`power_on()` is called during initialisation, so this doesn't need to be called manually.

