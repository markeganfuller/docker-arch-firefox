# Docker Archlinux Firefox

Docker container using Archlinux and providing firefox.

## Usage with host Xorg

In order to use this with the hosts Xorg use the following flags:

```
-e DISPLAY=$DISPLAY
-v /tmp/.X11-unix:/tmp/.X11-unix
-shm-size 2g
```

You may also need to allow access to your Xorg server:

```
xhost "+local:"
```

Which can be undone when finished with:

```
xhost "-local:"
```
