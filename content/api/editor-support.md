---
title: Editor support
---

Installing our code locally will allow your editor to extract information from our code, giving you additional features like auto-complete (also known as [IntelliSense](https://en.wikipedia.org/wiki/IntelliSense)).

Installing these definitions is optional, however will be incredibly useful if your editor supports this. All editors in our [recommended list](/tutorials/editors/) besides IDLE will support it.

## Installation
Installing our API, the code you interact with, can be installed using `pip`, Python's built-in package manager. `pip` should be installed on your machine, if it's not, you'll need to look up how to install it. See [here](https://stackoverflow.com/a/12476379) for troubleshooting on Windows.

```bash
pip install git+https://github.com/sourcebots/robot-api
```

If you're doing this on a shared computer, such as those you may find in your colleges, add `--user` to the end:

```bash
pip install git+https://github.com/sourcebots/robot-api --user
```

Simply restart your editor of choice, and it should detect and start being able to use them immediately.

## Upgrading installation

When we release new updates, you'll need to update the locally installed version too, so you have the most up to date definitions. To do this, simply repeat the previous command, with `--update`:

```bash
pip install git+https://github.com/sourcebots/robot-api --update
pip install git+https://github.com/sourcebots/robot-api --user --update
```
