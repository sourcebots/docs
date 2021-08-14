---
title: Crane Robot
weight: 2
---

The crane has three [linear motor](../../api/motor-board), allowing it to move its [electromagnet](../../api/magnet-board) in 3 dimensions. Each motor has an [encoder (position sensor)](../../api/encoder) that can tell you the position of the motor along its track.

Additionally, the crane has one ultrasound distance sensor and a radio, both attached to the hook (see below).

## Motor layout

The layout of the [motors](../../api/motor-board) attached to the motor boards are as follows:

- Motor Board 0:
    - Motor 0 - Bridge motor
    - Motor 1 - Trolley motor
- Motor Board 1:
    - Motor 0 - Hoist motor

## Encoder layout

The layout of the [encoders](../../api/encoder) are as follows:

- Slot 0: Bridge linear encoder
- Slot 1: Trolley linear encoder
- Slot 2: Hoist linear encoder

## Ultrasound sensor

The crane has one [ultrasound sensor](../../api/ultrasound) pointing downwards from the magnet. The ultrasound sensor is attached to Arduino pin 0.

## Radio

The crane robot has a [radio](../../api/radio) receiver attached to the hook, which can be used to measure the position of the container relative to the hook in a 2D plane.