---
marp: true
paginate: true
---
<!-- headingDivider: 3 -->
<!-- class: default -->
# Week 2

## What to expect

* Unity basics (in 2d)
* Input
* Physics
* Collision
* Movement

## Week 2 Schedule

* Day 1
  * Unity cookbook: [Unity for 2D](unity-cookbook/2d.md), [Input handling](unity-cookbook/input-handling.md), [Physics](unity-cookbook/physics.md)
* Day 2:
  * [Programming 2: Lists and Loops](programming/2-lists-loops.md)
* Day 3:
  * [Math 0: Useful math functions](math/0-mathf.md)
  * Unity cookbook: [Audio](unity-cookbook/audio.md), [Particle system](unity-cookbook/particle-system.md), [Animation curve](unity-cookbook/animation-curve.md), [UI](unity-cookbook/UI.md)
* Day 4:
  * [Math 1: Vectors](math/1-vectors.md)
* Day 5: WP Wrap-up

# Day 1: 2D Movement

## Day 1 Schedule

* [Unity cookbook: Unity for 2D](unity-cookbook/2d.md)
* [Unity cookbook: Input handling](unity-cookbook/input-handling.md)
* [Unity cookbook: Physics](unity-cookbook/physics.md)

## Week project 2: Asteroids
<!-- _backgroundColor: lightgreen -->
*  Recreate the classic arcade game Asteroids in Unity.
     * [Youtube: Asteroids gameplay](https://www.youtube.com/watch?v=WYSupJ5r2zo)

Goal:
* ⭐ MVP: Create a playable single-screen game of Asteroids.
## Extra goals:
<!-- _backgroundColor: lightgreen -->
* ⭐⭐ Add one of the following features:
  * Hi scores & scoreboard
  * Randomized asteroid spawining
  * Level progression: new asteroids appear
  * Twin-stick: Use right stick to control the bullet direction 
* ⭐⭐⭐ Spice up the game: Add a game mechanic of your own


## WP exercise 0.
<!-- _backgroundColor: lightgreen -->
Examine the gameplay video, then play the example Unity-built Asteroids.

In you groups, write down:
* What features do you see? 
* How would you begin implementing them?
* Which feature would you implement first?

## WP exercise 1.
<!-- _backgroundColor: lightgreen -->

Create the Player controlled ship for the Asteroids game.



# Day 2: Programming 2
[Programming 2: Lists and Loops](programming/2-lists-loops.md)

# Day 3: Unity Components

## Day 3 Schedule

  * [Math 0: Useful math functions](math/0-mathf.md)
  * [Unity cookbook: Audio](unity-cookbook/audio.md)
  * [Unity cookbook: Particle system](unity-cookbook/particle-system.md)
  * [Unity cookbook: Animation curve](unity-cookbook/animation-curve.md)
  * [Unity cookbook: UI](unity-cookbook/UI.md)

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

