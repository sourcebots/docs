---
title: Coordinates
---

[Polar coordinates](https://en.wikipedia.org/wiki/Polar_coordinate_system) represent a distance from a set point and an angle from a set direction. [Cartesian coordinates](https://en.wikipedia.org/wiki/Cartesian_coordinate_system) use three perpendicular axes (typically _x_, _y_ and _z_) to specify a point in space.

{{% notice note %}}
All distances are measured in metres.
{{% /notice %}}

## Polar Coordinates
The polar coordinates of a marker are relative to the view of the camera.

 - `distance_metres` - the distance from the camera to the marker.
 - `rot_x_rad` / `rot_x_deg` - the angle of rotation in radians/degrees about the x axis. The x axis runs horizontally in front of the camera. A positive angle would be one where the marker is in front of the camera.
 - `rot_y_rad` / `rot_y_deg` - the angle of rotation in radians/degrees about the y axis. The y axis runs vertically in front of the camera. A positive angle would be one where the marker is rotated clockwise about the y axis looking from the top of the marker.
 
{{% notice info %}}
For example, if `distance_metres` was `1`, `rot_x_deg` was `0`, and `rot_y_deg` was `45`, the marker would be 45 degrees to the right of the robot, exactly 1 metre away.
{{% /notice %}}


## Cartesian Coordinates
The Cartesian position is represented as 3 coordinates, `x`, `y` and `z`. These coordinates are relative to the view of the webcam.  

- `x` - the x coordinate, positive in the right direction.
- `y` - the y coordinate, positive in the up direction.
- `z` - the z coordinate, the distance forwards in front of the camera.

For example, if `x`, `y` and `z` were `0`, `0` and `1` respectively, the marker would be one metre directly in front of the camera.

{{% notice warning %}}
`z` is not the same as the [polar](#polar-coordinates) `distance_metres`. For example, if `x`, `y` and `z` were `1`, `0` and `1` respectively, the marker would be one metre in front, and one metre to the right of the camera, and so would be `1.412` metres from the camera.
{{% /notice %}}
