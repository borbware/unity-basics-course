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
* [Script Reference: AudioSource class](https://docs.unity3d.com/ScriptReference/AudioSource.html)
* [Manual: AudioSource component](https://docs.unity3d.com/Manual/class-AudioSource.html)
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

* You can think of this component as the ears of the player character
* Receives input from any given Audio Source in the scene and plays sounds through the computer speakers
* [Script Reference: AudioListener class](https://docs.unity3d.com/ScriptReference/AudioListener.html)
* [Manual: AudioListener component](https://docs.unity3d.com/Manual/class-AudioListener.html)
* There can only be one per scene
* Usually, under the *Camera* GameObject

## Spatial Audio

* For sound effects that get louder when the AudioListener is closer to the source 
* AudioSource settings
  * Set spatial blend to 1 (3D)
  * In 3D Sound Settings, set Volume Rolloff to Logarithmic Rolloff
    * (You can customize the graph yourself!)
  * Set Max distance to something fitting for your scene
    * This is visualized as a sphere
<!-- _footer: "[Scott Rowell Video: Unity Spatial Audio](https://www.youtube.com/watch?v=_2BhQN7-bGk)" -->

## SFX Exercise
<!-- _backgroundColor: #29366f -->

Time to add sound effects to your game! Either:

a) Download from [freesound](https://freesound.org/) (you'll need an account)
b) Record with your PC mic by using Audacity
c) Create new sounds by using bfxr

Then, add sounds to your game. Try at least these two kinds of sound effects:

1) a one-time sound effect that can be triggered with code
2) looping sound that plays all the time

## Playing sound when something gets destroyed

* xx