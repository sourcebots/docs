---
title: Marker IDs
---

Each marker used in the game has an ID that corresponds to the marker type. You can use this within your code to determine what sort of marker you're looking at and make decisions based off of it.

There are some useful constants which can be imported to do this. For example:

```python
from robot import WALL, TOKEN_ZONE_1, COLUMN_N_FACING_N
```

To check your marker matches one of these types, you can use the `in` operator:

```python
marker = r.camera.see()[0]  # Only the closest marker

marker.id in WALL
>>> True 
```

### _Wall_ Markers
These markers are the ones positioned around the arena, there are 28 in total. Each token has a unique ID, and its location is documented in [the rules](/rules). This may be useful to calculate your position in the arena.

```python
marker.id in WALL  # Is this marker a wall marker
```

### _Column_ Markers
These markers are those positioned on the four faces of the four columns in the arena. Each face has a unique, documented ID, and so could be used in addition to [_Wall_ Markers](#wall-markers) to calculate your position, and make sure you don't run into them!

```python
marker.id in COLUMN
>>> True
```

Each column has its own constant to check if the marker belongs to a specific column. There's also additional constants to check if a marker is facing a certain direction, and of course checking a specific face of a specific column.

{{% notice tip %}}
Columns are referenced like the points of a compass (_N_, _E_, _S_, _W_), with the North West corner of the arena as corner 0.
{{% /notice %}}

```python
marker.id in COLUMN  # Is the marker a column marker?
 
marker.id in COLUMN_N  # Is the marker on the North column? 

marker.id in COLUMN_FACING_E  # Is the marker facing East on its column?
 
marker.id == COLUMN_S_FACING_W  # Is the marker on the South column facing West?
```

In the above examples, the points of the compass may be replaced with any others. 

{{% notice note %}}
The constants for the general classes of column markers (e.g: `COLUMN_N`) are collections of marker ids and so need comparison with `in`. The constants for the specific column faces (e.g: `COLUMN_S_FACING_W`) define only a single value and so should be compared to using `==`.
{{% /notice %}}

### _Token_ Markers
Each token has a marker on its face. These markers can be used to work out what teams token it is.

Each scoring zone has a corresponding constant that matches tokens belonging to that zone. There's also another constant that matches tokens belonging to any zone.

```python
marker.id in TOKEN  # Is the marker on a token?

marker.id in TOKEN_ZONE_0  # Does this token belong to the team in zone 0?
```

{{% notice info %}}
Each face of the token has the same marker on. However each token has different markers.
{{% /notice %}}

{{% notice tip %}}
It's recommended to use `marker.is_token_marker()` instead of `marker.id in TOKEN`.
{{% /notice %}}

### All Marker Constants
Any of the below marker constants can be imported from the `robot` module.

#### Markers on a specific column
A set of marker ids on any face of a specific column.

- `COLUMN_N`
- `COLUMN_E`
- `COLUMN_S`
- `COLUMN_W`

#### Markers facing a specific direction
A set of marker ids specifying which direction a column is facing.

- `COLUMN_FACING_N`
- `COLUMN_FACING_E`
- `COLUMN_FACING_S`
- `COLUMN_FACING_W`
 
#### Specific column faces
A single marker id specifying which column the marker is on, and which direction it's facing. 

- `COLUMN_N_FACING_N`
- `COLUMN_N_FACING_S`
- `COLUMN_N_FACING_E`
- `COLUMN_N_FACING_W`
- `COLUMN_S_FACING_N`
- `COLUMN_S_FACING_S`
- `COLUMN_S_FACING_E`
- `COLUMN_S_FACING_W`
- `COLUMN_E_FACING_N`
- `COLUMN_E_FACING_S`
- `COLUMN_E_FACING_E`
- `COLUMN_E_FACING_W`
- `COLUMN_W_FACING_N`
- `COLUMN_W_FACING_S`
- `COLUMN_W_FACING_E`
- `COLUMN_W_FACING_W`

#### Any column marker
`COLUMN`: A set of marker ids on any face of any column

#### Any token marker
`TOKEN`: A set of marker ids on any token

#### Tokens belonging to a specific zone
A set of marker ids belonging to a specific zone. This zone is the zone matching their colour, rather than the zone they start in.

- `TOKEN_ZONE_0`
- `TOKEN_ZONE_1`
- `TOKEN_ZONE_2`
- `TOKEN_ZONE_3`

{{% notice info %}}
You can also [read the source](https://github.com/sourcebots/robot-api/blob/master/robot/game_specific.py) to see the constants. 
{{% /notice %}}
