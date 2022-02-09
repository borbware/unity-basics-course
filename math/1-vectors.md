
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
