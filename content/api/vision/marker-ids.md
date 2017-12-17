---
title: Marker IDs
---

Each marker used in the game has an ID that corresponds to the marker type. You can use this within your code to determine what sort of marker you're looking at and make decisions based off of it.

There are some useful constants which can be imported to do this. For example:

```python
from robot import WALL
```

To check your marker matches one of these types, you can use the `in` operator:

```python
marker = r.camera.see()[0]  # Only the closest marker

marker.id in WALL, TOKEN_ZONE_1, COLUMN_N_FACING_N
>>> True 
```

To see the full range of constants, and the exact IDs they match up to, have a look at [the source](https://github.com/sourcebots/robot-api/blob/master/robot/game_specific.py).

### _Wall_ Markers
These markers are the ones positioned around the arena, there are 28 in total. Each token has a unique ID, and its location is documented in [the rules](/rules), and available in the `WALL` constant. This may be useful to calculate your position in the arena.

### _Column_ Markers
These markers are those positioned on the 4 faces of the 4 columns in the arena. Each face has a unique, documented ID, and so could be used in addition to [_Wall_ Markers](#wall-markers) to calculate your position, and make sure you don't run into them!

```python
marker.id in COLUMN
>>> True
```

Each column has its own constant to check if the marker belongs to a specific column. There's also additional constants to check if a marker is facing a certain direction, and of course checking a specific face of a specific column.

{{% notice tip %}}
Columns are referenced like the points of a compass (_N_, _E_, _S_, _W_), with the North West corner as corner 0.
{{% /notice %}}

```python
marker.id in COLUMN_N  # Is the marker on the North column? 

marker.id in COLUMN_FACING_E  # Is the marker facing East on its column?
 
marker.id in COLUMN_S_FACING_W  # Is the marker on the South column facing West?
```
{{% notice note %}}
In the above examples, the points of the compass may be replaced with any others.
{{% /notice %}}

### _Token_ Markers
Each token has a marker on its face. These markers can be used to work out what teams token it is.

There's a constant for each zone, and an additional to work out if it's a marker token you're looking at.

```python
marker.id in TOKEN  # Is the marker on a token?

marker.id in TOKEN_ZONE_0  # Does this token belong to the team in zone 0?
```

{{% notice info %}}
Each face of the token has the same marker on. However each token has different markers.
{{% /notice %}}
