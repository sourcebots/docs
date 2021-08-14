---
title: Magnet Board API
weight: 8
---
 
The magnet board is only available on the [Crane robot](../../robots/crane).
 
The magnet of the crane will stick to any magnetic objects (especially containers).
 
## Getting the magnet's status
 
A magnet can be either energised or de-energised, you can turn the magnet on or off by setting `r.magnet.energised` like so:
```python
# Turn on the magnet
r.magnet.energised = True
# Turn off the magnet
r.magnet.energised = False
```

{{% notice warning %}}
Check the spelling of `energised`, it's in british english, `energized` will not work!
{{% /notice %}}

You can get the current state of the magnet by getting the value of `energized` like so:

```python
magnet_on = r.magnet.energised
```
