# Week 2: Scripting & Game design

Emphasis: Learning C#
- Unity basics (in 2d)
- Rigidbodies
	- AddTorque
	- AddForce
- Collision
- Movement
- 2d physics
- [C# basics 2/2](#c-basics)
	- [Classes](#classes)
	- [Enums](#enums)
- [Unity basics 1/2](#unity-basics)
	- [Monobehaviour methods](#monobehaviour-methods)
	- [Getting Input](#getting-input)
	- [Important Unity classes 1/2](#important-unity-classes)
		- [GameObject](#gameobject)
		- [Transform](#transform)
		- [Vector3 & Vector2](#vector3--vector2)



## Game Math 1: Vectors

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

- [Docs: Vector Arithmetic](https://docs.unity3d.com/2019.3/Documentation/Manual/UnderstandingVectorArithmetic.html)

- [Freya Holmér video: Vectors & Dot Product](https://www.youtube.com/watch?v=MOYiVLEnhrw)
## Week project: Asteroids
- 1 screen, passive enemies
- Playing Audio
- Singleton
- Instantiate and Destroy
- Rigidbody
- screen wrap

- käy läpi asteroids et varmasti käydään kaikki läpi

### The ship
- Components
  - Scripts
    - Movement
    - Ship
    - WrapAround
    - BounceScale
  - Sprite Renderer
  - Rigidbody2D
  - PolygonCollider
  - Audio Source
- ShotPos
- ThrustPos
- ThrustParticles
  - Particle System
- Laser
  - Line Renderer

### Bullet

- SpriteRenderer
- Rigidbody2D
- Circle Collider 2D
- Bullet Script
- prefab
- instantiating

### The UI
- Main Camera
  - camera
  - flare layer
  - audio listener
- Canvas
  - Components
    - RectTransform
    - Graphic Raycaster
    - ScoreManager script
    - UI script
    - Life Gameobject
  - Life1..3
    - Canvas Renderer
    - Image
  - Score
    - Text

### Asteroids

- SpriteRenderer
- Circle Collider 2D
- Rigidbody 2D
- Asteroid Script
- WrapAround Script
- extra: generating a level

Friday: playtesting!
-> ideas to improve

