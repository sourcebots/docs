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

- `id` - returns the [id](marker-ids) of the marker.
- `pixel_centre` - returns the location in pixels of the centre of the marker in the captured image.
- `cartesian` - returns details of the position of the marker in the [Cartesian](coordinates/#cartesian-coordinates) coordinate system.
- `spherical` - returns details of the position of the marker in a [spherical](coordinates/#spherical-coordinates) coordinate system.
- `polar` - *Deprecated*. Use the `spherical` attribute instead.

{{% notice tip %}}
A marker's position can be represented using both the [Cartesian](coordinates/#cartesian-coordinates) and [spherical](coordinates/#spherical-coordinates) coordinate systems.
{{% /notice %}}

## Marker PDFs
You can download PDF files of all markers:

- [Large markers](/docs/large-tags.pdf), Containing Wall and Column markers (250x250mm, should be printed on A3)
- [Small markers](/docs/small-tags.pdf), Containing Token markers (100x100mm, should be printed on A4)
