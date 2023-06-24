---
title: Magnet API
weight: 8
---

The magnet is only available on the [Crane robot](/robots/crane).

The magnet of the crane will only stick to containers.

## Getting the magnet's status

A magnet can be either energised or de-energised, you can turn the magnet on or off by setting `r.magnet.energised` like so:
```python
# Turn on the magnet
r.magnet.energised = True
# Turn off the magnet
r.magnet.energised = False
```

{{% notice warning %}}
Check the spelling of `energised`, it's in British English, `energized` will not work!
{{% /notice %}}

You can get the current state of the magnet by getting the value of `energized` like so:

```python
magnet_on = r.magnet.energised
```

## Checking if a container is nearby

The magnet can tell you if there is an object in range to be picked up. You can check if any object is in range by accessing the `nearby` method:
```python
# Is there a container nearby?
is_nearby = r.magnet.nearby() # True or False
```
