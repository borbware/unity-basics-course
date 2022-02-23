---
marp: true
---
<!-- class: invert -->
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
---
## Week project: Asteroids
<!-- class: default -->
<!-- backgroundColor: pink -->
-  Recreate the classic arcade game Asteroids in Unity.
     - [Youtube: Asteroids gameplay](https://www.youtube.com/watch?v=WYSupJ5r2zo)

Goal:
- ⭐ MVP: Create a playable single-screen game of Asteroids.
---
## Extra goals:
- ⭐⭐ Add one of the following features:
  - Hi scores & scoreboard
  - Randomized asteroid spawining
  - Level progression: new asteroids appear
  - Twin-stick: Use right stick to control the bullet direction 
- ⭐⭐⭐ Spice up the game: Add a game mechanic of your own

--- 
<!-- class: invert -->
<!-- backgroundColor: default -->
## Scripting GameObjects

See: [Unity basics 4: Scripting GameObjects](unity-basics/4-scripting-gameobjects.md)

---
## Input handling
See: [Input handling](unity-cookbook/input-handling.md)
  - GetButtonDown
  - GetAxis
---
- Vectors
  - vector * scalar
  - vector.up
  - vector.magnitude
- Physics
  - Rigidbody
    - .velocity
    - .angularVelocity
  - AddForce
  - AddTorque
- Math
  - Mathf.Abs
  - Mathf.Clamp

---
## Game math 1. Vectors

---
---
<!-- class:  default -->
## Exercise 0.

Examine the gameplay video, then play the example Unity-built Asteroids.

In you groups, write down:
- What features do you see? 
- How would you begin implementing them?
- Which feature would you implement first?

---
<!-- class: invert -->

- Playing Audio
- Singleton
- Instantiate and Destroy
- screen wrap
---
<!-- class:  default -->
## Exercise 1.

Create the Player controlled ship for the Asteroids game.

---
<!-- class: invert -->
### The ship
- Components
  - Sprite Renderer
  - Rigidbody2D
  - PolygonCollider
  - Audio Source
  - Scripts
    - Movement
    - Ship
    - WrapAround
    - BounceScale

- ShotPos
- ThrustPos
- ThrustParticles
  - Particle System
- Laser
  - Line Renderer
---
### Bullet

- SpriteRenderer
- Rigidbody2D
- Circle Collider 2D
- Bullet Script
- prefab
- instantiating
---
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
---
### Asteroids

- SpriteRenderer
- Circle Collider 2D
- Rigidbody 2D
- Asteroid Script
- WrapAround Script
- extra: generating a level

Friday: playtesting!
-> ideas to improve
