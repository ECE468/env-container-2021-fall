# Project Environment for Purdue ECE Compilers 2021 Fall

This is the dockerfile repository for the project environment of Purdue ECE Compilers course for 2021 Fall.

All project grading will be done within this environment.

## Environment

- Environment is based on `debian:stable`
- JDK is Java 8 from [AdoptOpenJDK Project](https://adoptopenjdk.net/)
- Antlr 4.9.2 Complete Jar Ball is installed at `/usr/local/share/antlr.jar`
- A convenient script to call Antlr tool is installed at `/usr/local/bin/antlr` and calling `antlr` would invoke it
- `CLASSPATH` environment variable is set to the above jar ball so all Java program depending on Antlr runtime shall run without problem.

## Usage

In a docker installation,

```(bash)
docker pull ghcr.io/ece468/project-env:latest
```

and run it with

```(bash)
docker run -it ghcr.io/ece468/project-env:latest
```

to get a command line running in the environment

For details on usage, please see [project environment documentation](https://cap.ecn.purdue.edu/compilers/project/).