---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# Building

## Fast build

* Two options to build your game:
  * *File > Build and Run*
  * *File > Build Settings*
    * Add all scenes to your build settings (see [Scenes](scenes.md#building-a-game-with-multiple-scenes))
    * Click ***Build***
* This builds a ***native build*** by default (if you're on Windows, it's a Windows build)

## Target resolution

* shown resolution is set in the Game view. Click *Free Aspect* and change the aspect ratio to your liking
* the exported resolution is set in *Project settings > Player > Resolution and Presentation*
  * untick *Default Is Native Resolution* to set resolution manually
* If you have *Canvas* GameObjects (for [UI](UI.md)), set the *Reference Resolution* in the *Canvas Scaler* component to match the target resolution

## Web build

* If you want your game to be played on a web browser (and you should!), you can create a ***web build***
* To build for web, go to build settings and select WebGL as a platform. 
* If you haven't yet, you need to install the WebGL build tools to build for web.
* Change the build mode to WebGL (a button next to the "Build")
 button xx
* (You might need to restart Unity to see the build tools as installed.)

---
![](imgs/web1.png)

---

* Then, check these three settings in *Project preferences > Player*:

![](imgs/web2.png)

## Running web builds with a server

* To run a web build, you need a web server
* Or, you can host the web build in itch.io or similar
* Or, you can just click "build and run" to run the web build once.
* xx

## Uploading Web builds to itch.io

## Building with Profiler

[Manual: Profiling your application](https://docs.unity3d.com/Manual/profiler-profiling-applications.html)
[Manual: Profiler](https://docs.unity3d.com/Manual/Profiler.html)
