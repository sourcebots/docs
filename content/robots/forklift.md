---
title: Forklift Robot
weight: 1
---

![Forklift robot](/img/robots/forklift-isolated.png)

The forklift has two [radial motors](/api/motor-board), allowing it to move itself around the arena. It also has 2 grabber motors, wired so they move together. Each motor has an [encoder (position sensor)](/api/encoder) that can tell you either the position of the motor along its track, or its angle relative to the start.

The forklift robot also has multiple Ultrasound sensors, a touch sensor, and a radio, see below for details.

## Motor layout

The layout of the motors attached to the motor boards for the forklift robot are as follows:

- Motor Board 0:
    - Motor 0 - Left wheel motor
    - Motor 1 - Right wheel motor
- Motor Board 1:
    - Motor 0 - Grabber motor (Both arms)

## Encoder layout

The layout of the Encoders are as follows:

- Slot 0: Left wheel rotary encoder
- Slot 1: Right wheel rotary encoder
- Slot 2: Left grabber linear encoder
- Slot 3: Right grabber linear encoder

{{% notice note %}}
Hint: the radius of a forklift wheel is 5cm.
{{% /notice %}}

## Touch sensor

In addition to other sensors, the forklift also has a [microswitch touch sensor](/api/touch) at the rear. This is used to detect if the forklift's rear is touching another object (a container, another robot, or a wall). The touch sensor is connected to pin `2` of the Arduino.

## Ultrasound (Distance) Sensor

The forklift has many [ultrasound sensors](/api/ultrasound) attached to various points in the robot, here is the layout of the ultrasound sensors:

- `AnaloguePin.A0`: Front Left
- `AnaloguePin.A1`: Front Right
- `AnaloguePin.A2`: Left
- `AnaloguePin.A3`: Right
- `AnaloguePin.A4`: Front
- `AnaloguePin.A5`: Back

## Radio

The forklift robot has a [radio](/api/radio) receiver attached to its centre.
