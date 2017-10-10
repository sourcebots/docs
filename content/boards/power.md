---
title: Power Board
---

The Power Board distributes power to the SR kit from the battery. It provides
six individual general-purpose power outputs along with a separate power connector
for the Brain Board.

It also holds the internal On|Off switch for the whole robot as well as
the Start button which is used to start your robot code running.

## Connectors

There are six power output connectors on the board, labelled L0–L3, H0, and H1. These are enabled when your robot code is started, and supply around 11.1V (±15%). They should be used to connect to the motor and servo board power inputs. The "H" connectors will supply more current than the "L" connectors.

The 5V connectors can be used to connect low-current devices that take 5V inputs, such as the Brain Board.

There is also a Micro USB B connector which should be used to connect the Brain Board for control of the power board.

Finally, there are connectors for external Start and On\|Off switches. You may connect any push-to-make latching switch for the On\|Off button, or a push-to-make button for the start button.


{{% notice note %}}
If you intend to use only the internal On|Off switch, you must connect a CamCon to the On|Off connector with a wire connecting one pin to the other pin on the same connector.
{{% /notice %}}

## Indicators

|   LED           | Meaning                         | Initial power-up state
|-----------------|---------------------------------|----------------------
| PWR\|FLAT       | Green when powered<br />Flashing red and green when the battery is low | Green
| 5V              | Green when 5V is being supplied | Green
| H0-1, L0-3      | Green when the output is on [^1]<br />Red when the output's current limit is reached | Off
| RUN\|ERROR      | Orange on power-up, or USB reset <br />Flashing green when ready to run<br /> Solid green when running or booting | Orange

[^1]: The outputs only turn on when your program runs (specifically, when the `Robot` object is created).

On power-up, the Power Board will emit some beeps, which are related to the version of the firmware it has installed.

If the Power Board starts beeping (and all the outputs turn off) then this means that the whole board's current limit has been triggered.

## Controls

| Control        | Use
|----------------|----------------------------
| ON\|OFF        | Turns the power board on, when used in conjunction with an external switch
| START          | Starts your program (can be used instead of the robot WiFi interface)

## Specification


|  Parameter                           |   Value   |
|--------------------------------------|-----------|
| Main battery fuse current            | 40A       |
| Overall current limit[^2]            | 30A       |
| High current outputs (H0-1)          | 20A       |
| Low current outputs (L0-3)           | 10A       |
| Motor rail output voltage (nominal)  | 11.1V ± 15% |
| Maximum output current per 5V channel| 1A        |

[^2]: If overall current limit is exceeded, the Power Board will turn off and start beeping.
