---
title: Programming
---

On first run, the robot will execute an example program for convenience. On first run, this will be copied into `zone-0` in the same directory that `competition-simulator-<version>` is stored in:

```plain
.
├── competition-simulator-<version>
│   ├── ...
│   └── worlds
│       └── Arena.wbt
├── zone-0
│   ├── crane.py
│   └── forklift.py
└── zone-1
```

Your code for the forklift robot should go in `forklift.py` and the crane in `crane.py`.

{{% notice warning %}}
Only your controller code will be present in the competition environment.
{{% /notice %}}

### Time

In the simulated environment, time advances only at the pace that the simulator
is run. As a result, using `time.time` to know how long your robot has been
running for or `time.sleep` to wait for some duration will be unreliable.

As a result the API present in the simulator supports a slightly different
approach to handling time. See the documentation about [simulated time](./time)
for more details.

## Other robots

There is another robot in the arena; its starting zone is zone 1. By default, this robot will not move.

To control the zone 1 robot, you will need to provide its code:

Create the robot code in `zone-1/forklift.py` and `zone-1/crane.py`. Your original code in `zone-0/` will still be used to control zone 0 robots. Robots which do not have any robot code in their `zone-x` directory will not do anything.

``` plain
.
├── competition-simulator
│   ├── controllers
│   │   ├── example_controller
│   │   └── sr_controller
│   ├── ...
│   └── worlds
├── zone-0
│   └── crane.py
└── zone-1
    └── crane.py
```
