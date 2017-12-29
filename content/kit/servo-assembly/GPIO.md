---
title: GPIO
---

The Arduino allows you to connect your kit to your own electronics. It has 14 digital I/O pins, and 6 analogue. The analogue pins can read an analogue signal from 0 to 5V. The board also has a couple of ground pins, as well as some pins fixed at 3.3V and 5V output.

The pin layout of the servo assembly is the same as an Arduino uno.

{{% notice note %}}
The Arduino communicates with the servo shield using two of the analogue input pins (4 and 5), and with the Raspberry Pi using two of the digital IO pins (0 and 1). These four pins are therefore reserved, and using them may cause the Arduino or servo shield to behave unusually.
{{% /notice %}}

![Pin Map](https://raw.githubusercontent.com/Bouni/Arduino-Pinout/master/Arduino%20Uno%20R3%20Pinout.png?width=50pc)
