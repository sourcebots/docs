# Robot API Reference

[Usage Tutorial](index)

---
### robot.PinMode
Holds constant values to represent the mode of a pin
- **Values**
  - `INPUT`: Make the pin be an input.
  - `INPUT_PULLUP`: Make the pin be an input, with a pullup resistor.
  - `OUTPUT_HIGH`: Set the pin to output high.
  - `OUTPUT_LOW`: Set the pin to output low.

---
### robot.PinValue
Holds constant the values of a pin
- **Values**
  - `HIGH`: The pin is receiving a high current
  - `LOW`: The pin is receiving a low current

---
### robot.Gpio
Class that represents GPIO (_General Purpose Input Output_) pins on the servo board
- **Properties**
  - `mode`: Set the [`PinMode`](#robotpinmode) of the pin.
- **Methods**
  - `read()`: Read the [`PinValue`](#robotpinvalue) of the pin.

---
### robot.Motor
Class that represents a motor.
- **Properties**
  - `voltage` : the normalised voltage of the motor. Should range between -1 and 1, and can be set to `robot.BRAKE` and `robot.COAST` if needed.

---
### robot.MotorBoard
Class that represents a motor board.
- **Properties**
  - `m0`: The [motor](#robotmotor) connected to m0 on the motor board.
  - `m1`: The [motor](#robotmotor) connected to m1 on the motor board
  - `serial`: the board's serial number as a string.

---
###  robot.PowerBoard
Class that represents a power board.
- **Methods**
  - `power_on()`: turns the power on to the connected boards.
  - `power_off()`: turns the power off to connected boards.


- **Properties**
  - `serial`: the board's serial number as a string.

---
###  robot.Robot
Class that represents the robot as a whole
- **Properties**
  - `zone`: the zone number the robot has started in (0-3).
  - `mode`: either GameMode.COMPETITION or GameMode.DEVELOPMENT (it's an enum), depending on if the robot is in competition mode or development mode (can be switched to competition mode by putting a special USB stick in the robot).
  - `motor_boards`: a dictionary of connected [Motor Boards](#robotmotorboard), using their serial numbers as keys.
  - `motor_board`: the first indexed [Motor Board](#robotmotorboard).
  - `power_boards`: a dictionary of connected [Power Boards](#robotpowerboard), using their serial numbers as keys.
  - `power_board`: the first indexed [Power Board](#robotpowerboard).
  - `servo_boards`: a dictionary of connected [Servo Board](#robotservoboard), using their serial numbers as keys.
  - `servo_board`: the first indexed [Servo Board](#robotservoboard).

---
###  robot.Servo
Class that represents a servo.
- **Methods**
  - `read_analogue()`: Get a list of all the values of the analogue pins, indexed by pin number.
  - `read_ultrasound(trigger_pin, echo_pin)`: Get the distance reported on your ultrasound sensor, with the read and write pins connected to `echo_pin` and `trigger_pin` respectively.

- **Properties**
  - `position`: the position of the servo. Should range between -1 and 1.

---
###  robot.ServoBoard
Class representing a servo board.
- **Properties**
  - `servos`: returns a list of up to sixteen [servos](#robotservo), indexed by port number.
  - `serial`: Serial number for the board as a string.
  - `gpio`: returns a list of [GPIO](#robotgpio) pins, indexed by pin number

---
### Data Values
Constant data values found inside the robot library. For example `from robot import BRAKE`.
- `BRAKE`: used by [motors](#robotmotor) to tell it to break.
- `COAST`: used by [motors](#robotmotor) to tell it to coast.
