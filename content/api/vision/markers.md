---
title: Markers
---

## Marker properties
The markers that are contained within the array have some useful properties:

  - `is_wall_marker()` - returns whether or not the marker is a wall marker.
  - `is_token_marker()` - returns whether or not the marker is a token marker.
  - `id` - returns the id of the marker.
  - `pixel_centre` - returns the pixel coordinates of the centre of the marker.
  - `polar` - returns a `PolarCoord` object containing the position of the marker in the Polar coordinate system.
  - `cartesian` - returns a `CartCoord` object containing the position of the marker in the Cartesian coordinate system.

## Cartesian and Polar Coordinate Systems
The markers' position can be represented using both the Polar and Cartesian coordinate system. The two objects `CartCoord` and `PolarCoord` hold the position information for both of these systems.

{{% notice info %}}
[Cartesian coordinates](https://en.wikipedia.org/wiki/Cartesian_coordinate_system) are ones that are defined using a unique set of values (typically x, y and z) to specify a point in space. [Polar coordinates](https://en.wikipedia.org/wiki/Polar_coordinate_system) are represented by a distance from a set point and an angle from a set direction.
{{% /notice %}}

{{% notice note %}}
All distances in this section are measured in meters.
{{% /notice %}}

The `CartCoord` object has the following properties, where each coordinate is in Cartesian space:

  - `x` - returns the x coordinate, defined as being positive in the right direction.
  - `y` - returns the y coordinate, defined as being positive in the up direction.
  - `z` - returns the z coordinate, defined as the distance from the camera to the marker.

{{% notice info %}}
For example, if x, y and z were 0, 0 and 1 respectively. This would correspond to a marker being exactly 1 metre in front of the camera, looking at the centre.
{{% /notice %}}
  
The `PolarCoord` object has the following properties:

 - `distance_meters` - returns the distance from the camera to the marker.
 - `rot_x_rad` and `rot_x_deg` - returns the angle of rotation in radians/degrees about the x axis. The x axis runs horizontally in front of the camera. A positive angle would be one where the marker is leaning toward the camera.
 - `rot_y_rad` and `rot_y_deg` - returns the angle of rotation in radians/degrees about the y axis. The y axis runs vertically in front of the camera. A positive angle would be one where the marker is rotated clockwise about the y axis looking from the top of the marker.
