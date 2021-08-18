---
title: API
weight: 2
---

Programming your robot is done in [Python](https://www.python.org/),
specifically version 3.9.6. You can learn more about Python from their
[docs](https://docs.python.org/3/), and our whirlwind tour.

## Setup

The following two lines are required to complete initialisation of the
kit:

``` python
from sbot import *

r = Robot()
```

Once this has been done, this `Robot` object can be used to control the
robot's functions.

The remainder of the tutorials pages will assume your `Robot` object is
defined as `r`.

## Running your code

Your code needs to be put in the `zone-0` or `zone-1` folder in a file called
`forklift.py` or `crane.py` for the forklift and crane robots respectively.

{{% notice tip %}}
If this file is missing or incorrectly named, your robot won't do
anything. No log file will be created.
{{% /notice %}}

## Logs

A log file is saved in the `output/` folder so you can see what your robot did,
what it didn't do, and any errors it raised. Each log file is in a folder based on its
date and time, so you can look back at your previous runs.

## Included Libraries

Python already comes with plenty of [built-in
libraries](https://docs.python.org/3.9/py-modindex.html) to use. We
install some extra ones which may be of use:

- [numpy 1.19.3](https://pypi.org/project/numpy/1.19.3/)
- [matplotlib 3.3.3](https://pypi.org/project/matplotlib/3.3.3/)
- [pandas 1.1.4](https://pypi.org/project/pandas/1.1.4/)
- [scikit-learn 0.23.2](https://pypi.org/project/scikit-learn/0.23.2/)
- [scipy 1.5.4](https://pypi.org/project/scipy/1.5.4/)

{{% notice tip %}}
If you would like an extra library installed, go and ask a volunteer to
see if we can help.
{{% /notice %}}
