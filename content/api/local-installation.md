---
title: Local installation
---

Installing our code locally will allow your editor you extract type definitions from the `Robot` class and its boards, as well as allowing type completion on parameters.

Installing these definitions is highly optional, however will be incredibly useful if your editor supports this. All editors in our [recommended list](/tutorials/editors/) besides IDLE will support it.

## Installation
Installing our API, the code you interact with, can be installed using `pip`, Python's built-in package manager. `pip` should be installed on your machine, if it's not, you'll need to look up how to install it. On Windows, this is best done using the [`get-pip.py` script](https://pip.pypa.io/en/stable/installing).

```bash
pip install git+https://github.com/sourcebots/robot-api
```

If you're doing this on a shared computer, such as those found in your colleges, add `--user` to the end:

```bash
pip install git+https://github.com/sourcebots/robot-api --user
```

Simply restart your editor of choice, and it should these up and start being able to use them immediately.

## Upgrading installation

When we release new updates, you'll need to update the locally installed version too, so you have the most up to date definitions. To do this, simply repeat the previous command, with `--update`:

```bash
pip install git+https://github.com/sourcebots/robot-api --update
pip install git+https://github.com/sourcebots/robot-api --user --update
``` 