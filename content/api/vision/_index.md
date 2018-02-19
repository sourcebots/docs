---
title: Vision
---

Your webcam is how your robot will see markers.

## Searching for markers
Assuming you have a webcam connected, you can use `r.camera.see()` to take a picture. The software will process the picture and returns a list of the markers it sees, sorted by distance, where the first element is the closest marker to the camera.

```python
markers = r.camera.see()
```

## Marker attributes
The markers in the list have some useful attributes:

- `is_wall_marker()` - returns whether or not the marker is a [wall marker](marker-ids/#wall-markers).
- `is_token_marker()` - returns whether or not the marker is a [token marker](marker-ids/#token-markers).
- `id` - returns the [id](marker-ids) of the marker.
- `pixel_centre` - returns the location in pixels of the centre of the marker in the captured image.
- `cartesian` - returns details of the position of the marker in the [Cartesian](coordinates/#cartesian-coordinates) coordinate system.
- `spherical` - returns details of the position of the marker in a [spherical](coordinates/#spherical-coordinates) coordinate system.
- `polar` - *Deprecated*. Use the `spherical` attribute instead.

{{% notice tip %}}
A marker's position can be represented using both the [Cartesian](coordinates/#cartesian-coordinates) and [spherical](coordinates/#spherical-coordinates) coordinate systems.
{{% /notice %}}
