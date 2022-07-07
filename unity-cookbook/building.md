---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# Building

## Fast native build

* Two options to build:
  * *File > Build and Run*
  * *File > Build Settings*
    * Add all scenes to your build settings (see [Scenes](scenes.md#building-a-game-with-multiple-scenes))
    * Click ***Build***


## Target resolution

* Shown resolution is set in the Game view. Click *Free Aspect* and change the aspect ratio to your liking
* The exported resolution is set in *Project settings > Player > Resolution and Presentation*
  * Untick *Default Is Native Resolution* to set resolution manually
* If you have *Canvas* GameObjects (for [UI](UI.md)), set the *Reference Resolution* in the *Canvas Scaler* component to match the target resolution


## Building with Profiler

[Manual: Profiling your application](https://docs.unity3d.com/Manual/profiler-profiling-applications.html)
[Manual: Profiler](https://docs.unity3d.com/Manual/Profiler.html)

## Building for Android

* When you change the build target platform, you need to click *Switch Platform* on Build settings
* Install JDK, SDK, NDK
* [Building for Android](https://docs.unity3d.com/Manual/android-BuildProcess.html)
* [Android environment setup](https://docs.unity3d.com/Manual/android-sdksetup.html)

### To run the build on your Android phone:
* Enable Developer options to your phone
  * Go to *Settings > About Phone* > Tap *Build number* many times
* Enable USB Debugging
  * *System > Advanced > Developer Options > USB Debugging*
* Connect an Android phone to your computer via USB
* Select your phone from the list in *Build Settings > Run Device*