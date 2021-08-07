---
title: Tutorials
weight: 1
---

This part of the docs contains some practical guides for getting starting with both Python and the simulator.

* [Basic Movement](basic-movement) - explains how to use the kit to operate a motor
* [Python: A Whirlwind Tour](python-whirlwind-tour) - a guide to using Python, aimed towards those who haven't used it before
* [A basic guide to using the simulator](simulator) - a guide to using the we-bot simulator

## Installation

### Prerequisites

You need to download and install Webots (the download is around 1.5GB). This is the platform we run our simulation in. Whilst we recommend version “R2021a” of Webots, and will be running competition simulations using it, “R2020b-rev1” should still work.

## Python Version

You will also need Python installed.

| Platform | Supported Python Version|
| -------- | ----------------------- |
| Windows | 3.9 (64 bit) |
| macOS | 3.9 |
| Linux | 3.9 |

In the competition, python 3.9 will be used.
There are a small number of [extenal libraries](https://github.com/sourcebots/docs/blob/sp2021/content/api/_index.md#included-libraries) which will be available to your robot code during the competition. For local development you will need to install these yourself.

{{% notice warning %}} If you are installing python on Windows, you will need to add python to PATH otherwise webots will not be able to find the python installation {{% /notice %}}

## Installing the simulation

 1.   Download the simulation, and unzip it somewhere on your computer.
 2.   Using the Webots IDE, open the worlds/Arena.wbt file.

You may receive a warning about your computer’s GPU not being good enough, which can be ignored

## Changing your version of Python

If webots is picking up the incorrect version of Python, you’ll need to change it. This can be done using Tools > Preferences > General > Python command. You’ll need to ensure a matching version of Python is installed.

