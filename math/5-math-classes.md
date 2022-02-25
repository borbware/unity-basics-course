# Unity Math classes

## Mathf, Random, Debug
* Mathf
  * [Docs: Mathf class](https://docs.unity3d.com/Manual/class-Mathf.html)
  * [Script Reference: Mathf class](https://docs.unity3d.com/ScriptReference/Mathf.html)
  * Trigonometric functions
    * radians
    * Sin, Cos, Tan, Asin, Acos, Atan, Atan2
    * Rad2Deg, Deg2Rad
    * PI
  * Pow, Sqrt, Exp, Log
  * [Interpolation](#others)
  * Limit, repeat
    * Max, Min
    * Clamp, Clamp01
      * (value, min, max)
    * Repeat, PingPong
    * Ceil, Floor

## Quaternion
  * A four-dimensional extension of complex numbers with three imaginary axes
  * WHAT??????
  * What you really need to know about them:
    * They're used for representing rotation angles instead of Euler angles that can result in a _gimbal lock_
    * Most Unity devs don't _really_ need to understand the underlying maths
  * So, rotation is stored as a quaternion
    * four components: x, y, z, w
  * ...but rotation is _shown_ in Inspector with Euler angles
  * never adjust Quaternion components independently, use ready-made functions from the Quaternion class
  * `transform.rotation = Quaternion.LookRotation(target.position - transform.position)`
  * `transform.rotation = Quaternion.LookRotation(target.position - transform.position, new Vector3.Up)`
 * Slerp
    ```c#
    Vector3 relativePos = 
      target.position
      + new Vector3(0,.5f,0)
      - transform.position;

    transform.localRotation = 
      Quaternion.Slerp(
        transform.localRotation,
        Quaternion.Lookrotation(relativePos),
        Time.deltaTime
      );

    transform.Translate(0,0, 3 * Time.deltaTime);
    ```