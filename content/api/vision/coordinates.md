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

{{% added_in update="2018-jan" feature="spherical coordinates" %}}

### Diagram

The following diagram shows the orientation of the Cartesian axes relative to
the camera as well as the angles which describe the spherical coordinate space.

![A diagram showing the coordinate spaces](/img/api/coordinate-spaces.svg)

## Orientation Coordinates

Orientation represents the rotation of a marker around the x, y, and z axes.
Rotations are applied in order of Z, Y, X.

The following table visually explains what positive and negative rotations represent.
|  |  |
|:-:|:-:|
| <img src="/img/api/coordinate-orientations/m45x0y0z.png?width=200px" style="margin:0"/> `rot_x_degrees = 45` | <img src="/img/api/coordinate-orientations/m-45x0y0z.png?width=200px" style="margin:0"/>  `rot_x_degrees = -45` |
| <img src="/img/api/coordinate-orientations/m0x45y0z.png?width=200px" style="margin:0"/> `rot_y_degrees = 45` |  <img src="/img/api/coordinate-orientations/m0x-45y0z.png?width=200px" style="margin:0"/> `rot_y_degrees = -45` |
| <img src="/img/api/coordinate-orientations/m0x0y45z.png?width=200px" style="margin:0"/> `rot_z_degrees = 45` |  <img src="/img/api/coordinate-orientations/m0x0y-45z.png?width=200px" style="margin:0"/>  `rot_z_degrees= -45` |
|  <img src="/img/api/coordinate-orientations/m0x0y0z.png?width=200px" style="margin:0"/> `0` in all axes  |
