---
title: Flashing your SD card
---

To fully update your Pi's software, or refresh it if you think it's not working correctly, you can flash our SD card image onto the microSD card in your Pi. 

To update the SD card, you'll need to download our update file, `pi-image.img.xz`. The flashing procedure is identical to flashing other images.

## Etcher
We recommend using [etcher](https://etcher.io), as it's simple to use, and available on Windows, macOS and Linux. If you have another preferred tool, that will also work.
 
![Etcher example](https://etcher.io/static/screenshot.gif)

{{% notice note %}}
If you choose to use a tool other than Etcher, you may need to extract the `pi-image.img.xz` to `pi-image.img`. There are many tools available for this.
{{% /notice %}}

### Flashing

1. Open Etcher and select the `pi-image.img.xz` file you downloaded.
2. Select your SD card from the devices window
3. Click 'Flash!'.

{{% notice tip %}}
The Raspberry Pi Foundation also have a good tutorial for all platforms [on their website](https://www.raspberrypi.org/documentation/installation/installing-images/).
{{% /notice %}}
