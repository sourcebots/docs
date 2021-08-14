---
title: Radio API
weight: 6
---

Radio transmitters and receivers are attached to various items in the arena.
Each transmitter encodes their identity, which means that receivers can identify these objects.

Using the signal strength and bearing of the received radio signals, you're able to
determine the distance and direction of a transmitter relative to the radio in 2D.

Our library provides this through a `radio` attached to your `Robot`,
which has a `sweep` function that detects transmitters that are in range:

``` python
# Get all transmitters that are in range.
transmitters = r.radio.sweep()
```

When called, the `sweep()` function uses the radio receiver to scan for all transmitters in range.
It returns a list of `Target` objects, each of which describes one of the transmitters that were found within range.
A detailed description of the attributes of `Target` objects is provided at the bottom of this page.

Here's an example that will repeatedly print out the information, bearing, and signal strength of each transmitter in range:

``` python
# Continuously prints details of nearby transmitters.
while True:
    transmitters = r.radio.sweep()
    print("I found", len(transmitters), "transmitter(s):")

    for tx in transmitters:
        print("Transmitter ID:", tx.target_info.id)
        print("  Type:", tx.target_info.type)
        print("  Owner:", tx.target_info.owner)
        print("  Bearing:", tx.bearing)
        print("  Signal Strength:", tx.signal_strength)
```

## Detecting beacons

There are 4 beacons in the arena, see [the rules](/rules/) for their locations. These beacons continually transmit their identity. Beacons can be detected up to 2.5m away.

The beacons have the `target_info.type` value of `0` (`TargetType.BEACON`), which can be used to detect if it is a beacon. See '[Objects of the Radio System](#objects-of-the-radio-system)' below for all available information.

## Detecting containers

There are many containers in the arena, which are each owned by a specific team. Containers can be detected up to 2.5m away.

The beacons have the `target_info.type` value of `1` (`TargetType.CONTAINER`), which can be used to detect if it is a container. See '[Objects of the Radio System](#objects-of-the-radio-system)' below for all available information.


## Objects of the Radio System

### Target

A `Target` object contains information about a _detected_ transmitter.
It has the following attributes:

`target_info`
: A [`TargetInfo`](#targetinfo) object containing information about the transmitter that was detected.

`signal_strength`
: The measured strength of the signal as a float.

`bearing`
: The angle to the `Target` in radians as a float.
  A bearing of `0` is in front of the robot. Positive bearings are to the robot's right.

### TargetInfo

The `TargetInfo` object contains information about a transmitter.
It has the following attributes:

`id`
: The ID of the transmitter, either 1-16 for containers, or 100-103 for beacons. See [the rules](/rules/) for the arena layout.

`type`
: The type of the transmitter, either `0` (`TargetType.BEACON`) for a beacon, or `1` (`TargetType.CONTAINER`) for a container.

`owner`
: The zone id of the robot that currently owns the stations territory. This can be `0` (`Owner.ZONE_0`), `1` (`Owner.ZONE_1`), or `-1` (`Owner.NULL`). which indicates it does not have an owner (i.e. it's a beacon). Remember, you can find out which zone your robot is in using [r.zone](/api/game-state)