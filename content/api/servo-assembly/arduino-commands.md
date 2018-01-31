---
title: Custom Arduino Commands
---

At the core of the servo assembly is an Arduino <TODO: model name>. By default
the Arduino runs firmware created by SourceBots providing simple access to the
attached servo shield, compatible ultrasound sensors and to the GPIO pins
directly.

You can also extend the firmware on the Arduino to support more features, for
example if you have other types of sensor which require higher precision timing
than can be achieved through the Python API.

## Requirements

As your new firmware will still need to be able to talk to the Python code
running on the Raspberry Pi, you'll need to base it on SourceBots default
firmware. You can get a copy of the source code from GitHub:

```txt
git clone https://github.com/sourcebots/servo-firmware
```

<TODO: describe how to do that without git>

We recommend using [Arduino Studio](https://www.arduino.cc/en/Main/Software) to
edit your firmware as it provides direct support for building the code into the
firmware binary and downloading it onto the Arduino.

## Adding a command

In order for the code running on your Pi to be able to interact with the
functionality you're adding to the Arduino, you'll need to define a new command.

Adding a command requires two changes. First you must define the function which
will implement the operations of that command and then you register that command
under the name you'll use to call it from the Python code.

### Implementing the command

Here's a simple command which just echoes back any arguments it receives:

```cpp
// Define a function which implements your command. As long as you stick to
// letters, numbers and underscore (_), you can call it whatever you like.
// With the exception of the name (here it's `echo`), the rest of the function's
// "signature" must be exactly as it is on the following line:
static CommandError echo(int commandId, String argument) {

  if (argument.length() == 0) {
    // If something went wrong, you should return a `COMMAND_ERROR` with a
    // message about the failure. That message will be fed back to Python where
    // an exception will be raised.
    return COMMAND_ERROR("nothing to echo");
  }

  while (argument.length() > 0) {
    // You can use `pop_option` to extract individual parameters from the
    // `argument` string. They're sent space-separated, so be sure not to
    // include any spaces within your argument values!
    //
    // You don't need to check the length of `argument` before calling
    // `pop_option` -- if there isn't an option to be had you'll get back an
    // empty string ("").
    String next_arg = pop_option(argument);

    // You can write values to be read by the code on the Pi using the
    // `serialWrite` function. The first two arguments need to be exactly as
    // they are here; the third argument needs to be a `String` containing the
    // value you want to send back to the Pi.
    serialWrite(commandId, '>', next_arg);
  }

  // If everything went fine, you should return `OK`.
  return OK;
}
```
<!-- TODO: mention being able to send back comments? -->

For other examples of how to define commands (and the helper functions you can
use), you can have a look at the other commands the Arduino already supports.
In particular the `get_version`, `led` and `servo`  are a good starting point.

<!-- TODO should we error in robot-api/robotd if the incoming arguments include spaces? -->

### Registering the command

To register this command we need to modify the list of commands stored in the
`commands` array. To do this we add a new line containing a `CommandHandler` for
the command.

```cpp
static const CommandHandler commands[] = {
  // ... lots of existing commands ... (make sure you leave them in place!)
  CommandHandler("echo", &echo, "echoes its arguments, each on a new line"),
};
```

The first argument is a quoted `String` literal containing the name you'll use
in Python to call this command. It can contain letters, numbers and dashes (`-`).

The second argument is the function you defined for your function, with an
ampersand (`&`) just before the name.

The third argument is another quoted `String` literal containing a description
of the command. This helps document what the command is for, and will be
returned as part of the message if you call the `help` command.

## Calling commands

To call a command from Python you should call the `direct_command` method on a
`Servo` instance. You can send strings and numbers:

```python
r.servo_board.direct_command('echo', "first argument", 2, "third argument")
```

<!-- TODO: what happens to numbers sent over the serial connection? -->

This will return a `list` of the responses from the command (anything which was
sent back using the `serialWrite` function):

```python
>>> r.servo_board.direct_command('echo', "first argument", 2, "third argument")
["first argument", "2", "third argument"]
```

Note that the responses will all be strings, so you'll need to explicitly
convert them back to numbers if you want to use them as numbers:

``` python
>>> a, b = r.servo_board.direct_command('echo', 6, 2)
>>> print(int(a) / int(b))
3
>>> print(a / b)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unsupported operand type(s) for /: 'str' and 'str'
```

### Errors

If an error is encountered while handling a command an [exception][errors] will
be raised. The exceptions will contain information about the error so that you
can change your code to fix it.

#### `CommandError`

A `CommandError` indicates that the servo assembly experienced an error in
processing the command and sent back an error message. The error message will be
that returned by the command on the Arduino as a `COMMAND_ERROR`:

```python
>>> r.servo_board.direct_command('echo')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
CommandError: Error: nothing to echo
```

You'll also see a `CommandError` if you try to call a command which doesn't
exist:

```python
>>> r.servo_board.direct_command('missing-command')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
CommandError: Error, unknown command: missing-command
```

This error will generally indicate that something is wrong in your Python code.

#### `InvalidResponse`

A `InvalidResponse` indicates that the Python API which handles the actual
communication to the Arduino received an invalid response from the Arduino. The
error message will be the actual text received from the Arduino, allowing you to
easily see the cause of the problem.

```python
>>> r.servo_board.direct_command('the-command')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
InvalidResponse: b'received data'
```

This error will generally indicate that one of the messages being sent back from
the Arduino is badly formatted. Check to ensure that you're using `serialWrite`
correctly for all your messages back to the Pi.


<!--
    At some point we might need to detail how to remove bits of the firmware
    which the teams aren't using. That's intentionally omitted for the moment
    as it's nontrivial to describe which bits are safe to remove.
-->

[errors]: https://docs.python.org/3/tutorial/errors.html
