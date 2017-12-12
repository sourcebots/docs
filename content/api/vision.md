---
title: Vision
---

The main way your robot will sense the outside world is through the webcam which is used to read the AprilTag markers.

{{% notice info %}}
Throught this page it is assumed you have a `Robot` object deined as `r`
{{% /notice %}}

## Using the camera to search for markers
If you have a webcam connected, you can use `r.camera.see()` to take a picture. The software will process the image and return any markers it sees into an array sorted by distance.
