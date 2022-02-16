
# Game math 1: Vectors

## What are vectors

- vector is a mathematical thingy with length and direction
- can have multiple dimensions, in our case usually 2 or 3: x,y,(z)
- often represented with an arrow
- video games are bursting with vectors!
  - used for depicting position, velocity, acceleration, force....
  - in 2D, the position vector consists of the x and y components
    - the components are respective to the origin (0,0)

## Vector arithmetic

- [Docs: Understanding Vector Arithmetic](https://docs.unity3d.com/2019.3/Documentation/Manual/UnderstandingVectorArithmetic.html)
  - addition
  - subtraction
  - scalar multiplication
  - vector multiplication
    - dot product
    - cross product

## Velocity vectors
  - velocity vector: velocity_x and velocity_y components
    - `new_position = old_position + velocity`
    - vector addition!
    - usually depicted as starting from the moving object
    - but wait, vector does not say where it starts from!!

## Distance vectors

- distance vector between two objects
  - subtraction
  - vector_B - vector_A
  - length of the vector: pythagoras
  - vector2.Distance()

## Vector3 & Vector2

- Vector2
  - [Script Reference: Vector2](https://docs.unity3d.com/ScriptReference/Vector2.html)
- Vector3
  - [Script Reference: Vector3](https://docs.unity3d.com/ScriptReference/Vector3.html)
  - [Script Reference: Vector3 Dot product](https://docs.unity3d.com/ScriptReference/Vector3.Dot.html)
  - [Script Reference: Vector3 magnitude](https://docs.unity3d.com/ScriptReference/Vector3-magnitude.html)
    - Note: when performance is important, using magnitude can be a bad idea: it includes the costly square root operation
      - if you need to only compare magnitudes, or you're squaring it right away, use `.sqrMagnitude` instead!


- [Docs: Vector Arithmetic](https://docs.unity3d.com/2019.3/Documentation/Manual/UnderstandingVectorArithmetic.html)

---
## Reading & watching

- [Docs: Vector Cookbook](https://docs.unity3d.com/2019.3/Documentation/Manual/VectorCookbook.html)

- [Brackeys video: Vectors](https://www.youtube.com/watch?v=wXI9_olSrqo)

- [Freya Holmér video: Vectors & Dot Product](https://www.youtube.com/watch?v=MOYiVLEnhrw)