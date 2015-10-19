# rpi-hypriot-app-installer

This image made for Hypriot Docker Image for Raspberry Pi.

You can install applications into host environment from inside docker container to run this docker container with volume options.

## usage

**Build the image**

`$ docker build -t knjcode/rpi-hypriot-app-installer github.com/knjcode/rpi-hypriot-app-installer`

**Run the container**

`$ docker run --rm -v /opt/bin:/target-bin -v $HOME:/target-home knjcode/rpi-hypriot-app-installer`

Then, you can install applications into /opt/bin and add settings $HOME/.bashrc.

### Installing applications

- direnv
- fugu
- make

### Additional settings

- direnv hook for bash

## Caveats

This Docker image only works on ARM architecture.

## Reference

[jpetazzo/nsenter](https://github.com/jpetazzo/nsenter)
