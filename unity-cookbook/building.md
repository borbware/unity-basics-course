---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->

# Building

## Fast build

* Two options to build:
  * *File > Build and Run*
  * *File > Build Settings*
    * Add all scenes to your build settings (see [Scenes](scenes.md#building-a-game-with-multiple-scenes))
    * Click ***Build***


## Target resolution

* shown resolution is set in the Game view. Click *Free Aspect* and change the aspect ratio to your liking
* the exported resolution is set in *Project settings > Player > Resolution and Presentation*
  * untick *Default Is Native Resolution* to set resolution manually
* If you have *Canvas* GameObjects (for [UI](UI.md)), set the *Reference Resolution* in the *Canvas Scaler* component to match the target resolution


## Building with Profiler

[Manual: Profiling your application](https://docs.unity3d.com/Manual/profiler-profiling-applications.html)
[Manual: Profiler](https://docs.unity3d.com/Manual/Profiler.html)
[Unity blog: Tackling profiling](https://blog.unity.com/technology/tackling-profiling-for-mobile-games-with-unity-and-arm)
