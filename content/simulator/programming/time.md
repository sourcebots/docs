---
title: Time
---

In the simulated environment, time advances only at the pace that the simulator is run and in cooperation with the controller code (such as the code controlling your robot). As a result, using `time.time` to know how long your robot has been running for or `time.sleep` to wait for some duration will have unpredictable results, especially when run on a computer other than the one you are developing on (such as during the competition).

Instead your code should explicitly signal to the simulator when it is ready for time to advance and should query for the current time from the simulator. This can be done by using the methods detailed below.

{{% notice tip %}}
If you find that the simulator freezes then this indicates that your code is busy doing something without giving the simulator a chance to run. This usually indicates that you have a loop somewhere which is expecting time to advance on its own and which should be modified to call `R.sleep` occasionally (even a very small value will allow the simulator to progress).
{{% /notice %}}

## Sleeping

If you want to wait for something to happen within the simulation, and you can be reasonably confident that it will take a given amount of time, you can use sleep method on your robot to pause your code for a given duration.

Internally this uses the simulation’s own clock and so is suitable for use in place of `time.sleep`. Note that, just as with `time.sleep`, while your code is sleeping your robot will continue any actions it was doing.

```python
# Blink the output
R.ruggeduinos[0].digital_write(A_PIN, 1)
R.sleep(1.5)  # Sleep for a second and a half of simulation time
R.ruggeduinos[0].digital_write(A_PIN, 0)
```

## Getting the current time

If you need to measure the time since some previous moment within the simulator, your robot has a time method which can be used in place of `time.time` to get a number (in seconds) that increases in line with simulation time.

Time zero as returned by this method is the point at which the simulation began, however you should not rely on that being a useful reference point as it may not be the moment at which the match began.

```python
then = R.time()

# .. do some other things ..

now = R.time()

duration = now - then
```
