---
title: The Update File
---

The update file is the simplest way to update your Pi with new software from us.  

{{% notice tip %}}
Using this file is the recommended way to update your kit.
{{% /notice %}}

## Using the update file

1. Create a minimal robot setup of at least the battery, Pi and power board. Additional components aren't required, however do not need to be disconnected.
2. Put the `update.tar.xz` file on a USB drive
3. Connect the USB drive to your robot
4. Turn on your robot
5. Wait for your Pi to reboot, this is a sign the update has completed successfully.

If you have a `main.py` file on the USB as well, this will now execute, because the `update.tar.xz` file is deleted when the update begins.

{{% notice warning %}}
Do not turn off your Pi during the update process. It can take a few minutes to finish.
{{% /notice %}}

## Logging
The update process will create an `update.log` file on the USB drive. If any errors occur, they will be displayed there. If the update succeeds, the line _Upgrade complete, rebooting._ will be shown in the log.

## Failed update
If the update fails, you can try again. If it fails multiple times, you may need to [flash your SD card](/kit/pi/sd-card).
