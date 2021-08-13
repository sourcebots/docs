---
title: Arduino API
weight: 5
---

The [Arduino](https://store.arduino.cc/arduino-uno-rev3) provides a
total of 18 pins for either digital input or output (labelled 2 to 13
and A0 to A5), including 6 for analogue input (labelled A0 to A5).

## Accessing the Arduino

The Arduino can be accessed using the `arduino` property of the `Robot`
object.

``` python
my_arduino = r.arduino
```

You can use the GPIO *(General Purpose Input/Output)* pins for anything,
from microswitches to LEDs. GPIO is only available on pins 2 to 13 and
A0 to A5 because pins 0 and 1 are reserved for communication with the
rest of our kit.

## Simulator

In the simulator, the Arduino's pins are pre-populated and pre-configured.
The first few digital pins are occupied by digital inputs, the next few by
digital outputs, and the analogue pins are attached to distance sensors.

To find out how many inputs and outputs each type of robot has, check the
[robot docs](TODO_change_when_this_page_is_added).

You won't be able to change pin mode or use the ultrasound sensors like in
a physical robot (see below), but pins 0 and 1 are still unavailable.

### Digital Inputs

Each robot has a number of digital inputs, starting from pin 2. If your
robot has 5 inputs, those would occupy pins 2-6.

These all have a digital state which you can read as a boolean.

```python
bumper_pressed = r.arduino.pins[5].digital_state
```

### Digital Outputs

The digital outputs start the pin after the last input. If your robot has 5
inputs and 3 outputs, the outputs would occupy pins 7-9.

You can set their state similarly to reading the inputs, and you can also
read the last value that was set.

```python
led_state = r.arduino.pins[8].digital_state
r.arduino.pins[8].digital_state = not led_state  # Toggle output
```

### Analogue Inputs

Any analogue input devices (e.g. distance sensors) are connected to the
Arduino's analogue input pins starting from pin `A0`. You can read their
values like this:

```python
distance = r.arduino.pins[AnaloguePin.A0].analogue_value
```

The value read is returned as a float.

### Distance Sensor

Distance sensors are connected to 1 analogue pin each and measure the
distance to the object ahead of them in metres. You read them like any
other analogue pin.

The value returned will be between 0 and 2 - anything further than 2
metres will be capped at 2.

## Pin Mode (Unavailable in Simulator)

GPIO pins have four different modes. A pin can only have one mode at a
time, and some pins aren't compatible with certain modes. These pin
modes are represented by an
[enum](https://docs.python.org/3/library/enum.html) which needs to be
imported before they can be used.

``` python
from sbot import GPIOPinMode
```

{{% notice tip %}}
The input modes closely resemble those of an Arduino. More information
on them can be found in [their
docs](https://www.arduino.cc/en/Tutorial/DigitalPins).
{{% /notice %}}

### Setting the pin mode

You will need to ensure that the pin is in the correct pin mode before
performing an action with that pin. You can read about the possible pin
modes below.

``` python
r.arduino.pins[3].mode = GPIOPinMode.DIGITAL_INPUT_PULLUP
```

### `GPIOPinMode.DIGITAL_INPUT`

In this mode, the digital state of the pin (whether it is high or low)
can be read.

``` python
r.arduino.pins[4].mode = GPIOPinMode.DIGITAL_INPUT

pin_value = r.arduino.pins[4].digital_state
```

### `GPIOPinMode.DIGITAL_INPUT_PULLUP`

Same as `GPIOPinMode.DIGITAL_INPUT`, but with an internal [pull-up
resistor](https://learn.sparkfun.com/tutorials/pull-up-resistors)
enabled.

``` python
r.arduino.pins[4].mode = GPIOPinMode.DIGITAL_INPUT_PULLUP

pin_value = r.arduino.pins[4].digital_state
```

### `GPIOPinMode.DIGITAL_OUTPUT`

In this mode, we can set binary values of `0V` or `5V` to the pin.

``` python
r.arduino.pins[4].mode = GPIOPinMode.DIGITAL_OUTPUT
r.arduino.pins[6].mode = GPIOPinMode.DIGITAL_OUTPUT

r.arduino.pins[4].digital_state = True
r.arduino.pins[6].digital_state = False
```

### `GPIOPinMode.ANALOGUE_INPUT`

Certain sensors output analogue signals rather than digital ones, and so
have to be read differently. The Arduino has six analogue inputs, which
are labelled `A0` to `A5`; however pins `A4` and `A5` are reserved and
cannot be used.

{{% notice tip %}}
Analogue signals can have any voltage, while digital signals can only
take on one of two voltages. You can read more about digital vs analogue
signals [here](https://learn.sparkfun.com/tutorials/analog-vs-digital).
{{% /notice %}}

``` python
from sbot import AnaloguePin

r.arduino.pins[AnaloguePin.A0].mode = GPIOPinMode.ANALOGUE_INPUT

pin_value = r.arduino.pins[AnaloguePin.A0].analogue_value
```

{{% notice tip %}}
The values are the voltages read on the pins, between 0 and 5.
{{% /notice %}}

{{% notice warning %}}
Pins `A4` and `A5` are reserved and cannot be used.
{{% /notice %}}

## Ultrasound Sensors (Unavailable in Simulator)

You can also measure distance using an ultrasound sensor from the
Arduino.

``` python
# Trigger pin: 4
# Echo pin: 5
u = r.arduino.ultrasound_sensors[4, 5]

time_taken = u.pulse()

distance_metres = u.distance()
```

{{% notice warning %}}
If the ultrasound signal never returns, the sensor will timeout and
return `None`.
{{% /notice %}}
