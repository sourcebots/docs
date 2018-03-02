---
title: Orientation
---

Orientation represents the rotation of a marker around the x, y, and z axes.
These can be accessed as follows:

- `rot_x_radians` / `rot_x_degrees` - the angle of rotation in radians/degrees
   counter-clockwise about the Cartesian x axis.
- `rot_y_radians` / `rot_y_degrees` - the angle of rotation in radians/degrees
   counter-clockwise about the Cartesian y axis.
- `rot_z_radians` / `rot_z_degrees` - the angle of rotation in radians/degrees
   counter-clockwise about the Cartesian z axis. (tip: in our use case the z
   axis always faces the camera, and thus will appear as a clockwise rotation)

Rotations are applied in order of z, y, x.

The following table visually explains what positive and negative
rotations represent.

|  |  |
|:-:|:-:|
| <img src="/img/api/coordinate-orientations/m45x0y0z.png?width=200px" style="margin:0"/> `rot_x_degrees = 45` | <img src="/img/api/coordinate-orientations/m-45x0y0z.png?width=200px" style="margin:0"/>  `rot_x_degrees = -45` |
| <img src="/img/api/coordinate-orientations/m0x45y0z.png?width=200px" style="margin:0"/> `rot_y_degrees = 45` |  <img src="/img/api/coordinate-orientations/m0x-45y0z.png?width=200px" style="margin:0"/> `rot_y_degrees = -45` |
| <img src="/img/api/coordinate-orientations/m0x0y45z.png?width=200px" style="margin:0"/> `rot_z_degrees = 45` |  <img src="/img/api/coordinate-orientations/m0x0y-45z.png?width=200px" style="margin:0"/>  `rot_z_degrees= -45` |
|  <img src="/img/api/coordinate-orientations/m0x0y0z.png?width=200px" style="margin:0"/> `0` in all axes  |
