---
title: Unity Cookbook. Building an executable
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Building an executable

## Fast native build

* To create a ***native build*** (if you're on Windows, it's a Windows build):
* Go to *File > Build Settings*
  * See that Platform is *Windows, Mac, Linux* and Architecture is *Intel 64-bit* 
  * Add all scenes to your build settings (see [Scenes](scenes#building-a-game-with-multiple-scenes))
    * If you only have one scene, you can just click on *Add Open Scenes*
    * If you have more, you can drag-and-drop them to the *Scenes In Build* listing
  * Click ***Build***
    * Create a `/Builds/` folder and select it

## Other platforms

* To build for other platforms, you need to install the dedicated modules for them in the Unity Hub

![](imgs/addmodules.png)

## Target resolution

* Shown resolution is set in the Game view. Click *Free Aspect* and change the aspect ratio to your liking
* The exported resolution is set in *Project settings > Player > Resolution and Presentation*
  * Untick *Default Is Native Resolution* to set resolution manually
* If you have *Canvas* GameObjects (for [UI](UI)), set the *Reference Resolution* in the *Canvas Scaler* component to match the target resolution

## Web build

* If you want your game to be played on a web browser (and you should!), you can create a ***web build***
* To build for web, go to build settings and select WebGL as a platform. 
* If you haven't yet, you need to install the WebGL module to build for web on the Unity Hub.

---

* Then, check these three settings in *Project preferences > Player*:

![](imgs/web2.png)

---

![](imgs/web1.png)

---

* On the list to the left on *Build settings*, choose the WebGL platform and then click on *Switch Platform*
![](imgs/switchplatform.png)
* (You might need to restart Unity to see the build tools as installed.)

## Running web builds with a server

* To run a web build, you need a web server
  * ...or you can host the web build in itch.io or similar
  * To try out the web build, you can click *Build and run*
* xx

## Building with Profiler

[Manual: Profiling your application](https://docs.unity3d.com/Manual/profiler-profiling-applications.html)
[Manual: Profiler](https://docs.unity3d.com/Manual/Profiler.html)
[Unity blog: Tackling profiling](https://blog.unity.com/technology/tackling-profiling-for-mobile-games-with-unity-and-arm)

## Building for Android

* When you change the build target platform, you need to click *Switch Platform* on Build settings
* Install JDK, SDK, NDK
* [Building for Android](https://docs.unity3d.com/Manual/android-BuildProcess.html)
* [Android environment setup](https://docs.unity3d.com/Manual/android-sdksetup.html)

### Running the build on your Android phone

* Enable Developer options to your phone
  * Go to *Settings > About Phone* > Tap *Build number* many times
* Enable USB Debugging
  * *System > Advanced > Developer Options > USB Debugging*
* Connect an Android phone to your computer via USB
* Select your phone from the list in *Build Settings > Run Device*
