---
title: Vision
---

Your webcam is how your robot will see markers.

## Searching for markers
Assuming you have a webcam connected, you can use `r.camera.see()` to take a picture. The software will process the picture and returns a list of the markers it sees, sorted by distance, where the first element is the closest marker to the camera.

```python
markers = r.camera.see()
```

## Marker properties
The markers in the list have some useful properties:

- `is_wall_marker()` - returns whether or not the marker is a [wall marker](marker-ids/#wall-markers).
- `is_token_marker()` - returns whether or not the marker is a [token marker](marker-ids/#token-markers).
- `id` - returns the [id](marker-ids) of the marker.
- `pixel_centre` - returns the location in pixels of the centre of the marker in the captured image.
- `polar` - returns details of the position of the marker in the [Polar](coordinates/#polar-coordinates) coordinate system.
- `cartesian` - returns details of the position of the marker in the [Cartesian](coordinates/#cartesian-coordinates) coordinate system.

{{% notice tip %}}
The markers' position can be represented using both the [Polar](coordinates/#polar-coordinates) and [Cartesian](coordinates/#cartesian-coordinates) coordinate system.
{{% /notice %}}
