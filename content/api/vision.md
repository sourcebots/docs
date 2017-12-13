---
title: Vision
---

The main way your robot will sense the outside world is through the webcam.

{{% notice info %}}
Throughout this page it is assumed you have a `Robot` object defined as `r`
{{% /notice %}}

## Using the camera to search for markers
If you have a webcam connected, you can use `r.camera.see()` to take a picture. 

If you consider it necessary you can assign the camera object to a variable just like Robot:

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

  - `is_wall_marker()` - returns whether or not a marker is of type WALL
  - `is_token_marker()` - returns whether or not a marker is of type TOKEN
  - `id()` - returns the id of the marker
  - `pixel_centre()` - returns a **tuple** containing the pixel coordinates of the centre of the marker.
  - `polar()` - returns a PolarCoord object containing the position of the marker in the Polar coordinate system.
  - `cartersian()` - returns a CartCoord object containing the position of the marker in the Cartesian coordinate system.

## Cartesian and Polar Coordinate Systems
The markers' position can be represented using both the Polar and Cartesian coordiate system. The two objects `CartCoord` and `PolarCoord` hold the position information for both of these systems.

{{% notice info %}}
Cartesian coordinates are ones that are defined using a unique set of values (typically x, y and z) to specify a point in space. Polar coordinates are represented by a distance from a set point and an angle from a set direction.
{{% /notice %}}

The `CartCoord` object has the following properties:
  - `x()` - returns the x coordinate of the marker in Cartesian space.
  - `y()` - returns the y coordinate of the marker in Cartesian space.
  - `z()` - returns the z coordinate of the marker in Cartesian space.
  
  **N.B. Y is taken from left to right with left being negative and 0 being directly in front of the camera, Y is taken as up and down with down being negative and Z is distance.**
 
The `PolarCoord` object has the following properties:
 - `distance_meters()` - returns the distance from the camera to the marker in **meters**.
