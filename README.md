# Docker scala-ide

A container with JDK, scala/scalac, SBT and scala-ide. Use the X11 socket when
running the image to display the IDE. Inspired by [Jessie Frazelle's blog](https://blog.jessfraz.com/post/docker-containers-on-the-desktop/).

Useful to quickly create a clean development environment without modifying your
host OS.

## Run

Build image:

```
docker build -t stevenalexander/scala-ide .
```

Run image:

```
# First run
docker run -it --cpuset 0 -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY --name scala-ide stevenalexander/scala-ide

# After
docker start scala-ide
```
