---
title: Math. Unity Math classes
marp: true
paginate: true
math: mathjax
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Unity Math classes: Mathf, Random, Quaternion

## `Mathf` class

* [Manual: Mathf class](https://docs.unity3d.com/Manual/class-Mathf.html)
* [Script Reference: Mathf class](https://docs.unity3d.com/ScriptReference/Mathf.html)
* Min, Max, Clamp, Abs: See [Helpful Math functions](0-mathf)
* See [Interpolation](3-interpolation) (lerp, slerp...)

### Trigonometric functions

* Sin, Cos, Tan, Asin, Acos, Atan, Atan2
* Rad2Deg, Deg2Rad
* PI

### Other functions 
* Pow, Sqrt, Exp, Log
* Abs

### Limits & repeats

* Max, Min
* Clamp, Clamp01
  * (value, min, max)
* Repeat, PingPong
* Ceil, Floor
* [Mathf.DeltaAngle(a,b)](https://docs.unity3d.com/ScriptReference/Mathf.DeltaAngle.html): Shortest difference between two given angles

## `Random` class

* [Important classes: Random](https://docs.unity3d.com/Manual/class-Random.html)
  * This page has all the random examples you need
* [Script Reference: Random class](https://docs.unity3d.com/ScriptReference/Random.html)

### `Random.Range`

* [Script Reference: Random.Range](https://docs.unity3d.com/ScriptReference/Random.Range.html)
* **Note:** For integers, the maximum value is ***exclusive*** (it's not included!)
  * For floats it's ***inclusive*** (it IS included!)
* For example:
  * `Random.Range(0,10)` returns random integer values $0,\dots,9$ (not $10$!)
  * `Random.Range(0f,10f)` returns random float values $0,\dots,10$

## `Quaternion` class

* [Manual: Rotation and Orientation in Unity](https://docs.unity3d.com/Manual/QuaternionAndEulerRotationsInUnity.html)
* ***Euler angles*** are a rather simple way of representing rotation with three X,Y,Z values
* ***Quaternions***: A four-dimensional extension of complex numbers with three imaginary axes

### What you *really* need to know about Quaternions

* They're used for representing rotation angles instead of Euler angles that can result in a _gimbal lock_
* Most Unity devs don't _really_ need to understand the underlying maths

* Even though rotation is *stored* as a quaternion...
  * four components: x, y, z, w
* ...it is _shown_ in Inspector with Euler angles

### Quaternion note

* Never adjust Quaternion components independently, use ready-made functions from the Quaternion class
* `transform.rotation = Quaternion.LookRotation(target.position - transform.position)`
* `transform.rotation = Quaternion.LookRotation(target.position - transform.position, new Vector3.Up)`

## Reading

* [GMTK: The two types of random in game design](https://www.youtube.com/watch?v=dwI5b-wRLic)
