---
title: Simulator
weight: 3
---

{{% notice note %}}
Should you wish to run the simulator locally, this is fine, however will drastically limit your ability to collaborate with the rest of your team.
{{% /notice %}}

## Running simulations

To ease the load on your computers, the Webots simulator will be run by us, which you can interact with through our runner interface. The runner allows you to run simulations, and view the logs and recordings afterwards.

To run a simulation, click the "Run Simulation" button. The button will prevent you from running additional simulations whilst a simulation is running. Once the simulation has finished, the button will return to "Run Simulation", and an entry will be shown below it with a link to the logs and animation for your simulation run. Note that this always uses the files.

## Directory structure

In VSCode, you will see a directory structure which looks similar to this:

``` plain
.
├── competition-simulator
│   ├── controllers
│   │   ├── example_controller
│   │   └── sr_controller
│   ├── ...
│   └── worlds
├── output
│   └── 2021-08-07T19_20_46.108422
│       ├── 2021-08-07T18_31_56.html
│       ├── 2021-08-07T18_31_56.json
│       ├── 2021-08-07T18_31_56.x3d
│       └── logs.txt
└── zone-0
    ├── crane.py
    └── forklift.py
```
