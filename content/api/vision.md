---
title: Vision
---

The main way your robot will see markers is through the webcam.

{{% notice info %}}
Throughout this page it is assumed you have a `Robot` object defined as `r`
{{% /notice %}}

## Using the camera to search for markers
If you have a webcam connected, you can use `r.camera.see()` to take a picture. 

If you consider it necessary you can assign the camera object to a variable just like `Robot`:

```python
camera = r.camera
```
The software will process the image and return any markers it sees into an array sorted by distance.

```python
markers = r.camera.see()
```

You can then iterate over the `markers` array just as you would any other list:
```python
for marker in markers:
  # Do robot stuff
```

## Marker properties
The markers that are contained within the array have some useful properties:

  - `is_wall_marker()` - returns whether or not the marker is a wall marker.
  - `is_token_marker()` - returns whether or not the marker is a token marker.
  - `id()` - returns the id of the marker
  - `pixel_centre()` - returns a [tuple](https://www.tutorialspoint.com/python/python_tuples.htm) containing the pixel coordinates of the centre of the marker.
  - `polar()` - returns a PolarCoord object containing the position of the marker in the Polar coordinate system.
  - `cartersian()` - returns a CartCoord object containing the position of the marker in the Cartesian coordinate system.

## Cartesian and Polar Coordinate Systems
The markers' position can be represented using both the Polar and Cartesian coordiate system. The two objects `CartCoord` and `PolarCoord` hold the position information for both of these systems.

{{% notice info %}}
[Cartesian coordinates](https://en.wikipedia.org/wiki/Cartesian_coordinate_system) are ones that are defined using a unique set of values (typically x, y and z) to specify a point in space. [Polar coordinates](https://en.wikipedia.org/wiki/Polar_coordinate_system) are represented by a distance from a set point and an angle from a set direction.
{{% /notice %}}

The `CartCoord` object has the following properties:

  - `x()` - returns the x coordinate of the marker in Cartesian space, x is defined as being positive in the right direction.
  - `y()` - returns the y coordinate of the marker in Cartesian space, y is defined as being positive in the up direction.
  - `z()` - returns the z coordinate of the marker in Cartesian space, it is defined as the distance from the camera to the marker in **meters**
  
{{% notice info %}}
(0,0,1) would be exactly 1 metre in front of the marker, with the camera looking at the centre.
{{% /notice %}}
  
The `PolarCoord` object has the following properties:
 - `distance_meters()` - returns the distance from the camera to the marker in **meters**.
 - `rot_x_rad()` and `rot_x_deg` - returns the angle of rotation in radians/degrees about the x axis. The x axis runs from left to right in front of the camera. A positive angle would be one where the marker is leaning toward the camera.
 - `rot_y_rad()` and `rot_x_deg` - returns the angle of rotation in radians/degrees about the y axis. The y axsis runs up and down in front of the camera. A positive ange would be one where the marker is rotated clockwise about the y axis looking from the top of the marker.
