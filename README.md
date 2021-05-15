## Introduction

### x11docker Introduction

![x11docker logo](x11docker.png)
This container uses x11docker. x11docker allows to run graphical desktop applications (and entire desktops) in Docker Linux containers. For more information on x11docker visit the original [github repo](https://github.com/mviereck/x11docker)

### Sonic pi Introduction
This container uses sonic pi. Sonic pi is a programming language for music production. You can code music in a simple yet powerful way. For more information on sonic pi visit the original [github repo](https://github.com/sonic-pi-net/sonic-pi)

### Project Introduction
This project is a container to run sonic pi (with gui) in docker. The image is based on x11docker/xfce with all the necessary dependencies to build sonic pi from source.

## Manual
```
./build.sh
./run.sh
```
The container will run in a in x11 environment (accessed with ctrl+alt+F9 shortcut), to switch back to desktop mode use ctrl+alt+F7 shortcut.

## Notice
Do note that this is not stable at all. It was made as a proof of concept and to explore docker gui. There is a slight chance of not working on the first run. Since it runs on the latest version of each dependency, it is bound to break (in the time of writting there is a bug in supercollider server not starting)

---
## To do
- [] Add persistant file storage between container and host.
- [] Add built-in documentation resources (maybe browser that defaults to internet sources, or local files).
- [] Add even more tools for ease of development.
- [] Support of external inputs (test cabled input, install support of wireless input like wo mic)
