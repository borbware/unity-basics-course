# Unity Math classes

## Mathf
  * [Manual: Mathf class](https://docs.unity3d.com/Manual/class-Mathf.html)
  * [Script Reference: Mathf class](https://docs.unity3d.com/ScriptReference/Mathf.html)
  * Trigonometric functions
    * radians
    * Sin, Cos, Tan, Asin, Acos, Atan, Atan2
    * Rad2Deg, Deg2Rad
    * PI
  * Pow, Sqrt, Exp, Log
  * [Interpolation](3-interpolation.md) (lerp, slerp...)
  * Abs
  * Limit, repeat
    * Max, Min
    * Clamp, Clamp01
      * (value, min, max)
    * Repeat, PingPong
    * Ceil, Floor
  * [Mathf.DeltaAngle(a,b)](https://docs.unity3d.com/ScriptReference/Mathf.DeltaAngle.html): Shortest difference between two given angles
## Random

## Debug

## Quaternion
* [Manual: Rotation and Orientation in Unity](https://docs.unity3d.com/Manual/QuaternionAndEulerRotationsInUnity.html)
* ***Euler angles*** are a rather simple way of representing rotation with three X,Y,Z values
* ***Quaternions***: A four-dimensional extension of complex numbers with three imaginary axes
* What you *really* need to know about them:
  * They're used for representing rotation angles instead of Euler angles that can result in a _gimbal lock_
  * Most Unity devs don't _really_ need to understand the underlying maths

* Even though rotation is *stored* as a quaternion...
  * four components: x, y, z, w
* ...it is _shown_ in Inspector with Euler angles

* never adjust Quaternion components independently, use ready-made functions from the Quaternion class
* `transform.rotation = Quaternion.LookRotation(target.position - transform.position)`
* `transform.rotation = Quaternion.LookRotation(target.position - transform.position, new Vector3.Up)`

