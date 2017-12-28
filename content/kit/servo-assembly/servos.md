---
title: Servos
---

By themselves, an Arduino is incapable of driving servos, without a lot of hard work and pin munging. So we're using a shield instead! This shield allows control of 16 servos.

## Connecting your servos
There are a total of 16 servo connectors, grouped into 4 groups of 4. Servo cables are connected with 0V (the black or brown wire) towards the side of the reset button.

## Power
The Arduino itself is powered entirely over USB. If you wish to use servos, you'll need to supply an additional 5V through the connector on the shield from the [power board](/kit/power-board). There are 2 red LEDs next to the power input, but these lights will turn on if the board is correctly powered.
