---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Playing audio

## How to play a sound

* You need two components to play a sound
* *AudioSource*
  * You can have multiple of these
* *AudioListener*
  * There can only be one

## AudioSource

* You can have multiple of these
* [Docs: AudioSource class](https://docs.unity3d.com/ScriptReference/AudioSource.html)
* [Docs: AudioSource component](https://docs.unity3d.com/Manual/class-AudioSource.html)
* Insert to every GameObject that should be able to make a sound
  * E.g., if a Coin GameObject should have a *\*bling\** sound effect when collected
  * The *bling.wav* sound effect is drag-and-dropped into the component 
* most important functions to control the component: `.Play()`, `.Pause()`, `.Stop()`
  ```c#
  public AudioSource audio;
  if (PlayerGrabbedCoin)
      audio.Play();
  if (DoSomethingElse)
      audio.Stop();
  ```
### AudioSource component

![](imgs/audio-source.png)

* For background music, tick *Loop* checkbox to play it indefinitely

## AudioListener

* Receives input from any given Audio Source in the scene and plays sounds through the computer speakers
* [Docs: AudioListener class](https://docs.unity3d.com/ScriptReference/AudioListener.html)
* [Docs: AudioListener component](https://docs.unity3d.com/Manual/class-AudioListener.html)
* There can only be one per scene
* Usually, under the *Camera* GameObject


## Spatial Audio

* xx