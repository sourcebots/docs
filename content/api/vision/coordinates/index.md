---
title: Coordinates
---

[Cartesian coordinates](https://en.wikipedia.org/wiki/Cartesian_coordinate_system) use three perpendicular axes (typically _x_, _y_ and _z_) to specify a point in space.
Spherical coordinates use a pair of angles and a distance from the observer to specify a point in space.

{{% notice note %}}
All distances are measured in metres.
{{% /notice %}}

## Cartesian Coordinates
The Cartesian position is represented as 3 coordinates, `x`, `y` and `z`. These coordinates are relative to the view of the webcam.

- `x` - the x coordinate, positive in the right direction.
- `y` - the y coordinate, positive in the up direction.
- `z` - the z coordinate, the distance forwards in front of the camera.

For example, if `x`, `y` and `z` were `0`, `0` and `1` respectively, the marker would be one metre directly in front of the camera.

{{% notice warning %}}
`z` is not the same as the [spherical](#spherical-coordinates) `distance_metres`. For example, if `x`, `y` and `z` were `1`, `0` and `1` respectively, the marker would be one metre in front, and one metre to the right of the camera, and so would be `1.412` metres from the camera.
{{% /notice %}}

## Spherical Coordinates
The spherical coordinates returned by our API differ slightly from traditional
spherical coordinates as it is expected that the majority of markers will be at
approximately the same level as the camera.

 - `distance_metres` - the distance from the camera to the marker.
 - `rot_x_radians` / `rot_x_degrees` - the angle of rotation in radians/degrees
   about the Cartesian x axis.
   \
   An angle of 0 indicates that the marker is directly in front of the camera, a
   positive angle indicates that the marker is in the upper part of the camera's
   view.
 - `rot_y_radians` / `rot_y_degrees` - the angle of rotation in radians/degrees
   about the Cartesian y axis.
   \
   An angle of 0 indicates that the marker is directly in front of the camera, a
   positive angle indicates that the marker is to the right of the camera's
   view.

For example, if `distance_metres` was `1`, `rot_x_degrees` was `0`, and
`rot_y_degrees` was `45`, the marker would be 45 degrees to the right of the
robot, exactly 1 metre away.

## Diagram

The following diagram shows the orientation of the Cartesian axes relative to
the camera as well as the angles which describe the spherical coordinate space.

![A diagram showing the coordinate spaces]({{% page_resource_link "coordinate-spaces.svg" %}})
