### robot.Camera

Class that represents a camera
 - **Methods**
  - see( ): returns a list of [markers](#robot.Marker) currently visible to the camera.


 - **Properties**
  - serial: the camera's serial number.

---

### robot.CartCoord
Class that represents a set of cartesian coordinates
 - **Properties**
  - x: x-axis cartesian coordinate.
  - y: y-axis cartesian coordinate.
  - z: z-axis cartesian coordinate.

---

### robot.Marker
Class that represents a marker
 - **Methods**
    - is_token_marker( ): returns true if the marker is a token, false if otherwise.
    - is_wall_marker( ): returns true if the marker is a wall, false if otherwise.


 - **Properties**
  - cartesian: a [CartCoord](reference#robot.CartCoord) object representing the cartesian coordinates of the marker relative to the robot.
  - distance_meters: the distance to the marker in meters.
  - id: the id number of the marker.
  - pixel_centre: pixel coordinates of the centre of the marker.
  - pixel_corners: pixel coordinates of the corners of the maker.
  - polar: a [PolarCoord](reference#robot.PolarCoord) object representing the polar coordinates of the marker relative to the robot.
  - size: size of the marker in meters.

---

### robot.Motor
Class that represents a motor
 - **Properties**
   - voltage : the normalised voltage of the motor.

---   

### robot.MotorBoard
Class that represents a motor board
 - **Properties**
  - m0: The [motor](reference#robot.Motor) connected to m0 on the motor board.
  - m1: The [motor](reference#robot.Motor) connected to m1 on the motor board
  - serial: the board's serial number.

---

###  robot.PolarCoord
Class that represents a set of polar coordinates
 - **Properties**
  - distance_meters: distance to the point in meters.
  - rot\_x_deg: rotation on the x axis in degrees.
  - rot\_y_deg: rotation on the y axis in degrees.
  - rot\_z_deg: rotation on the z axis in degrees.
  - rot\_x_rad: rotation on the x axis in radians.
  - rot\_y_rad: rotation on the y axis in radians.
  - rot\_z_rad: rotation on the z axis in radians.

---

###  robot.PowerBoard
Class that represents a power board
 - **Methods**
  - power_on( ): turns the power on to the connected boards.
  - power_off( ): turns the power off to connected boards.


 - **Properties**
  - serial: the board's serial number.

---

###  robot.Robot
Class that represents the robot as a whole
 - **Properties**
  - cameras: a dictionairy of connected [Camera](reference#robot.Camera) objects, using their serial numbers as keys.
---

###  robot.Servo
###  robot.ServoBoard
