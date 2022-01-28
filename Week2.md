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