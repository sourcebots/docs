---
title: Connecting your kit
---

## Essential Hardware
- Raspberry Pi (the board in a plastic case with many USB ports)
- Power Board (the board in a plastic case with many green sockets and two buttons)
- Motor Board (the other board in a plastic case)
- Arduino (The blue, exposed board with a metal USB-B connector)
- Arduino Servo Shield (another blue board, hopefully on top of the first)
- Battery
- USB Hub
- USB Webcam

## Connectors and Cables
- 1 x 3.81mm Camcon (for the Arduino Servo Shield)
- 2 x 5mm Camcon (for the Motors)
- 1 x 5mm Camcon with wire loop (attached to the power board)
- 2 x 7.5mm Camcon (for the Motor Board)
- 2 x USB-A to micro-usb cables
- USB-A to USB-B cable (for the Arduino)
- Camcon to micro-usb cable (for the Raspberry Pi)
- Wire

## Tools you'll need (Not Supplied)
- Pliers
- Wire Cutters
- Wire Strippers
- Screwdriver (2mm)
- 2 x Motor

Obtain any other needed tools/supplies yourself 

{{% notice info %}}
_Camcons_ are the [green connectors](../kit-assembly.files/camcons.png) used to supply power to our kits.
{{% /notice %}}

## Important notes before you start
{{% notice warning %}}
Make sure to read all these **before** you start assembly
{{% /notice %}}

- Do not disassemble/reassemble your kit without first switching it off and unplugging the battery and check it thoroughly before plugging it in and switching it on again (don’t be afraid to ask someone to check your kit before you do so). If something is connected up wrongly when the kit is powered up, it may damage the components.

- When wiring Camcons (or anything at all, but Camcons in particular), always double-check that the correct connections are made at either end (positive to positive, ground to ground, etc.) before plugging in the cable or plugging in the battery or switching things on. In particular the connections from the Power Board and the Arduino Servo Shield and Raspberry Pi, because these boards are particularly fragile. Don’t be afraid to ask someone to check your connections, please ask before powering up your kit for the first time, and DO NOT disassemble the cable provided for powering the Raspberry Pi or attempt to power it another way as this may kill it.

- Colour coding is key; try to make sure that you use RED for wires connected to a powered rail (say 12V or 5V), BLACK for wires connected to ground (0V rail) and BLUE for motors, although it is permissible to use other colours in this case if they were already soldered onto the motors provided in the kits.

## How it call fits together

{{% attachments title="Related files" /%}}

1. Connect the Raspberry Pi to the Power Board using the Camcon to micro-usb cable; the small camcon end goes into one of the 5V rail sockets on the Power Board, the micro-usb end into the power input of the Raspberry Pi. (Once again, do not dismantle or rearrange this cable!).
2. Connect the USB hub to the Pi by plugging it into any one of its four USB sockets.
3. Connect the Power Board to the Pi via one of the black micro-usb cables; the standard USB end goes into any USB socket on the Pi or connected USB hub, the micro-usb end into the Power Board.
4. Connect the Motor Board to the Power Board by screwing the two large (7.5mm) camcons provided onto the opposite ends of a pair of wires, ensuring that positive connects to positive and ground to ground, and then plugging one end into the appropriate socket of the Motor Board (the connections labelled M0 or M1) and the other into a high power socket on the side of the Power Board ().
5. Connect the Motor Board to the Pi by way of the other black micro-usb cable; the standard USB end goes into any USB socket on the Pi or connected USB hub, the micro-usb end goes into the Motor Board.
6. The Arduino Servo Shield should already be connected into the top of the Arduino, but, if not, the pins on the bottom fit directly into the sockets with the same labels on the top of the Arduino.
7. Connect the Arduino to the Pi by way of the beige USB-A to USB-B cable; the square-ish USB-B end goes into the appropriate metal-cased connector on the Arduino, the standard USB end goes into any free USB port on the Pi or connected USB hub. This will provide both power and communication to the Arduino.
8. Connect the Arduino Servo Shield to the Power Board by screwing the green connector on the top and the small (3.81mm) camcon provided onto the opposite ends of a pair of wires and plugging the camcon into the second of the 5V power rail sockets on the Power Board.
9. Connect the USB Webcam to the Pi via any one of the remaining USB sockets on the Pi or connected USB hub.
10. To connect the motors, first screw wires connected to their pins into one of the medium-sized (5mm) camcons and plug these into either of the two appropriate sockets on a Motor Board.
11. At this point, check that everything is connected up correctly (it may be helpful to ask someone around you to check that all cables are connected properly).
12. Connect the Power Board to one of the blue LiPo batteries by plugging the yellow connector on the cable connected to the Power Board into its counterpart on the battery. 
13. If there is not one plugged in already, a loop of wire should be connected to the socket beneath the On/Off button. Check that the Power Board works by pressing the On/Off button and checking that the LEDs on the board come on green. Ensure that the kit is switched off again and the battery unplugged before continuing assembly.

