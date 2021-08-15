---
title: Physical robot
---

The physical robot is closely modelled after the [forklift](../forklift) robot, however is different in a few important ways. The physical robot has two [radial motors](/api/motor-board), allowing it to move itself around the arena.

## Motor layout

The layout of the motors attached to the motor boards for the forklift robot are as follows:

- Motor Board 0:
    - Motor 0 - Left wheel motor
    - Motor 1 - Right wheel motor

## Servos

The front grabber is actuated by a single servo, attached to the [Arduino](/api/arduino/#servos). It is plugged in to port 0.

## Ultrasound

The forklift has many [ultrasound sensors](/api/ultrasound) attached to various points in the robot, here is the layout of the ultrasound sensors:

-
