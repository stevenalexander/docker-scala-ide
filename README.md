# Docker Scala environment

A container with JDK, scala/scalac and SBT. Useful as a base for a Scala
build/scratch environment.

## Run

Build image:

```
docker build -t scala .
```

Run image:

```
docker run -it scala bash

# or direct to scala console
docker run -it scala scala

# or direct to sbt
docker run -it -v /myproject:/myproject -w /myproject scala sbt run
```
