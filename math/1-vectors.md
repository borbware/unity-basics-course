---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->
# Game math 1: Vectors
## What are vectors

* vector is a mathematical thingy with length and direction
* often represented with an arrow
* can have multiple dimensions (also called components)
  * in our case usually 2 or 3: 
  * x, y, and possibly z
* video games are full of vectors!
  * used for depicting position, velocity, acceleration, forces....
## Vectors in Unity

* Unity has two Vector classes, Vector2 and Vector3
  * 2 and 3 are the number of dimensions: (x,y) and (x,y,z)
  * `Vector2 position = new Vector2(1.0f, 2.0f)`
  * the components are respective to the *origin* (0,0)
    * can be modified by accessing with the dot notation
    * `position.x = 3.0f`

* length of vector can be acquired with `vector.Magnitude`
  * it's calculated with the Pythagoras' theorem:
  * `Mathf.Sqrt(position.x^2 + position.y^2 + position.z^2)`
## Vector arithmetic

* [Docs: Understanding Vector Arithmetic](https://docs.unity3d.com/2019.3/Documentation/Manual/UnderstandingVectorArithmetic.html)
  * addition
  * subtraction
  * scalar multiplication
  * vector multiplication
    * dot product
    * cross product
## Velocity vectors
  * velocity vector: velocity_x and velocity_y components
    * `new_position = old_position + velocity`
    * vector addition!
    * usually depicted as starting from the moving object
    * but wait, vector does not say where it starts from!!
## Distance vectors

* distance vector between two objects
  * 
  * Vector2.Distance(vector_A, vector_B)
  * subtraction
  * vector_B * vector_A
  * length of the vector: pythagoras
## Note about distance

* Note: when performance is important, using magnitude can be a bad idea: it includes the costly square root operation
  * if you need to only compare magnitudes, or you're squaring it right away, use `.sqrMagnitude` instead!
## Exercise 1

make enemy shoot player when player is near.

## Vector3 & Vector2

* most of the examples apply to both Vector2 and Vector3 classes.
* Vector2
  * [Script Reference: Vector2](https://docs.unity3d.com/ScriptReference/Vector2.html)
* Vector3
  * [Script Reference: Vector3](https://docs.unity3d.com/ScriptReference/Vector3.html)
  * [Script Reference: Vector3 Dot product](https://docs.unity3d.com/ScriptReference/Vector3.Dot.html)
  * [Script Reference: Vector3 magnitude](https://docs.unity3d.com/ScriptReference/Vector3-magnitude.html)
* [Docs: Vector Arithmetic](https://docs.unity3d.com/2019.3/Documentation/Manual/UnderstandingVectorArithmetic.html)

## Reading & watching

* [Docs: Vector Cookbook](https://docs.unity3d.com/2019.3/Documentation/Manual/VectorCookbook.html)

* [Brackeys video: Vectors](https://www.youtube.com/watch?v=wXI9_olSrqo)

* [Freya Holmér video: Vectors & Dot Product](https://www.youtube.com/watch?v=MOYiVLEnhrw)