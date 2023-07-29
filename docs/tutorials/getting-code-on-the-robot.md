# Getting code on the robot

Getting your code on to the robot is quite simple. You will need to put your code on a USB drive which will need to be formatted with either FAT32, exFAT or ext 2-4. Upon plugging in the drive or starting up, the robot will run the `robot.py` file found in the root of the drive.

To re-run your program, simply remove the USB stick from the robot and plug it back in again and it will restart automatically.

## Windows

1. Open your code in File Explorer
2. Select all of your code files (++ctrl+a++ to select all files)
3. Right-click the files and click "Copy"
4. Open your USB drive in File Explorer
5. Right-click in the directory and click "Paste"

## macOS

1. Open your code in Finder
2. Select all of your code files (++cmd+a++ to select all files)
3. Right-click (or Control-click) the files and click "Copy"
4. Open your USB drive in Finder
5. Right-click in the directory and click "Paste N items"

## Robot logs

When your program runs on the robot, the output of `print(...)` statements and any errors which occur are written to a log file on the USB stick as `log.txt`.
