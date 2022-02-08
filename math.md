# Game math

## Game math 1: Vectors

- [Docs: Vector Cookbook](https://docs.unity3d.com/2019.3/Documentation/Manual/VectorCookbook.html)
- [Brackeys video: Vectors](https://www.youtube.com/watch?v=wXI9_olSrqo)
- vector is a mathematical thingy with length and direction
- can have multiple dimensions, in our case usually 2 or 3: x,y,(z)
- often represented with an arrow
- video games are bursting with vectors!
  - used for depicting position, velocity, acceleration, force....
  - in 2D, the position vector consists of the x and y components
    - the components are respective to the origin (0,0)
  - velocity vector: velocity_x and velocity_y components
    - `new_position = old_position + velocity`
    - vector addition!
    - usually depicted as starting from the moving object
    - but wait, vector does not say where it starts from!!
- distance vector between two objects
  - subtraction
  - vector_B - vector_A
  - length of the vector: pythagoras
  - vector2.Distance()
- the arrow's starting point 


### Vector3 & Vector2
- [Docs: Understanding Vector Arithmetic](https://docs.unity3d.com/2019.3/Documentation/Manual/UnderstandingVectorArithmetic.html)
- Vector2
  - [Script Reference: Vector2](https://docs.unity3d.com/ScriptReference/Vector2.html)
- Vector3
  - [Script Reference: Vector3](https://docs.unity3d.com/ScriptReference/Vector3.html)
  - [Script Reference: Vector3 Dot](https://docs.unity3d.com/ScriptReference/Vector3.Dot.html)
  - [Script Reference: Vector3 magnitude](https://docs.unity3d.com/ScriptReference/Vector3-magnitude.html)


- [Docs: Vector Arithmetic](https://docs.unity3d.com/2019.3/Documentation/Manual/UnderstandingVectorArithmetic.html)

## Game math 2: Interpolation

### Lerp, Inverse lerp, Remap



- lerp
  - linear interpolation from a to b (usually b > a), when t goes from 0 to 1
  - Mathf.Lerp
  - [gamedevbeginner.com: Lerping in Unity properly](https://gamedevbeginner.com/the-right-way-to-lerp-in-unity-with-examples/#lerp_vector3)
- inverse lerp
  - when given a value between a and b, what is t?  
  - Mathf.InverseLerp
- remap
  - [Freya Holmér: Inverse Lerp and Remap](https://www.gamedev.net/articles/programming/general-and-gameplay-programming/inverse-lerp-a-super-useful-yet-often-overlooked-function-r5230/)

### Clamping

- with Mathf.Lerp, interpolated value is a at minimum and b at maximum
- Mathf.LerpUnclamped lets the value to go beyond

### Others

  - Interpolation
    - Lerp, LerpAngle, LerpUnclamped
    - InverseLerp
    - Slerp
    - SmoothDamp(Angle)
    - SmoothStep
    - MoveTowards(Angle)
    - [Learn: Linear interpolation](https://learn.unity.com/tutorial/linear-interpolation?uv=2019.3&courseId=5c61706dedbc2a324a9b022d&projectId=5c8920b4edbc2a113b6bc26a#5c8a48bdedbc2a001f47cef6)

## Unity Math classes

### Mathf, Random, Debug
- Mathf
  - [Docs: Mathf class](https://docs.unity3d.com/Manual/class-Mathf.html)
  - [Script Reference: Mathf class](https://docs.unity3d.com/ScriptReference/Mathf.html)
  - Trigonometric functions
    - radians
    - Sin, Cos, Tan, Asin, Acos, Atan, Atan2
    - Rad2Deg, Deg2Rad
    - PI
  - Pow, Sqrt, Exp, Log
  - [Interpolation](#others)
  - Limit, repeat
    - Max, Min
    - Repeat, PingPong
    - Clamp, Clamp01
    - Ceil, Floor

### Quaternion
  - A four-dimensional extension of complex numbers with three imaginary axes
  - WHAT??????
  - What you really need to know about them:
    - They're used for representing rotation angles instead of Euler angles that can result in a _gimbal lock_
    - Most Unity devs don't _really_ need to understand the underlying maths
  - So, rotation is stored as a quaternion
    - four components: x, y, z, w
  - ...but rotation is _shown_ in Inspector with Euler angles
  - never adjust Quaternion components independently, use ready-made functions from the Quaternion class
  - `transform.rotation = Quaternion.LookRotation(target.position - transform.position)`
  - `transform.rotation = Quaternion.LookRotation(target.position - transform.position, new Vector3.Up)`
 - Slerp
```c#
Vector3 relativePos = (target.position + new Vector3(0,.5f,0)) - transform.position;

transform.localRotation = Quaternion.Slerp(transform.localRotation, Quaternion.Lookrotation(relativePos), Time.deltaTime);

transform.Translate(0,0, 3 * Time.deltaTime);
```