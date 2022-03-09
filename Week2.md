---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: invert -->
# Week 2

## What to expect

* Unity basics (in 2d)
* Input
* Physics
* Collision
* Movement

## Week 2 Schedule

* Day 1
  * Physics & Collision
  * Input Handling
* Day 2: Programming 2: Lists and loops
* Day 3: Components
* Day 4: 
* Day 5: WP Wrap-up

# Day 1: 2D Movement

## Day 1 Schedule

* Morning
  * Unity in 2D
  * Input handling
  * Physics
  * Useful math functions

## Unity for 2D

See: [Unity for 2D](unity-basics/4-unity-for-2d.md)

## Input handling

See: [Input handling](unity-cookbook/input-handling.md)

## Physics

See: [Physics](unity-cookbook/physics.md)

## Useful math functions

See: [Useful math functions](math/0-mathf.md)

## Week project 2: Asteroids
<!-- _backgroundColor: purple -->
*  Recreate the classic arcade game Asteroids in Unity.
     * [Youtube: Asteroids gameplay](https://www.youtube.com/watch?v=WYSupJ5r2zo)

Goal:
* ⭐ MVP: Create a playable single-screen game of Asteroids.
## Extra goals:
<!-- _backgroundColor: purple -->
* ⭐⭐ Add one of the following features:
  * Hi scores & scoreboard
  * Randomized asteroid spawining
  * Level progression: new asteroids appear
  * Twin-stick: Use right stick to control the bullet direction 
* ⭐⭐⭐ Spice up the game: Add a game mechanic of your own


## WP exercise 0.
<!-- _backgroundColor: purple -->
Examine the gameplay video, then play the example Unity-built Asteroids.

In you groups, write down:
* What features do you see? 
* How would you begin implementing them?
* Which feature would you implement first?

## WP exercise 1.
<!-- _backgroundColor: purple -->

Create the Player controlled ship for the Asteroids game.



# Day 2: Programming 2
[Programming 2: Lists and Loops](programming/2-lists-loops.md)

# Day 3: 



## Week Project Components

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


# Day 5: Playtesting

