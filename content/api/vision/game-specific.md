---
title: Game Specific Helpers
---

## Marker IDs
Each marker used in the game has a unique ID that corresponds to the marker type. You can use this within your code to determine what sort of marker you're looking at and make decisions based off of it.

There are three main marker types in the game `WALL`, `TOKEN` and `TOKEN_ZONE_x` where `x` is the starting zone in the arena:

  - `WALL`- Markers that are on the walls with IDs from 0 - 27
  - `TOKEN`- Markers that are on the tokens (boxes) with IDs from 44 - 63
  - `TOKEN_ZONE_0` - Markers in the 0th zone with IDs from 44 - 48
  - `TOKEN_ZONE_1` - Markers in the 1st zone with IDs from 49 - 53
  - `TOKEN_ZONE_2` - Markers in the 2nd zone with IDs from 54 - 58
  - `TOKEN_ZONE_3` - Markers in the 3rd zone with IDs from 59 - 63

