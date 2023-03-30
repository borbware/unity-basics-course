---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->

# Asteroids component listing

### The ship
* Components
  * Sprite Renderer
  * Rigidbody2D
  * PolygonCollider
  * Audio Source
  * Scripts
    * Movement
    * Ship
    * WrapAround
    * BounceScale
### Child components
* ShotPos
* ThrustPos
* ThrustParticles
  * Particle System
* Laser
  * Line Renderer
### Bullet

* SpriteRenderer
* Rigidbody2D
* Circle Collider 2D
* Bullet Script


* prefab
* instantiating
### The UI
* Main Camera
  * camera
  * flare layer
  * audio listener
### Canvas
  * Components
    * RectTransform
    * Graphic Raycaster
    * ScoreManager script
    * UI script
    * Life Gameobject
  * Life1..3
    * Canvas Renderer
    * Image
  * Score
    * Text
### Asteroids

* SpriteRenderer
* Circle Collider 2D
* Rigidbody 2D
* Asteroid Script
* WrapAround Script
* extra: generating a level