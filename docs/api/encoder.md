---
title: Motor Encoder API
---

Most moving parts of the robot have encoders attached. There are two kinds of encoders, linear encoders and rotary encoders. You can tell which is which by the joint it is attached to; if the joint rotates it is a Rotary encoder, whilst if it slides, it is a linear encoder.

## Linear Encoders

Linear encoders are attached to joints that move in a straight line (i.e. raising/lowering the forklift).

Linear encoders measure the distance the joint has moved from its start position, in *metres*.

All encoders are stored in a list called `encoders`, you can access the encoder with `encoders[i]`, where `i` is the slot the encoder is plugged into. You can find this number in the [documentation for the robot]().

```python
# Get the distance from the start position
distance_from_start = r.encoders[1].displacement # in Metres
```

## Rotary Encoders

Rotary encoders are attached to joints that rotate (i.e. wheel rotations).

Rotary encoders measure the total rotation the joint has moved from its start position, in *radians*.

All encoders are stored in a list called `encoders`, you can access the encoder with `encoders[i]`, where `i` is the slot the encoder is plugged into. You can find this number in the [documentation for the robot]().

```python
# Get the total rotation from the start position
rotation_from_start = r.encoders[1].rotation # in Radians
```
