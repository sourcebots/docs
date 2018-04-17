---
title: Game State
---

## Mode
Your robot can be in 1 of 2 modes: `DEVELOPMENT` and `COMPETITION`. By default, your robot will be in `DEVELOPMENT` mode. To work out which mode you're in, you need to compare the values against the `GameMode`:

```python
from robot.game import GameMode

r.mode == GameMode.DEVELOPMENT
>> True
```

During competition mode, your robot will stop executing code at the end of the match.

## Zone
Your robot will start in a corner of the arena, known as its starting zone. The number of zones depends on the game. Each zone is given a number, which you can access with the `zone` property:

```python
r.zone
>> 2
```

During a competition match, a USB drive will be used to tell your robot which corner it's in. By default, during development, this is `0`.
